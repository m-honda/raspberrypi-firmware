#!/bin/bash -e

copy_files (){
	destdir="headers/usr/src/linux-headers-$version"
	mkdir -p "$destdir"
	mkdir -p "headers/lib/modules/$version"
	rsync -aHAX \
		--files-from=<(cd linux; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl) linux/ "$destdir/"
	rsync -aHAX \
		--files-from=<(cd linux; find arch/arm{,64}/include include scripts -type f) linux/ "$destdir/"
	rsync -aHAX \
		--files-from=<(cd linux; find arch/arm{,64} -name module.lds -o -name Kbuild.platforms -o -name Platform) linux/ "$destdir/"
	rsync -aHAX \
		--files-from=<(cd linux; find $(find arch/arm{,64} -name include -o -name scripts -type d) -type f) linux/ "$destdir/"
	rsync -aHAX \
		--files-from=<(cd linux; find arch/arm{,64}/include Module.symvers .config include scripts -type f) linux/ "$destdir/"
	ln -sf "/usr/src/linux-headers-$version" "headers/lib/modules/$version/build"
}

export ARCH
export CROSS_COMPILE

git fetch --all
if [ -n "$1" ]; then
	FIRMWARE_COMMIT="$1"
else
	FIRMWARE_COMMIT="$(git rev-parse upstream/stable)"
fi

git checkout stable
git merge "$FIRMWARE_COMMIT" --no-edit

DATE="$(git show -s --format=%ct "$FIRMWARE_COMMIT")"
DEBVER="$(date -d "@$DATE" -u +1.%Y%m%d-1~mtx1)"
RELEASE="$(date -d "@$DATE" -u +1.%Y%m%d)"

KERNEL_COMMIT="$(cat extra/git_hash)"

echo "Downloading linux (${KERNEL_COMMIT})..."
rm linux -rf
mkdir linux -p
if [ -e "../linux-${KERNEL_COMMIT}.tar.gz" ]; then
	tar xzf "../linux-${KERNEL_COMMIT}.tar.gz" -C linux --strip-components=1
else
	wget -qO- "https://github.com/mechatrax/linux/archive/${KERNEL_COMMIT}.tar.gz" | tar xz -C linux --strip-components=1
fi

echo Updating files...
echo "+" > linux/.scmversion
rm -rf headers

ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu-

version="$(cut -d ' ' -f 3 extra/uname_string8)"
(cd linux;  make distclean bcm2711_defconfig modules_prepare)
cp extra/Module8.symvers linux/Module.symvers
copy_files
(cd linux; make distclean)

ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf-

version="$(cut -d ' ' -f 3 extra/uname_string7l)"
(cd linux; make distclean bcm2711_defconfig modules_prepare)
cp extra/Module7l.symvers linux/Module.symvers
copy_files
(cd linux; make distclean)

version="$(cut -d ' ' -f 3 extra/uname_string7)"
(cd linux; make distclean bcm2709_defconfig modules_prepare)
cp extra/Module7.symvers linux/Module.symvers
copy_files
(cd linux; make distclean)

version="$(cut -d ' ' -f 3 extra/uname_string)"
(cd linux; make distclean bcmrpi_defconfig modules_prepare)
cp extra/Module.symvers linux/Module.symvers
copy_files
(cd linux; make distclean)

find headers -name .gitignore -delete
git add headers --all
git commit -m "Update headers" || echo "Headers not updated"
git tag -d "${RELEASE}-headers" || true
git tag "${RELEASE}-headers"
rm -rf linux

git checkout debian
git merge stable --no-edit -Xtheirs

(cd debian; ./gen_bootloader_postinst_preinst.sh)
dch "firmware as of ${FIRMWARE_COMMIT}"
dch -v "$DEBVER" -D buster --force-distribution "$(cut -f 1 -d'+' extra/uname_string)"
git commit -a -m "$RELEASE release"
git tag "$RELEASE" "$FIRMWARE_COMMIT"

gbp buildpackage -us -uc -sa -aarmhf
git clean -xdf

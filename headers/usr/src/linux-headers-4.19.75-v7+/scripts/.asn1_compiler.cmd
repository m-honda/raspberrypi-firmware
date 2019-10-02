cmd_scripts/asn1_compiler := gcc -Wp,-MD,scripts/.asn1_compiler.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89     -I./tools/include -I./include   -o scripts/asn1_compiler scripts/asn1_compiler.c   

source_scripts/asn1_compiler := scripts/asn1_compiler.c

deps_scripts/asn1_compiler := \
  /usr/include/stdc-predef.h \
  /usr/lib/gcc/aarch64-linux-gnu/8/include/stdarg.h \
  /usr/include/stdio.h \
  /usr/include/aarch64-linux-gnu/bits/libc-header-start.h \
  /usr/include/features.h \
  /usr/include/aarch64-linux-gnu/sys/cdefs.h \
  /usr/include/aarch64-linux-gnu/bits/wordsize.h \
  /usr/include/aarch64-linux-gnu/bits/long-double.h \
  /usr/include/aarch64-linux-gnu/gnu/stubs.h \
  /usr/include/aarch64-linux-gnu/gnu/stubs-lp64.h \
  /usr/lib/gcc/aarch64-linux-gnu/8/include/stddef.h \
  /usr/include/aarch64-linux-gnu/bits/types.h \
  /usr/include/aarch64-linux-gnu/bits/typesizes.h \
  /usr/include/aarch64-linux-gnu/bits/types/__fpos_t.h \
  /usr/include/aarch64-linux-gnu/bits/types/__mbstate_t.h \
  /usr/include/aarch64-linux-gnu/bits/types/__fpos64_t.h \
  /usr/include/aarch64-linux-gnu/bits/types/__FILE.h \
  /usr/include/aarch64-linux-gnu/bits/types/FILE.h \
  /usr/include/aarch64-linux-gnu/bits/types/struct_FILE.h \
  /usr/include/aarch64-linux-gnu/bits/stdio_lim.h \
  /usr/include/aarch64-linux-gnu/bits/sys_errlist.h \
  /usr/include/aarch64-linux-gnu/bits/stdio.h \
  /usr/include/stdlib.h \
  /usr/include/aarch64-linux-gnu/bits/waitflags.h \
  /usr/include/aarch64-linux-gnu/bits/waitstatus.h \
  /usr/include/aarch64-linux-gnu/bits/floatn.h \
  /usr/include/aarch64-linux-gnu/bits/floatn-common.h \
  /usr/include/aarch64-linux-gnu/sys/types.h \
  /usr/include/aarch64-linux-gnu/bits/types/clock_t.h \
  /usr/include/aarch64-linux-gnu/bits/types/clockid_t.h \
  /usr/include/aarch64-linux-gnu/bits/types/time_t.h \
  /usr/include/aarch64-linux-gnu/bits/types/timer_t.h \
  /usr/include/aarch64-linux-gnu/bits/stdint-intn.h \
  /usr/include/endian.h \
  /usr/include/aarch64-linux-gnu/bits/endian.h \
  /usr/include/aarch64-linux-gnu/bits/byteswap.h \
  /usr/include/aarch64-linux-gnu/bits/uintn-identity.h \
  /usr/include/aarch64-linux-gnu/sys/select.h \
  /usr/include/aarch64-linux-gnu/bits/select.h \
  /usr/include/aarch64-linux-gnu/bits/types/sigset_t.h \
  /usr/include/aarch64-linux-gnu/bits/types/__sigset_t.h \
  /usr/include/aarch64-linux-gnu/bits/types/struct_timeval.h \
  /usr/include/aarch64-linux-gnu/bits/types/struct_timespec.h \
  /usr/include/aarch64-linux-gnu/bits/pthreadtypes.h \
  /usr/include/aarch64-linux-gnu/bits/thread-shared-types.h \
  /usr/include/aarch64-linux-gnu/bits/pthreadtypes-arch.h \
  /usr/include/alloca.h \
  /usr/include/aarch64-linux-gnu/bits/stdlib-bsearch.h \
  /usr/include/aarch64-linux-gnu/bits/stdlib-float.h \
  /usr/lib/gcc/aarch64-linux-gnu/8/include/stdint.h \
  /usr/include/stdint.h \
  /usr/include/aarch64-linux-gnu/bits/wchar.h \
  /usr/include/aarch64-linux-gnu/bits/stdint-uintn.h \
  /usr/lib/gcc/aarch64-linux-gnu/8/include/stdbool.h \
  /usr/include/string.h \
  /usr/include/aarch64-linux-gnu/bits/types/locale_t.h \
  /usr/include/aarch64-linux-gnu/bits/types/__locale_t.h \
  /usr/include/strings.h \
  /usr/include/ctype.h \
  /usr/include/unistd.h \
  /usr/include/aarch64-linux-gnu/bits/posix_opt.h \
  /usr/include/aarch64-linux-gnu/bits/environments.h \
  /usr/include/aarch64-linux-gnu/bits/confname.h \
  /usr/include/aarch64-linux-gnu/bits/getopt_posix.h \
  /usr/include/aarch64-linux-gnu/bits/getopt_core.h \
  /usr/include/fcntl.h \
  /usr/include/aarch64-linux-gnu/bits/fcntl.h \
  /usr/include/aarch64-linux-gnu/bits/fcntl-linux.h \
  /usr/include/aarch64-linux-gnu/bits/stat.h \
  /usr/include/aarch64-linux-gnu/sys/stat.h \
  include/linux/asn1_ber_bytecode.h \
  include/linux/asn1.h \

scripts/asn1_compiler: $(deps_scripts/asn1_compiler)

$(deps_scripts/asn1_compiler):

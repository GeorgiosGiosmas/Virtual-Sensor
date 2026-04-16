savedcmd_vsensor.mod.o := /home/georgegio/buildroot/output/host/bin/arm-linux-gcc -Wp,-MMD,./.vsensor.mod.o.d -nostdinc -I/home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include -I/home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/generated -I/home/georgegio/buildroot/output/build/linux-6.18.7/include -I/home/georgegio/buildroot/output/build/linux-6.18.7/include -I/home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/uapi -I/home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/generated/uapi -I/home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi -I/home/georgegio/buildroot/output/build/linux-6.18.7/include/generated/uapi -include /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/compiler-version.h -include /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kconfig.h -include /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -D__LINUX_ARM_ARCH__=5 -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -fno-dwarf2-cfi-asm -mno-fdpic -fno-ipa-sra -mabi=aapcs-linux -mfpu=vfp -funwind-tables -marm -Wa,-mno-warn-deprecated -march=armv5te -mtune=arm9tdmi -msoft-float -Uarm -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fomit-frame-pointer -ftrivial-auto-var-init=zero -fno-stack-clash-protection -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fconserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=1280 -Wno-main -Wno-dangling-pointer -Wvla-larger-than=1 -Wno-pointer-sign -Wcast-function-type -Wno-array-bounds -Wno-stringop-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter  -DMODULE  -DKBUILD_BASENAME='"vsensor.mod"' -DKBUILD_MODNAME='"vsensor"' -D__KBUILD_MODNAME=kmod_vsensor -c -o vsensor.mod.o vsensor.mod.c  

source_vsensor.mod.o := vsensor.mod.c

deps_vsensor.mod.o := \
    $(wildcard include/config/MODULE_UNLOAD) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/compiler-version.h \
    $(wildcard include/config/CC_VERSION_TEXT) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kconfig.h \
    $(wildcard include/config/CPU_BIG_ENDIAN) \
    $(wildcard include/config/BOOGER) \
    $(wildcard include/config/FOO) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/compiler_types.h \
    $(wildcard include/config/DEBUG_INFO_BTF) \
    $(wildcard include/config/PAHOLE_HAS_BTF_TAG) \
    $(wildcard include/config/FUNCTION_ALIGNMENT) \
    $(wildcard include/config/CC_HAS_SANE_FUNCTION_ALIGNMENT) \
    $(wildcard include/config/X86_64) \
    $(wildcard include/config/ARM64) \
    $(wildcard include/config/LD_DEAD_CODE_DATA_ELIMINATION) \
    $(wildcard include/config/LTO_CLANG) \
    $(wildcard include/config/HAVE_ARCH_COMPILER_H) \
    $(wildcard include/config/CC_HAS_ASSUME) \
    $(wildcard include/config/CC_HAS_COUNTED_BY) \
    $(wildcard include/config/CC_HAS_MULTIDIMENSIONAL_NONSTRING) \
    $(wildcard include/config/UBSAN_INTEGER_WRAP) \
    $(wildcard include/config/CFI) \
    $(wildcard include/config/ARCH_USES_CFI_GENERIC_LLVM_PASS) \
    $(wildcard include/config/CC_HAS_ASM_INLINE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/compiler_attributes.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/compiler-gcc.h \
    $(wildcard include/config/ARCH_USE_BUILTIN_BSWAP) \
    $(wildcard include/config/SHADOW_CALL_STACK) \
    $(wildcard include/config/KCOV) \
    $(wildcard include/config/CC_HAS_TYPEOF_UNQUAL) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/module.h \
    $(wildcard include/config/MODULES) \
    $(wildcard include/config/SYSFS) \
    $(wildcard include/config/MODULES_TREE_LOOKUP) \
    $(wildcard include/config/LIVEPATCH) \
    $(wildcard include/config/STACKTRACE_BUILD_ID) \
    $(wildcard include/config/ARCH_USES_CFI_TRAPS) \
    $(wildcard include/config/MODULE_SIG) \
    $(wildcard include/config/GENERIC_BUG) \
    $(wildcard include/config/KALLSYMS) \
    $(wildcard include/config/SMP) \
    $(wildcard include/config/TRACEPOINTS) \
    $(wildcard include/config/TREE_SRCU) \
    $(wildcard include/config/BPF_EVENTS) \
    $(wildcard include/config/DEBUG_INFO_BTF_MODULES) \
    $(wildcard include/config/JUMP_LABEL) \
    $(wildcard include/config/TRACING) \
    $(wildcard include/config/EVENT_TRACING) \
    $(wildcard include/config/DYNAMIC_FTRACE) \
    $(wildcard include/config/KPROBES) \
    $(wildcard include/config/HAVE_STATIC_CALL_INLINE) \
    $(wildcard include/config/KUNIT) \
    $(wildcard include/config/PRINTK_INDEX) \
    $(wildcard include/config/CONSTRUCTORS) \
    $(wildcard include/config/FUNCTION_ERROR_INJECTION) \
    $(wildcard include/config/DYNAMIC_DEBUG_CORE) \
    $(wildcard include/config/MITIGATION_RETPOLINE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/list.h \
    $(wildcard include/config/LIST_HARDENED) \
    $(wildcard include/config/DEBUG_LIST) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/container_of.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/build_bug.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/compiler.h \
    $(wildcard include/config/TRACE_BRANCH_PROFILING) \
    $(wildcard include/config/PROFILE_ALL_BRANCHES) \
    $(wildcard include/config/OBJTOOL) \
    $(wildcard include/config/64BIT) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/generated/asm/rwonce.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/rwonce.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kasan-checks.h \
    $(wildcard include/config/KASAN_GENERIC) \
    $(wildcard include/config/KASAN_SW_TAGS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/types.h \
    $(wildcard include/config/HAVE_UID16) \
    $(wildcard include/config/UID16) \
    $(wildcard include/config/ARCH_DMA_ADDR_T_64BIT) \
    $(wildcard include/config/PHYS_ADDR_T_64BIT) \
    $(wildcard include/config/ARCH_32BIT_USTAT_F_TINODE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/uapi/asm/types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/int-ll64.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/asm-generic/int-ll64.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/generated/uapi/asm/bitsperlong.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitsperlong.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/asm-generic/bitsperlong.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/posix_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/stddef.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/stddef.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/uapi/asm/posix_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/asm-generic/posix_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kcsan-checks.h \
    $(wildcard include/config/KCSAN) \
    $(wildcard include/config/KCSAN_WEAK_MEMORY) \
    $(wildcard include/config/KCSAN_IGNORE_ATOMICS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/poison.h \
    $(wildcard include/config/ILLEGAL_POINTER_VALUE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/const.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/vdso/const.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/const.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/CPU_32v6K) \
    $(wildcard include/config/THUMB2_KERNEL) \
    $(wildcard include/config/CPU_XSC3) \
    $(wildcard include/config/CPU_FA526) \
    $(wildcard include/config/ARM_HEAVY_MB) \
    $(wildcard include/config/ARM_DMA_MEM_BUFFERABLE) \
    $(wildcard include/config/CPU_SPECTRE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/barrier.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/stat.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/uapi/asm/stat.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/stat.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/time.h \
    $(wildcard include/config/POSIX_TIMERS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/cache.h \
    $(wildcard include/config/ARCH_HAS_CACHE_LINE_SIZE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/kernel.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/sysinfo.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/vdso/cache.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/cache.h \
    $(wildcard include/config/ARM_L1_CACHE_SHIFT) \
    $(wildcard include/config/AEABI) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/math64.h \
    $(wildcard include/config/ARCH_SUPPORTS_INT128) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/math.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/div64.h \
    $(wildcard include/config/CC_OPTIMIZE_FOR_PERFORMANCE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/compiler.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/div64.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/log2.h \
    $(wildcard include/config/ARCH_HAS_ILOG2_U32) \
    $(wildcard include/config/ARCH_HAS_ILOG2_U64) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/bitops.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/bits.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/vdso/bits.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/bits.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/overflow.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/limits.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/limits.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/vdso/limits.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/typecheck.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/generic-non-atomic.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/bitops.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/irqflags.h \
    $(wildcard include/config/PROVE_LOCKING) \
    $(wildcard include/config/TRACE_IRQFLAGS) \
    $(wildcard include/config/PREEMPT_RT) \
    $(wildcard include/config/IRQSOFF_TRACER) \
    $(wildcard include/config/PREEMPT_TRACER) \
    $(wildcard include/config/DEBUG_IRQFLAGS) \
    $(wildcard include/config/TRACE_IRQFLAGS_SUPPORT) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/irqflags_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/cleanup.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/err.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/generated/uapi/asm/errno.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/asm-generic/errno.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/asm-generic/errno-base.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/args.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/irqflags.h \
    $(wildcard include/config/CPU_V7M) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/ARM_THUMB) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/CPU_ENDIAN_BE8) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/hwcap.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/uapi/asm/hwcap.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/bitfield.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/uapi/asm/byteorder.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/byteorder/little_endian.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/byteorder/little_endian.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/swab.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/swab.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/swab.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/uapi/asm/swab.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/byteorder/generic.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/irqflags.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/percpu.h \
    $(wildcard include/config/CPU_V6) \
    $(wildcard include/config/ARM_HAS_GROUP_RELOCS) \
    $(wildcard include/config/ARM_MODULE_PLTS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/insn.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/percpu.h \
    $(wildcard include/config/DEBUG_PREEMPT) \
    $(wildcard include/config/HAVE_SETUP_PER_CPU_AREA) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/threads.h \
    $(wildcard include/config/NR_CPUS) \
    $(wildcard include/config/BASE_SMALL) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/percpu-defs.h \
    $(wildcard include/config/ARCH_MODULE_NEEDS_WEAK_PER_CPU) \
    $(wildcard include/config/DEBUG_FORCE_WEAK_PER_CPU) \
    $(wildcard include/config/AMD_MEM_ENCRYPT) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/non-atomic.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/non-instrumented-non-atomic.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/builtin-__fls.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/builtin-__ffs.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/builtin-fls.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/builtin-ffs.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/ffz.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/fls64.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/sched.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/hweight.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/arch_hweight.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/const_hweight.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/lock.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/atomic.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/atomic.h \
    $(wildcard include/config/GENERIC_ATOMIC64) \
    $(wildcard include/config/ARM_LPAE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/prefetch.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/processor.h \
    $(wildcard include/config/HAVE_HW_BREAKPOINT) \
    $(wildcard include/config/BINFMT_ELF_FDPIC) \
    $(wildcard include/config/MMU) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/hw_breakpoint.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/unified.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/vdso/processor.h \
    $(wildcard include/config/ARM_ERRATA_754327) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/CPU_SA1100) \
    $(wildcard include/config/CPU_SA110) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/cmpxchg-emu.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/cmpxchg-local.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/cmpxchg.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/atomic/atomic-arch-fallback.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/atomic64.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/atomic/atomic-long.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/atomic/atomic-instrumented.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/instrumented.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kmsan-checks.h \
    $(wildcard include/config/KMSAN) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/instrumented-lock.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/le.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/vdso/math64.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/time64.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/vdso/time64.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/time.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/time_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/time32.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/timex.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/timex.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/param.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/generated/uapi/asm/param.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/param.h \
    $(wildcard include/config/HZ) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/asm-generic/param.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/timex.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/vdso/time32.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/vdso/time.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/uidgid.h \
    $(wildcard include/config/MULTIUSER) \
    $(wildcard include/config/USER_NS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/uidgid_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/highuid.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/buildid.h \
    $(wildcard include/config/VMCORE_INFO) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kmod.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/umh.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/gfp.h \
    $(wildcard include/config/HIGHMEM) \
    $(wildcard include/config/ZONE_DMA) \
    $(wildcard include/config/ZONE_DMA32) \
    $(wildcard include/config/ZONE_DEVICE) \
    $(wildcard include/config/NUMA) \
    $(wildcard include/config/COMPACTION) \
    $(wildcard include/config/CONTIG_ALLOC) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/gfp_types.h \
    $(wildcard include/config/KASAN_HW_TAGS) \
    $(wildcard include/config/LOCKDEP) \
    $(wildcard include/config/SLAB_OBJ_EXT) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/mmzone.h \
    $(wildcard include/config/ARCH_FORCE_MAX_ORDER) \
    $(wildcard include/config/PAGE_BLOCK_MAX_ORDER) \
    $(wildcard include/config/CMA) \
    $(wildcard include/config/MEMORY_ISOLATION) \
    $(wildcard include/config/ZSMALLOC) \
    $(wildcard include/config/UNACCEPTED_MEMORY) \
    $(wildcard include/config/IOMMU_SUPPORT) \
    $(wildcard include/config/SWAP) \
    $(wildcard include/config/NUMA_BALANCING) \
    $(wildcard include/config/HUGETLB_PAGE) \
    $(wildcard include/config/TRANSPARENT_HUGEPAGE) \
    $(wildcard include/config/LRU_GEN) \
    $(wildcard include/config/LRU_GEN_STATS) \
    $(wildcard include/config/LRU_GEN_WALKS_MMU) \
    $(wildcard include/config/MEMCG) \
    $(wildcard include/config/SPARSEMEM) \
    $(wildcard include/config/MEMORY_HOTPLUG) \
    $(wildcard include/config/MEMORY_FAILURE) \
    $(wildcard include/config/FLATMEM) \
    $(wildcard include/config/PAGE_EXTENSION) \
    $(wildcard include/config/DEFERRED_STRUCT_PAGE_INIT) \
    $(wildcard include/config/HAVE_MEMORYLESS_NODES) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP) \
    $(wildcard include/config/SPARSEMEM_EXTREME) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP_PREINIT) \
    $(wildcard include/config/HAVE_ARCH_PFN_VALID) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/spinlock.h \
    $(wildcard include/config/DEBUG_SPINLOCK) \
    $(wildcard include/config/PREEMPTION) \
    $(wildcard include/config/DEBUG_LOCK_ALLOC) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/preempt.h \
    $(wildcard include/config/PREEMPT_COUNT) \
    $(wildcard include/config/TRACE_PREEMPT_TOGGLE) \
    $(wildcard include/config/PREEMPT_NOTIFIERS) \
    $(wildcard include/config/PREEMPT_DYNAMIC) \
    $(wildcard include/config/PREEMPT_NONE) \
    $(wildcard include/config/PREEMPT_VOLUNTARY) \
    $(wildcard include/config/PREEMPT) \
    $(wildcard include/config/PREEMPT_LAZY) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/linkage.h \
    $(wildcard include/config/ARCH_USE_SYM_ANNOTATIONS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/stringify.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/export.h \
    $(wildcard include/config/MODVERSIONS) \
    $(wildcard include/config/GENDWARFKSYMS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/linkage.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/generated/asm/preempt.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/preempt.h \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_KEY) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/thread_info.h \
    $(wildcard include/config/THREAD_INFO_IN_TASK) \
    $(wildcard include/config/GENERIC_ENTRY) \
    $(wildcard include/config/ARCH_HAS_PREEMPT_LAZY) \
    $(wildcard include/config/HAVE_ARCH_WITHIN_STACK_FRAMES) \
    $(wildcard include/config/SH) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/bug.h \
    $(wildcard include/config/PRINTK) \
    $(wildcard include/config/BUG_ON_DATA_CORRUPTION) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/bug.h \
    $(wildcard include/config/DEBUG_BUGVERBOSE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/CPU_ENDIAN_BE32) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/bug.h \
    $(wildcard include/config/BUG) \
    $(wildcard include/config/GENERIC_BUG_RELATIVE_POINTERS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/instrumentation.h \
    $(wildcard include/config/NOINSTR_VALIDATION) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/once_lite.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/panic.h \
    $(wildcard include/config/PANIC_TIMEOUT) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/stdarg.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/printk.h \
    $(wildcard include/config/MESSAGE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_QUIET) \
    $(wildcard include/config/EARLY_PRINTK) \
    $(wildcard include/config/DYNAMIC_DEBUG) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/init.h \
    $(wildcard include/config/HAVE_ARCH_PREL32_RELOCATIONS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kern_levels.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/ratelimit_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/spinlock_types_raw.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/spinlock_types_up.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/lockdep_types.h \
    $(wildcard include/config/PROVE_RAW_LOCK_NESTING) \
    $(wildcard include/config/LOCK_STAT) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/restart_block.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/errno.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/errno.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/current.h \
    $(wildcard include/config/CURRENT_POINTER_IN_TPIDRURO) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/KASAN) \
    $(wildcard include/config/VMAP_STACK) \
    $(wildcard include/config/ARM_THUMBEE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/VFPv3) \
    $(wildcard include/config/IWMMXT) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/page.h \
    $(wildcard include/config/CPU_COPY_V4WT) \
    $(wildcard include/config/CPU_COPY_V4WB) \
    $(wildcard include/config/CPU_COPY_FEROCEON) \
    $(wildcard include/config/CPU_COPY_FA) \
    $(wildcard include/config/CPU_XSCALE) \
    $(wildcard include/config/CPU_COPY_V6) \
    $(wildcard include/config/KUSER_HELPERS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/vdso/page.h \
    $(wildcard include/config/PAGE_SHIFT) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/glue.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/pgtable-2level-types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/memory.h \
    $(wildcard include/config/NEED_MACH_MEMORY_H) \
    $(wildcard include/config/PAGE_OFFSET) \
    $(wildcard include/config/DRAM_BASE) \
    $(wildcard include/config/DRAM_SIZE) \
    $(wildcard include/config/XIP_KERNEL) \
    $(wildcard include/config/HAVE_TCM) \
    $(wildcard include/config/ARM_PATCH_PHYS_VIRT) \
    $(wildcard include/config/PHYS_OFFSET) \
    $(wildcard include/config/DEBUG_VIRTUAL) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/sizes.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/kasan_def.h \
    $(wildcard include/config/KASAN_SHADOW_OFFSET) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/getorder.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/memory_model.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/pfn.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/traps.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/bottom_half.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/instruction_pointer.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/lockdep.h \
    $(wildcard include/config/DEBUG_LOCKING_API_SELFTESTS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/smp.h \
    $(wildcard include/config/UP_LATE_INIT) \
    $(wildcard include/config/CSD_LOCK_WAIT_DEBUG) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/cpumask.h \
    $(wildcard include/config/FORCE_NR_CPUS) \
    $(wildcard include/config/HOTPLUG_CPU) \
    $(wildcard include/config/DEBUG_PER_CPU_MAPS) \
    $(wildcard include/config/CPUMASK_OFFSTACK) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kernel.h \
    $(wildcard include/config/PREEMPT_VOLUNTARY_BUILD) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_CALL) \
    $(wildcard include/config/PREEMPT_) \
    $(wildcard include/config/DEBUG_ATOMIC_SLEEP) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/align.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/vdso/align.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/array_size.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/hex.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kstrtox.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/minmax.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/sprintf.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/static_call_types.h \
    $(wildcard include/config/HAVE_STATIC_CALL) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/util_macros.h \
    $(wildcard include/config/FOO_SUSPEND) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/wordpart.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/bitmap.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/find.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/string.h \
    $(wildcard include/config/BINARY_PRINTF) \
    $(wildcard include/config/FORTIFY_SOURCE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/string.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/string.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/bitmap-str.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/cpumask_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/numa.h \
    $(wildcard include/config/NUMA_KEEP_MEMINFO) \
    $(wildcard include/config/HAVE_ARCH_NODE_DEV_GROUP) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/nodemask.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/nodemask_types.h \
    $(wildcard include/config/NODES_SHIFT) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/random.h \
    $(wildcard include/config/VMGENID) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/random.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/ioctl.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/generated/uapi/asm/ioctl.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/ioctl.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/asm-generic/ioctl.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/irqnr.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/irqnr.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/smp_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/llist.h \
    $(wildcard include/config/ARCH_HAVE_NMI_SAFE_CMPXCHG) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/generated/asm/mmiowb.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/mmiowb.h \
    $(wildcard include/config/MMIOWB) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/spinlock_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/rwlock_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/spinlock_up.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/rwlock.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/spinlock_api_up.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/list_nulls.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/wait.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/seqlock.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/mutex.h \
    $(wildcard include/config/DEBUG_MUTEXES) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/osq_lock.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/debug_locks.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/mutex_types.h \
    $(wildcard include/config/MUTEX_SPIN_ON_OWNER) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/seqlock_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/pageblock-flags.h \
    $(wildcard include/config/HUGETLB_PAGE_SIZE_VARIABLE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/page-flags-layout.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/generated/bounds.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/mm_types.h \
    $(wildcard include/config/HAVE_ALIGNED_STRUCT_PAGE) \
    $(wildcard include/config/HUGETLB_PMD_PAGE_TABLE_SHARING) \
    $(wildcard include/config/SLAB_FREELIST_HARDENED) \
    $(wildcard include/config/USERFAULTFD) \
    $(wildcard include/config/ANON_VMA_NAME) \
    $(wildcard include/config/PER_VMA_LOCK) \
    $(wildcard include/config/SCHED_MM_CID) \
    $(wildcard include/config/HAVE_ARCH_COMPAT_MMAP_BASES) \
    $(wildcard include/config/MEMBARRIER) \
    $(wildcard include/config/FUTEX_PRIVATE_HASH) \
    $(wildcard include/config/ARCH_HAS_ELF_CORE_EFLAGS) \
    $(wildcard include/config/AIO) \
    $(wildcard include/config/MMU_NOTIFIER) \
    $(wildcard include/config/SPLIT_PMD_PTLOCKS) \
    $(wildcard include/config/ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH) \
    $(wildcard include/config/IOMMU_MM_DATA) \
    $(wildcard include/config/KSM) \
    $(wildcard include/config/MM_ID) \
    $(wildcard include/config/CORE_DUMP_DEFAULT_ELF_HEADERS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/mm_types_task.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/auxvec.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/auxvec.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/auxvec.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/uapi/asm/auxvec.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kref.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/refcount.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/refcount_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/rbtree.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/rbtree_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/rcupdate.h \
    $(wildcard include/config/PREEMPT_RCU) \
    $(wildcard include/config/TINY_RCU) \
    $(wildcard include/config/RCU_STRICT_GRACE_PERIOD) \
    $(wildcard include/config/RCU_LAZY) \
    $(wildcard include/config/RCU_STALL_COMMON) \
    $(wildcard include/config/NO_HZ_FULL) \
    $(wildcard include/config/VIRT_XFER_TO_GUEST_WORK) \
    $(wildcard include/config/RCU_NOCB_CPU) \
    $(wildcard include/config/TASKS_RCU_GENERIC) \
    $(wildcard include/config/TASKS_RCU) \
    $(wildcard include/config/TASKS_TRACE_RCU) \
    $(wildcard include/config/TASKS_RUDE_RCU) \
    $(wildcard include/config/TREE_RCU) \
    $(wildcard include/config/DEBUG_OBJECTS_RCU_HEAD) \
    $(wildcard include/config/PROVE_RCU) \
    $(wildcard include/config/ARCH_WEAK_RELEASE_ACQUIRE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/sched.h \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_NATIVE) \
    $(wildcard include/config/SCHED_INFO) \
    $(wildcard include/config/SCHEDSTATS) \
    $(wildcard include/config/SCHED_CORE) \
    $(wildcard include/config/FAIR_GROUP_SCHED) \
    $(wildcard include/config/RT_GROUP_SCHED) \
    $(wildcard include/config/RT_MUTEXES) \
    $(wildcard include/config/UCLAMP_TASK) \
    $(wildcard include/config/UCLAMP_BUCKETS_COUNT) \
    $(wildcard include/config/KMAP_LOCAL) \
    $(wildcard include/config/MEM_ALLOC_PROFILING) \
    $(wildcard include/config/SCHED_CLASS_EXT) \
    $(wildcard include/config/CGROUP_SCHED) \
    $(wildcard include/config/CFS_BANDWIDTH) \
    $(wildcard include/config/BLK_DEV_IO_TRACE) \
    $(wildcard include/config/MEMCG_V1) \
    $(wildcard include/config/COMPAT_BRK) \
    $(wildcard include/config/CGROUPS) \
    $(wildcard include/config/BLK_CGROUP) \
    $(wildcard include/config/PSI) \
    $(wildcard include/config/PAGE_OWNER) \
    $(wildcard include/config/EVENTFD) \
    $(wildcard include/config/ARCH_HAS_CPU_PASID) \
    $(wildcard include/config/X86_BUS_LOCK_DETECT) \
    $(wildcard include/config/TASK_DELAY_ACCT) \
    $(wildcard include/config/STACKPROTECTOR) \
    $(wildcard include/config/ARCH_HAS_SCALED_CPUTIME) \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_GEN) \
    $(wildcard include/config/POSIX_CPUTIMERS) \
    $(wildcard include/config/POSIX_CPU_TIMERS_TASK_WORK) \
    $(wildcard include/config/KEYS) \
    $(wildcard include/config/SYSVIPC) \
    $(wildcard include/config/DETECT_HUNG_TASK) \
    $(wildcard include/config/IO_URING) \
    $(wildcard include/config/AUDIT) \
    $(wildcard include/config/AUDITSYSCALL) \
    $(wildcard include/config/DETECT_HUNG_TASK_BLOCKER) \
    $(wildcard include/config/UBSAN) \
    $(wildcard include/config/UBSAN_TRAP) \
    $(wildcard include/config/TASK_XACCT) \
    $(wildcard include/config/CPUSETS) \
    $(wildcard include/config/X86_CPU_RESCTRL) \
    $(wildcard include/config/FUTEX) \
    $(wildcard include/config/COMPAT) \
    $(wildcard include/config/PERF_EVENTS) \
    $(wildcard include/config/RSEQ) \
    $(wildcard include/config/DEBUG_RSEQ) \
    $(wildcard include/config/FAULT_INJECTION) \
    $(wildcard include/config/LATENCYTOP) \
    $(wildcard include/config/FUNCTION_GRAPH_TRACER) \
    $(wildcard include/config/UPROBES) \
    $(wildcard include/config/BCACHE) \
    $(wildcard include/config/SECURITY) \
    $(wildcard include/config/BPF_SYSCALL) \
    $(wildcard include/config/KSTACK_ERASE) \
    $(wildcard include/config/KSTACK_ERASE_METRICS) \
    $(wildcard include/config/X86_MCE) \
    $(wildcard include/config/KRETPROBES) \
    $(wildcard include/config/RETHOOK) \
    $(wildcard include/config/ARCH_HAS_PARANOID_L1D_FLUSH) \
    $(wildcard include/config/RV) \
    $(wildcard include/config/RV_PER_TASK_MONITORS) \
    $(wildcard include/config/USER_EVENTS) \
    $(wildcard include/config/UNWIND_USER) \
    $(wildcard include/config/SCHED_PROXY_EXEC) \
    $(wildcard include/config/MEM_ALLOC_PROFILING_DEBUG) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/sched.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/pid_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/sem_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/shm.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/shmparam.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kmsan_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/plist_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/hrtimer_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/timerqueue_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/timer_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/seccomp_types.h \
    $(wildcard include/config/SECCOMP) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/resource.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/resource.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/generated/uapi/asm/resource.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/resource.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/asm-generic/resource.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/latencytop.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/sched/prio.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/sched/types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/signal_types.h \
    $(wildcard include/config/OLD_SIGACTION) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/signal.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/signal.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/uapi/asm/signal.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/asm-generic/signal-defs.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/uapi/asm/sigcontext.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/generated/uapi/asm/siginfo.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/asm-generic/siginfo.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/syscall_user_dispatch_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/netdevice_xmit.h \
    $(wildcard include/config/NET_EGRESS) \
    $(wildcard include/config/NET_ACT_MIRRED) \
    $(wildcard include/config/NF_DUP_NETDEV) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/task_io_accounting.h \
    $(wildcard include/config/TASK_IO_ACCOUNTING) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/posix-timers_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/rseq.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kcsan.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/rv.h \
    $(wildcard include/config/RV_LTL_MONITOR) \
    $(wildcard include/config/RV_REACTORS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/tracepoint-defs.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/static_key.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/jump_label.h \
    $(wildcard include/config/HAVE_ARCH_JUMP_LABEL_RELATIVE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/unwind_deferred_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/generated/asm/kmap_size.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/kmap_size.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/generated/rq-offsets.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/sched/ext.h \
    $(wildcard include/config/EXT_GROUP_SCHED) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/context_tracking_irq.h \
    $(wildcard include/config/CONTEXT_TRACKING_IDLE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/rcutiny.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/maple_tree.h \
    $(wildcard include/config/MAPLE_RCU_DISABLED) \
    $(wildcard include/config/DEBUG_MAPLE_TREE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/rwsem.h \
    $(wildcard include/config/RWSEM_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_RWSEMS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/completion.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/swait.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/uprobes.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/timer.h \
    $(wildcard include/config/DEBUG_OBJECTS_TIMERS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/ktime.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/jiffies.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/vdso/jiffies.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/generated/timeconst.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/vdso/ktime.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/timekeeping.h \
    $(wildcard include/config/POSIX_AUX_CLOCKS) \
    $(wildcard include/config/GENERIC_CMOS_UPDATE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/clocksource_ids.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/debugobjects.h \
    $(wildcard include/config/DEBUG_OBJECTS) \
    $(wildcard include/config/DEBUG_OBJECTS_FREE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/workqueue.h \
    $(wildcard include/config/DEBUG_OBJECTS_WORK) \
    $(wildcard include/config/FREEZER) \
    $(wildcard include/config/WQ_WATCHDOG) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/alloc_tag.h \
    $(wildcard include/config/MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/codetag.h \
    $(wildcard include/config/CODE_TAGGING) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/workqueue_types.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/percpu_counter.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/percpu.h \
    $(wildcard include/config/RANDOM_KMALLOC_CACHES) \
    $(wildcard include/config/PAGE_SIZE_4KB) \
    $(wildcard include/config/NEED_PER_CPU_PAGE_FIRST_CHUNK) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/mmdebug.h \
    $(wildcard include/config/DEBUG_VM) \
    $(wildcard include/config/DEBUG_VM_IRQSOFF) \
    $(wildcard include/config/DEBUG_VM_PGFLAGS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/CPU_HAS_ASID) \
    $(wildcard include/config/VDSO) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/page-flags.h \
    $(wildcard include/config/PAGE_IDLE_FLAG) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_2) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_3) \
    $(wildcard include/config/MIGRATION) \
    $(wildcard include/config/HUGETLB_PAGE_OPTIMIZE_VMEMMAP) \
    $(wildcard include/config/DEBUG_KMAP_LOCAL_FORCE_MAP) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/local_lock.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/local_lock_internal.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/zswap.h \
    $(wildcard include/config/ZSWAP) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/memory_hotplug.h \
    $(wildcard include/config/ARCH_HAS_ADD_PAGES) \
    $(wildcard include/config/MEMORY_HOTREMOVE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/notifier.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/srcu.h \
    $(wildcard include/config/TINY_SRCU) \
    $(wildcard include/config/NEED_SRCU_NMI_SAFE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/rcu_segcblist.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/srcutiny.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/topology.h \
    $(wildcard include/config/USE_PERCPU_NUMA_NODE_ID) \
    $(wildcard include/config/SCHED_SMT) \
    $(wildcard include/config/GENERIC_ARCH_TOPOLOGY) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/arch_topology.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/topology.h \
    $(wildcard include/config/ARM_CPU_TOPOLOGY) \
    $(wildcard include/config/BL_SWITCHER) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/topology.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/sysctl.h \
    $(wildcard include/config/SYSCTL) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/sysctl.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/elf.h \
    $(wildcard include/config/ARCH_HAVE_EXTRA_ELF_NOTES) \
    $(wildcard include/config/ARCH_USE_GNU_PROPERTY) \
    $(wildcard include/config/ARCH_HAVE_ELF_PROT) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/elf.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/user.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/elf.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/uapi/linux/elf-em.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kobject.h \
    $(wildcard include/config/UEVENT_HELPER) \
    $(wildcard include/config/DEBUG_KOBJECT_RELEASE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/sysfs.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kernfs.h \
    $(wildcard include/config/KERNFS) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/idr.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/radix-tree.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/xarray.h \
    $(wildcard include/config/XARRAY_MULTI) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/sched/mm.h \
    $(wildcard include/config/MMU_LAZY_TLB_REFCOUNT) \
    $(wildcard include/config/ARCH_HAS_MEMBARRIER_CALLBACKS) \
    $(wildcard include/config/ARCH_HAS_SYNC_CORE_BEFORE_USERMODE) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/sync_core.h \
    $(wildcard include/config/ARCH_HAS_PREPARE_SYNC_CORE_CMD) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/sched/coredump.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/kobject_ns.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/moduleparam.h \
    $(wildcard include/config/ALPHA) \
    $(wildcard include/config/PPC64) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/rbtree_latch.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/error-injection.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/error-injection.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/dynamic_debug.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/module.h \
    $(wildcard include/config/ARM_UNWIND) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/asm-generic/module.h \
    $(wildcard include/config/HAVE_MOD_ARCH_SPECIFIC) \
  /home/georgegio/buildroot/output/build/linux-6.18.7/arch/arm/include/asm/unwind.h \
  /home/georgegio/buildroot/output/build/linux-6.18.7/include/linux/export-internal.h \
    $(wildcard include/config/PARISC) \

vsensor.mod.o: $(deps_vsensor.mod.o)

$(deps_vsensor.mod.o):

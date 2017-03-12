# GCC compiler optimization for ARM-based systems

2017-03-03 fm4dd

## Background

The gcc compiler can optimize code by taking advantage of CPU specific features. Especially for ARM CPU's, this can have impact on application performance. ARM CPU's, even under the same architecture, could be implemented with different versions of floating point units (FPU). Utilizing full FPU potential improves performance of heavier operating systems such as full Linux distributions.

## Defining the CPU type and architecture: -mcpu, -march

These flags can both be used to set the CPU type. Setting one or the other is sufficient.

GCC supports all Cortex-A processors up to A15 (2010). Example are 'cortex-a5', 'cortex-a7', 'cortex-a8', 'cortex-a9', 'cortex-a15'. For specific values on popular boards see table below.

## Defining the floating-point support: -mfloat-abi, -mfpu

All recent ARM processors available today come with a floating-point unit called vector floating-point VFP. Most also have a SIMD co-processor called NEON. Confusingly, both are types of floating point units. VFP is older, IEEE-754 compliant and provides double precision (64bit). NEON is a multi-function coprocessor for audio and video processing. In older ARM versions, NEON only has single precision (32bit) vector functionality, but got double precision in its latest versions.

To let the compiler optimize code, we need to set the application binary interface (ABI) type and floating point unit (FPU) type, using flags -mfloat-abi and -mfpu.

ARM offers different FPU/NEON choices for 32-bit CPUs, hence we have a combination of -mfpu type options that need to match the exact CPU type and revision. Some FPU/NEON combinations have an alias: 'neon-vfpv3' is aliased to 'neon' and 'vfpv2' is aliased to  'vfp'. -mfpu and -mfloat-abi are important flags. By default, no FPU optimization is done, and gcc will only use floating-point/NEON instructions if it is explicitly told to do so. It is also important to set both flags: -mfpu in combination with -mfloat-abi.

-mfloat-abi sets the overall strategy for floating point code compilation. It has only three values: 'soft', 'softfp', or 'hard'. ‘soft’ generates library calls for floating-point operations. ‘softfp’ allows the generation of code using hardware floating-point instructions, but still uses the soft-float calling conventions. 'hard' generates floating-point instructions with FPU-specific calling conventions.

### Other options that "can" improve performance

-mtune This flag can further improve performance by setting the CPU type to a specific CPU model. For example, on a Raspberry Pi 1, it could be set to -mtune=arm1176jzf-s.

-mneon-for-64bits lets Neon handle scalar 64-bits operations. This flag has no arguments. It is disabled by default due to high cost of moving data from core registers to Neon on 32bit CPU's.

-funsafe-math-optimizations can improve floating point performance by letting it run through NEON. Use of NEON instructions may lead to a loss of precision, because older NEON versions have only single precision.

-munaligned-access, -mno-unaligned-access
Enables (or disables) reading and writing of 16- and 32- bit values from addresses that are not 16- or 32- bit aligned. The CPU type defines the correct default, and changing it may negatively impact performance. 

Pre-ARMv6, ARMv6-M, and ARMv8-M default to -mno-unaligned-access. -munaligned-access is default for all other architectures. If unaligned access is not enabled, then words in packed data structures are accessed one byte at a time.

## Flags that don't need to be specified, they are correct on defaults:

-mlittle-endian generates code for little-endian CPUs. This is the default.

## CPU information for popular ARM-based boards:

| Board             | CPU                | Architecture  | ARM Core            | FPU                       |
|-------------------|--------------------|---------------|---------------------|---------------------------|
| Raspberry Pi 1    | Broadcom BCM2835   | ARMv6         | ARM11 (ARM1176JZFS) | VFPv2 (VFP only, no NEON) |
| Raspberry Pi 2    | Broadcom BCM2836   | ARMv7-A       | Cortex-A7 MPcore    | VFPv4-D32 (VFP and NEON)  |
| BeagleBone Black  | TI Sitara AM3358/9 | ARMv7-A       | Cortex-A8           | VFPv3-D32 (VFP and NEON)  |
| Altera Cyclone V5 | 5CSEMA4U23C6N A9   | ARMv7-A       | Cortex-A9 MPcore    | VFPv3-D32 (VFP and NEON)  |
| Raspberry Pi 3    | Broadcom BCM2837   | ARMv8-A       | Cortex-A53          | ARMv8 (VFP and NEON)      |

## GCC compiler options for popular ARM-based boards:

| Board             | GCC optimisation flags                                                  |
|-------------------|-------------------------------------------------------------------------|
| Raspberry Pi 1    | -mcpu=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp (alias for vfpv2)         |
| Raspberry Pi 2    | -mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4                       |
| BeagleBone Black  | -mcpu=cortex-a8 -mfloat-abi=hard -mfpu=neon (alias for neon-vfpv3)      |
| Altera Cyclone V5 | -mcpu=cortex-a9 -mfloat-abi=hard -mfpu=neon (alias for neon-vfpv3)      |
| Raspberry Pi 3    | -mcpu=cortex-a53 -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits |

## GCC compiler tuning options for popular ARM-based boards:

| Board             | GCC extra tuning flags |
|-------------------|------------------------|
| Raspberry Pi 1    | -mtune=arm1176jzf-s    |
| Raspberry Pi 2    | -mtune=cortex-a7       |
| BeagleBone Black  | -mtune=cortex-a8       |
| Altera Cyclone V5 | -mtune=cortex-a9       |
| Raspberry Pi 3    | -mtune=cortex-a53      |

Note that gcc's code optimisation creates code for a specific CPU/board. If that code is copied to another platform, it may perform different (e.g. poorly).

## References

- ARM processor documentation at the <a href="http://infocenter.arm.com/help/index.jsp">ARM Information Center</a>
- GCC compiler options for ARM at <a href="https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html">https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html</a>
- ARM Community Center: ARM Cortex-A and GCC commandline arguments (<a href="https://community.arm.com/tools/b/blog/posts/arm-cortex-a-processors-and-gcc-command-lines">Link</a>)

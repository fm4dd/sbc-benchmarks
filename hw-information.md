# Hardware Information for ARM-based systems

2017-03-03 fm4dd

## Background

For benchmark scope, we focus on CPU, memory and disk components that are directly involved in computing. Singleboard computers come in a variety of add-on hardware configurations such as USB, Ethernet, ICS bus systems (I2c, SPI, CAN) and GPIO that balance external connectivity with power consumption and size.

While CPU and memory options are fixed, SBC boards often provide disk storage through SD/MicroSD slots for lower cost and flexible capacity. This makes disk IO comparison depending on the actual SD media being used.

Long-running single board computer series such as the popular Raspberry Pi undergo continuous refresh cycles, and release of new versions come with hardware spec upgrades. To identify the exact hardware specs through software, the board revision number in /prox/cpuinfo can be used together with the <a href="http://elinux.org/RPi_HardwareHistory">version lookup table</a> published by elinux.org.

For ARM-based systems, CPU details are listed in /proc/cpuinfo's "Feature" line. here is one example from Altera's DE0-Nano-SoC board:
```
Features	: half thumb fastmult vfp edsp thumbee neon vfpv3 tls vfpd32
```

Below table translates the identifiers:

| ID       | Description                                                             |
|----------|-------------------------------------------------------------------------|
| swp      | SWP instruction (atomic read-modify-write)                              |
| half     | Half-precision extension                                                |
| thumb    | Thumb (16-bit instruction set)                                          |
| 26bit    | "26 Bit" Model (Processor status register folded into program counter)  |
| fastmult | 32×32→64-bit multiplication                                             |
| fpa      | Floating point accelerator                                              |
| vfp      | VFP (early SIMD vector floating point instructions, e.g. ARMv5)         |
| edsp     | DSP extensions (the 'e' variant of the ARM9 CPUs, and all others above) |
| java     | Jazelle (Java bytecode accelerator)                                     |
| iwmmxt   | SIMD instructions similar to Intel MMX                                  |
| crunch   | MaverickCrunch coprocessor (if kernel support enabled)                  |
| thumbee  | ThumbEE (JazelleRCT) instruction set to efficiently execute VM bytecode |
| neon     | NEON (second-generation SIMD)                                           |
| vfpv3    | VFP version 3                                                           |
| vfpv3d16 | VFP version 3 limited to 16 registers                                   |
| tls      | TLS register                                                            |
| vfpv4    | VFP version 4                                                           |
| idiva    | SDIV and UDIV hardware division in ARM mode                             |
| idivt    | SDIV and UDIV hardware division in Thumb mode                           |
| vfpd32   | 32 Double Precision Floating Point Registers (instead of 16)            |


## CPU information:

| Board             | CPU                | Architecture  | ARM Core            | FPU                       |
|-------------------|--------------------|---------------|---------------------|---------------------------|
| Raspberry Pi 1    | Broadcom BCM2835   | ARMv6         | ARM11 (ARM1176JZFS) | VFPv2 (VFP only, no NEON) |
| Raspberry Pi 2    | Broadcom BCM2836   | ARMv7-A       | Cortex-A7 MPcore    | VFPv4-D32 (VFP and NEON)  |
| BeagleBone Black  | TI Sitara AM3358/9 | ARMv7-A       | Cortex-A8           | VFPv3-D32 (VFP and NEON)  |
| Altera Cyclone V5 | 5CSEMA4U23C6N A9   | ARMv7-A       | Cortex-A9 MPcore    | VFPv3-D32 (VFP and NEON)  |
| Raspberry Pi 3    | Broadcom BCM2837   | ARMv8-A       | Cortex-A53          | ARMv8 (VFP and NEON)      |

## Memory information:

| Board             | RAM     |                                       |
|-------------------|---------|---------------------------------------|
| Raspberry Pi 1    |  512 MB |
| Raspberry Pi 2    | 1024 MB |
| BeagleBone Black  |  512 MB |
| Altera Cyclone V5 | 1024 MB |
| Raspberry Pi 3    | 1024 MB |

## Disk information:

| Board             | Storage Media| 
|-------------------|--------------|---------------------------------|
| Raspberry Pi 1    | SD Card Slot |
| Raspberry Pi 2    | MicroSD Slot |
| BeagleBone Black  | eMMC         |
| Altera Cyclone V5 | MicroSD Slot |
| Raspberry Pi 3    | MicroSD Slot |

## References

# Hardware Information for ARM-based systems

2017-03-03 fm4dd

## Background

For benchmark scope, we focus on CPU, memory and disk components that are directly involved in computing. Singleboard computers come in a variety of add-on hardware configurations such as USB, Ethernet, ICS bus systems (I2c, SPI, CAN) and GPIO that balance external connectivity with power consumption and size.

iWhile CPU and memory options are fixed, SBC boards often provide disk storage through SD/MicroSD slots for lower cost and flexible capacity. This makes disk IO comparison depending on the actual SD media being used.

## CPU information:

| Board             | CPU                | Architecture  | ARM Core            | FPU                       |
|-------------------|--------------------|---------------|---------------------|---------------------------|
| Raspberry Pi 1    | Broadcom BCM2835   | ARMv6         | ARM11 (ARM1176JZFS) | VFPv2 (VFP only, no NEON) |
| Raspberry Pi 2    | Broadcom BCM2836   | ARMv7-A       | Cortex-A7 MPcore    | VFPv4-D32 (VFP and NEON)  |
| BeagleBone Black  | TI Sitara AM3358/9 | ARMv7-A       | Cortex-A8           | VFPv3-D32 (VFP and NEON)  |
| Altera Cyclone V5 | 5CSEMA4U23C6N A9   | ARMv7-A       | Cortex-A9 MPcore    | VFPv3-D32 (VFP and NEON)  |
| Raspberry Pi 3    | Broadcom BCM2837   | ARMv8-A       | Cortex-A53          | ARMv8 (VFP and NEON)      |

## Memory information:

| Board             | RAM                                                  |
|-------------------|-------------------------------------------------------------------------|
| Raspberry Pi 1    |          |
| Raspberry Pi 2    |          |
| BeagleBone Black  |          |
| Altera Cyclone V5 |          |
| Raspberry Pi 3    |          |

## Disk information:

| Board             | RAM                                                  |
|-------------------|-------------------------------------------------------------------------|
| Raspberry Pi 1    |          |
| Raspberry Pi 2    |          |
| BeagleBone Black  |          |
| Altera Cyclone V5 |          |
| Raspberry Pi 3    |          |

## References

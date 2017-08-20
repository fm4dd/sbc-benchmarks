# Whetstone performance tests for single-board systems

Date: March 2017

## Background

The Whetstone benchmark is a synthetic benchmark named after its initial code descending from the Whetstone compiler, named after a small village in Leicestershire, England. The Whetstone benchmark primarily measures the floating-point arithmetic performance. (<a href="http://www.netlib.org/benchmark/">Link</a>)

## Test commands

```
root@susie:~/sbc-bench > bin/whetstone 500000 > results/whetstone.txt
```

## Test results

| System             | CPU              | Arch  | MHz  | OS            |   MIPS |
| -------------------|------------------|-------|-----:|---------------|-------:|
| Raspberry Pi 1B    | Broadcom BCM2835 | ARMv6 |  700 | Raspbian 8    |   82.6 |
| Raspberry Pi 0W    | Broadcom BCM2835 | ARMv6 | 1000 | Raspbian 8    |  118.2 |
| Beaglebone Black   | AM3359 Cortex-A8 | ARMv7 | 1000 | Ubuntu 14.04  |  485.4 |
| Raspberry Pi 2B    | Broadcom BCM2836 | ARMv7 |  900 | Raspbian 8    |  487.5 |
| Altera Atlas SoC   | 5CSEMA4U23C6N A9 | ARMv7 |  925 | Ubuntu 16.04  | 1923.1 |
| Raspberry Pi 3     | Broadcom BCM2837 | ARMv8 | 1200 | Raspbian 8    | 2000.0 |

The same benchmark was run on the consumer hardware below as a frame of reference:

| System             | CPU              | Arch  | MHz  | OS            |   MIPS |
| -------------------|------------------|-------|-----:|---------------|-------:|
| Apple MacMini 2007 | Core 2 Duo T7200 | Intel | 2000 | Linux         | 4166.7 |
| Xperia Z4 Tablet   | Snapdragon 810   | ARMv8 | 2000 | Android 6.0   | 4545.5 |
| Linode 4GB VM      | Xeon E5-2680 VM  | Intel | 2800 | Ubuntu 14.04  | 5000.0 |

# Coremark performance tests for single-board systems

Date: March 2017

## Background

CoreMark is a benchmark from the Embedded Microprocessor Benchmark Consortium (EEMBC®). It targets testing a processor’s CPU core for basic pipeline structure, as well as basic read/write, integer, and control operations. (<a href="http://www.eembc.org/coremark/">Link</a>)

## Test commands

```
root@susie:~/sbc-bench > bin/coremark > results/coremark.txt
```

## Test results

| System             | CPU              | Arch  | MHz  | OS            | Coremark | Coremark/Mhz |
| -------------------|------------------|-------|-----:|---------------|---------:|-------------:|
| Raspberry Pi 1B    | Broadcom BCM2835 | ARMv6 |  700 | Raspbian 8    |     1357 |  1.94 |
| Raspberry Pi 0W    | Broadcom BCM2835 | ARMv6 | 1000 | Raspbian 8    |     2084 |  2.08 |
| Beaglebone Black   | AM3359 Cortex-A8 | ARMv7 | 1000 | Ubuntu 14.04  |     2497 |  2.49 |
| Raspberry Pi 2B    | Broadcom BCM2836 | ARMv7 |  900 | Raspbian 8    |     3097 |  3.09 |
| Altera Atlas SoC   | 5CSEMA4U23C6N A9 | ARMv7 |  925 | Ubuntu 16.04  |     6596 |  7.13 |
| Raspberry Pi 3     | Broadcom BCM2837 | ARMv8 | 1200 | Raspbian 8    |     7108 |  5.92 |

The same benchmark was run on the consumer systems below to provide a frame of reference:

| System             | CPU              | Arch  | MHz  | OS            | Coremark | Coremark/Mhz |
| -------------------|------------------|-------|-----:|---------------|---------:|------:|
| Apple MacMini 2007 | Core 2 Duo T7200 | Intel | 2000 | Linux         |    14427 |  7.21 |
| Xperia Z4 Tablet   | Snapdragon 810   | ARMv8 | 2000 | Android 6.0   |     7402 |  4.23 |
| Linode 4GB VM      | Xeon E5-2680 VM  | Intel | 2800 | Ubuntu 14.04  |    13124 |  4.68 |

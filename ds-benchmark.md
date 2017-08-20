# Dhrystone performance tests for single-board systems

Date: March 2017

## Background

The Dhrystone is a synthetic computing benchmark program developed in 1984 by Reinhold P. Weicker. The benchmark measures Integer computing performance, and its name intends to differentiate it from the Whetstone benchmark for floating point performance benchmarks. (<a href="http://www.netlib.org/benchmark/">Link</a>)

## Test commands

```
root@susie:~/sbc-bench > bin/dhrystone 100000000 > results/dhrystone.txt
```

## Test results

| System             | CPU              | Arch  | MHz  | OS            | Dhrystones/s | DMIPS/Mhz |
| -------------------|------------------|-------|-----:|---------------|-------------:|-----:|
| Raspberry Pi 1B    | Broadcom BCM2835 | ARMv6 |  700 | Raspbian 8    |    1388888.9 | 1.13 |
| Raspberry Pi 0W    | Broadcom BCM2835 | ARMv6 | 1000 | Raspbian 8    |    2083333.4 | 1.19 |
| Raspberry Pi 2B    | Broadcom BCM2836 | ARMv7 |  900 | Raspbian 8    |    2173913.0 | 1.37 |
| Beaglebone Black   | AM3359 Cortex-A8 | ARMv7 | 1000 | Ubuntu 14.04  |    3030303.0 | 1.72 |
| Raspberry Pi 3     | Broadcom BCM2837 | ARMv8 | 1200 | Raspbian 8    |    4347826.0 | 2.06 |
| Altera Atlas SoC   | 5CSEMA4U23C6N A9 | ARMv7 |  925 | Ubuntu 16.04  |    3703703.8 | 2.28 |


The same benchmark was run on below consumer hardware to provide a frame of reference:

| System             | CPU              | Arch  |  Mhz | OS            | Dhrystones/s | DMIPS/Mhz |
| -------------------|------------------|-------|-----:|---------------|-------------:|-----:|
| Apple MacMini 2007 | Core 2 Duo T7200 | Intel | 2000 | Linux         |    6666666.5 | 1.90 |
| Xperia Z4 Tablet   | Snapdragon 810   | ARMv8 | 2000 | Android 6.0   |   14285714.0 | 4.06 |
| Linode 4GB VM      | Xeon E5-2680 VM  | Intel | 2800 | Ubuntu 14.04  |   17142858.0 | 3.48 |

### Notes

DMIPS are calculated as follows:
```
DMIPS/MHz = 10^6 / (1757 * Number of processor clock cycles per Dhrystone loop)
```
The reference system is a VAX 11/780, which achieved 1757 Dhrystones per second.

source: ARM technical support knowledge base articles <a href="http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.faqs/ka16376.html">ka16376</a> and <a href="http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.faqs/ka3885.html">ka3885</a>, and <a href="http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dai0273a/ar01s05.html">ar01s05</a>

Sample DMIPS/Mhz calculation from Raspberry Pi 1B dhrystone output:
```
 1) 1388888.9 (dhrystones/s) / 1757 (VAX) = 790.49
 2) 790.49 / 700 (CPU MHZ) = 1.13 DMIPS/Mhz
```


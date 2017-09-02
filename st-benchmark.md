# Stream performance tests for single-board systems

Date: March 2017

## Background

The STREAM benchmark is a simple synthetic benchmark program that measures sustainable memory bandwidth (in MB/s) and the corresponding computation rate for simple vector kernels. The STREAM benchmark was developed by John McCalpin at the University of Delaware. (<a href="http://www.cs.virginia.edu/stream/FTP/Code/">Link</a>)

## Test commands

```
root@susie:~/sbc-bench > bin/stream > results/stream.txt
```

## Test results

| System             | CPU              | Arch  | MHz  | OS            | Copy  | Scale | Add | Triad |
| -------------------|------------------|-------|-----:|---------------|------:|------:|-----:|-----:|
| Raspberry Pi 1B    | Broadcom BCM2835 | ARMv6 |  700 | Raspbian 8    |  770.6 |  212.3 |  311.4 |  296.6 |
| Raspberry Pi 0W    | Broadcom BCM2835 | ARMv6 | 1000 | Raspbian 8    |  842.5 |  274.4 |  393.6 |  384.6 |
| Beaglebone Black   | AM3359 Cortex-A8 | ARMv7 | 1000 | Ubuntu 14.04  |  562.7 |  429.3 |  516.2 |  482.7 |
| Raspberry Pi 2B    | Broadcom BCM2836 | ARMv7 |  900 | Raspbian 8    | 1359.5 | 1411.6 | 1602.7 | 1577.1 |
| Altera Atlas SoC   | 5CSEMA4U23C6N A9 | ARMv7 |  925 | Ubuntu 16.04  |  935.5 | 1279.6 |  939.0 |  922.4 |
| Raspberry Pi 3     | Broadcom BCM2837 | ARMv8 | 1200 | Raspbian 8    | 2184.9 | 2177.3 | 2099.0 | 2092.3 |
| NanoPi NEO 2       | Allwinner H5     | ARMv8 | 1500 | Ubuntu 16.04  | 1848.4 | 1875.8 | 1730.5 | 1731.9 |

The same benchmark was run on the consumer hardware below to provide a frame of reference:

| System             | CPU              | Arch  | MHz  | OS            | Copy  | Scale | Add | Triad |
| -------------------|------------------|-------|-----:|---------------|------:|------:|-----:|-----:|
| Apple MacMini 2007 | Core 2 Duo T7200 | Intel | 2000 | Linux         | 2427.1 |  2404.0 |  2662.6 |  2645.0 |
| Xperia Z4 Tablet   | Snapdragon 810   | ARMv8 | 2000 | Android 6.0   | 8726.0 | 10904.4 |  9009.0 |  9353.4 |
| Linode 4GB VM      | Xeon E5-2680 VM  | Intel | 2800 | Ubuntu 14.04  | 9691.7 | 10193.7 | 13994.9 | 14472.3 |

### Note

Stream can detect multi-core systems and start the appropriate number of threads. Miss-detection can be corrected by setting the OpenMP environment variable "OMP_NUM_THREADS".

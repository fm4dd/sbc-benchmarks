# Basic disk I/O performance tests for single-board systems

Date: March 2017

## I/O performance test commands

```
root@raspberrypi:/home/pi# sync; dd if=/dev/zero of=~/test.tmp bs=500K count=1024
root@raspberrypi:/home/pi# sync; dd if=~/test.tmp of=/dev/null iflag=direct bs=500K count=1024
```

## I/O performance test results

| System             | OS            | read IO     | write IO     | Medium       |
|--------------------|---------------|------------:|-------------:|--------------|
| Raspberry PI 1B    | Raspbian 8    |   21.9 MB/s |    10.2 MB/s | SD Card      |
| Beaglebone Black   | Ubuntu 14.04  |   34.8 MB/s |    13.1 MB/s | 4GB eMMC     |
| Raspberry PI 2B    | Raspbian 8    |   22.4 MB/s |    22.0 MB/s | MicroSD Card |
| Altera Atlas SoC   | Ubuntu 16.04  |   21.6 MB/s |    21.3 MB/s | MicroSD Card |
| Raspberry PI 3B    | Raspbian 8    |   22.8 MB/s |    10.5 MB/s | MicroSD Card |


The same benchmark was run on the consumer hardware below to provide a frame of reference:

| System             | OS            | read IO     | write IO     | Medium     |
| -------------------|---------------|------------:|-------------:|------------|
| Apple MacMini 2007 | Mac OSX ???   |             |              | 5200RPM HDD|
| Xperia Z4 Tablet   | Android 6.0   |  170.0 MB/s |   106.0 MB/s | 32GB eMMC  |
| Linode 4GB VM      | Ubuntu 14.04  | 3900.0 MB/s |  1200.0 MB/s | SSD        |

### Note

The dd flag iflag=direct prevents reading from cache, which could distort measurements
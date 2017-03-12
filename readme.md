# sbc-benchmarks

A set of standard benchmarks exist that can help evaluate single board system performance and their suitability for certain tasks. The sbc-benchmarks package was created to run a basic set of benchmarks while tracking compile options, scripts and results to ensure repeatability and consistent execution across different boards.

The following standard bencharks are currently set up and run by sbc-benchmarks:

- Coremark  (CPU Performance)
- Whetstone (Floating Point Performance)
- Dhrystone (Integer Performance)
- Stream    (Memory Performance)
- dd        (Disk I/O Performance)

The following single-board systems have been tested with sbc-benchmarks:

| Board                  | Vendor                    |
|------------------------|---------------------------|
| Raspberry Pi 1B        | <a href="https://www.raspberrypi.org/">Raspberry Pi Foundation</a> |
| BeagleBone Black Rev C | <a href="https://beagleboard.org/">BeagleBoard.org Foundation</a>  |
| Raspberry Pi 2B        | <a href="https://www.raspberrypi.org/">Raspberry Pi Foundation</a> |
| DE0-Nano-SoC (Atlas)   | <a href="https://www.altera.com/">Intel PSG (Altera)</a>           |
| Raspberry Pi 3         | <a href="https://www.raspberrypi.org/">Raspberry Pi Foundation</a> |

## Hardware and Compiler optimization

To achieve the best possible results, benchmarks need to be compiled with optimization for the specific hardware and CPU.

[Hardware Information](hw-information.md)

All boards above are equipped with ARM-based CPU. ARM currently dominates the market for mobile computing, and has a strong presence in the embbeded CPU market. Hence, the compiler optimization data below is for ARM.

[GCC Compiler Optimization](gcc-optimization.md)

## SBC Benchmark Results

- [Coremark](cm-benchmark.md)
- [Whetstone](ws-benchmark.md)
- [Dhrystone](ds-benchmark.md)
- [Stream](st-benchmark.md)
- [Disk IO](io-benchmark.md)

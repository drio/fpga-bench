Toy project to compare sha256 performance between different hardware.

sha256 implementation from [this project](https://github.com/B-Con/crypto-algorithms/tree/master).

### Results

| System | CPU | Performance | OS | Kernel | Compiler |
|--------|-----|-------------|----|---------|---------| 
| Desktop | AMD Ryzen 9 7900X 12-Core | 2.41 MH/s | Ubuntu 24.04.3 LTS | 6.14.0-27-generic | gcc 13.3.0 |
| Raspberry Pi 4 | ARM Cortex-A72 | 0.32 MH/s | Debian 12 (bookworm) | 6.12.41-v8+ | gcc 12.2.0 |
| Raspberry Pi 3 | ARM Cortex-A53 | 0.08 MH/s | Debian 11 (bullseye) | 6.1.21-v8+ | gcc 10.2.1 |



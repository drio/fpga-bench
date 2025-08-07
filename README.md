Toy project to compare sha256 performance between different hardware.

sha256 implementation from [this project](https://github.com/B-Con/crypto-algorithms/tree/master).

### Results

```
CPU: AMD Ryzen 9 7900X 12-Core Processor
OS: Ubuntu 24.04.3 LTS
Kernel: 6.14.0-27-generic
Compiler: gcc 13.3.0-6ubuntu2~24.04)
Megahashes per second: 2.41 MH/s
```

```
Raspberry PI4
CPU: Cortex-A72
OS: Debian GNU/Linux 12 (bookworm)
Kernel: 6.12.41-v8+
Compiler: gcc 12.2.0-14+deb12u1
Megahashes per second: 0.32 MH/s
```

```
Raspberry PI3
CPU: Cortex-A53
OS: Debian GNU/Linux 11 (bullseye)
Kernel: 6.1.21-v8+
Compiler: gcc 10.2.1-6)
Megahashes per second: 0.08 MH/s (79300.00 H/s)
```






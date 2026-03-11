# RISC-V Cache-Coherent Out-of-Order Quad-Core Processor

A Chisel-based RISC-V cache-coherent out-of-order quad-core processor implementation with full lock-step verification against a reference emulator. Designed for functional verification, performance benchmarking, and rapid iteration. This project serves as an educational platform to teach and learn about cache coherency and multicore operation.

---

## Features

- **Chisel/Scala** hardware description language
- **Verilator** cycle-accurate simulation with VCD trace support
- **Lock-step testing** against a reference RISC-V emulator (`fyp18-riscv-emulator`)
- Automated benchmark suite:
  - Vector Add (`vvadd`)
  - Matrix Multiplication (`matmul`)
  - Image Filter (`filter`)
  - CSAXPY
  - Histogram (`histo`)
- Full Linux boot support
- Bulk regression testing with detailed result logging
- Python-based post-processing decoder for trace analysis

---

## Requirements

- **SBT** (Scala Build Tool)
- **Verilator** (`>= 4.0`)
- **GNU Make**
- **Python 3** + virtual environment (for trace decoding)
- **g++** (for building the lock-step runner)
- **RISC-V cross-compiler** (for generating `.bin` files)

---

## Quick Start

1. Build the Chisel design and Verilator model:
   ```bash
   make sim
   ```

2. Run the full regression suite (recommended):
   ```bash
   make bulk_test
   ```

3. View the results:
   ```bash
   cat test_results.txt
   ```

---

## Available Make Targets

| Target                  | Description                                      |
|-------------------------|--------------------------------------------------|
| `make sim`              | Build Chisel → Verilog → Verilator model         |
| `make bulk_test`        | Run all benchmarks + timing log                  |
| `make vvadd`            | Vector Add benchmark suite                       |
| `make matmul`           | Matrix Multiplication benchmark suite            |
| `make filter`           | Image filter benchmark suite                     |
| `make csaxpy`           | CSAXPY benchmark suite                           |
| `make histo`            | Histogram benchmark suite                        |
| `make linux`            | Boot full Linux image                            |
| `make demo`             | Run demo image + decode trace                    |
| `make fire`             | Run fire test image                              |
| `make test_all_images`  | Test every image in `riscv-tests/images/`        |
| `make runSim`           | Run pure Verilator benchmark (no lock-step)      |
| `make clean`            | Remove all build artifacts                       |

---

## Project Structure

``` text
.
├── src/main/scala/          # Chisel source (core, cache, etc.)
├── simulator/src/           # Verilator C++ wrapper + benchmarks
├── lock_step_files/         # Lock-step reference implementations
├── benchmark/               # Pre-built test binaries
├── fyp18-riscv-emulator/    # Reference emulator (submodule or linked)
├── decoder.py               # Trace decoder
├── test_results.txt         # Generated after bulk_test
└── Makefile                 # Main build orchestration
```

---

## Configuration

The instruction base address is automatically patched during the build process (default: `0x80000000` for simulation).  
To change it permanently, edit `src/main/scala/common/configuration.scala`.

---

## Test Results Format

After running `make bulk_test`, the file `test_results.txt` contains:

- Timestamped sections
- Pass/Fail status for every benchmark
- Full image test results (when using `test_all_images`)

---

## Troubleshooting

### Missing Verilator Includes

Ensure the path `/usr/share/verilator/share/verilator/include` exists, or update the `VERILATOR_INCLUDE` variable in the `Makefile`.

---

## License

This project is released under the **MIT License**. See the `LICENSE` file for details.

---

**Developed with passion for RISC-V verification and education**

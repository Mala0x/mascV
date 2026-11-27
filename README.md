# mascV

**mascV** is a custom RISC-V processor and System-on-Chip (SoC) project targeting an FPGA.

> **Status:** Work in progress. Initial development and experimentation are currently taking place privately, and modules will be pushed here as they stabilize.

## Repository Structure

- **[`core/`](core/)** — The RISC-V processor core (instruction execution, registers, and control logic).
- **[`soc/`](soc/)** — Surrounding SoC components and peripherals (such as memory interfaces and UART controllers).
- **[`boot/`](boot/)** — Startup and bootloader logic to initialize the processor and load programs.
- **[`os/`](os/)** — Software, small RISC-V programs, and an eventual operating system built to run on the hardware.
- **[`tests/`](tests/)** — C++ simulation testbenches using Verilator to test hardware modules.
- **[`docs/`](docs/)** — Design notes, diagrams, and project documentation.

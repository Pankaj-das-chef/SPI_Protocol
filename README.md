# SPI Protocol Implementation in Verilog

This project implements a **simple SPI (Serial Peripheral Interface) transmitter** using a finite state machine (FSM) in Verilog. The module sends a 16-bit data word serially over the SPI data line, along with chip select (`CS`) and clock (`SCLK`) generation.

---

## Overview

SPI is a synchronous serial communication protocol used to transfer data between microcontrollers and peripherals. This Verilog module mimics a basic SPI Master transmitting data to a slave device.

---

## Features

- Transmits 16-bit data serially (MSB first)
- Generates SPI signals: `CS`, `SCLK`, `DATA`
- FSM-based transmission control
- Active-low chip select (`spi_cs_l`)
- Compatible with SPI Mode 0 (CPOL=0, CPHA=0)

---

## Module I/O

| Port         | Direction | Width   | Description                        |
|--------------|-----------|---------|------------------------------------|
| `clk`        | Input     | 1       | System clock                       |
| `reset`      | Input     | 1       | Asynchronous active-high reset     |
| `datain`     | Input     | 16 bits | Parallel data input                |
| `spi_cs_l`   | Output    | 1       | Active-low SPI chip select         |
| `spi_sclk`   | Output    | 1       | SPI clock                          |
| `spi_data`   | Output    | 1       | SPI serial output (MOSI)           |
| `counter`    | Output    | 5 bits  | Bit transmission counter           |

---

## Testbench Summary

```verilog
// File: spi_protocol_tb.v

// Test Procedure:
// 1. Generates a 10ns system clock.
// 2. Applies an initial reset pulse.
// 3. Loads a 16-bit binary test pattern: 1010110011110001.
// 4. Allows the FSM to shift out the bits using spi_data.
// 5. Monitors and logs SPI signals and internal counter.

// Sample Output:
// Time   clk  reset  cs_l  sclk  data  counter
//  35     1     0      0     0     1       15
//  45     0     0      0     1     1       15


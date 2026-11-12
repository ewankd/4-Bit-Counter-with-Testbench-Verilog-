# Project 2 — 4-Bit Synchronous Counter with Testbench (Verilog)

A 4-bit rising-edge-triggered **modulo-16 up-counter** with two control inputs: `rst` (active-high, synchronous) and `enable`.

| `rst` | `enable` | Behavior at the next rising edge |
|---|---|---|
| 1 | X | Set `count` to 0 |
| 0 | 1 | Increment `count` (15 wraps to 0) |
| 0 | 0 | Keep current `count` |

`rst` has priority over `enable`. Because the reset is **synchronous**, asserting reset between rising edges does not immediately change the output. The output is undefined before the first clock edge with reset asserted in normal 4-state RTL simulation.

## Installation and usage

On Ubuntu or WSL Ubuntu, install `sudo apt-get install -y iverilog make` (after `sudo apt-get update`). From this directory, run `make test`. To save a VCD waveform run `make waves`; optionally inspect it using GTKWave. GitHub Actions runs the HDL simulator on each push.

**Verification note:** The included self-checking Verilog testbench must be run on an installed simulator to establish that the hardware RTL passes.


## Verification

The self-checking testbench (`tb/tb_counter4.v`) verifies: startup reset; 32 enabled increments (including 15 -> 0 rollover twice); hold for four disabled clock edges; resume; synchronous reset behavior; and reset priority.

From this standalone project folder:

```bash
make test
make waves                   # optionally generate waveform files
# gtkwave build/counter4.vcd
```

This design uses nonblocking assignments (`<=`) inside its edge-triggered always block, as required for conventional sequential RTL.

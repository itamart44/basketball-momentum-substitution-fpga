# KATASH LOGIC  
## THE BENCH-O-METER  

A real-time basketball momentum & fitness–based substitution analyzer implemented on the Basys3 FPGA.

![Katash Logic Banner](assets/katash_logic_banner.png.png)

---

## Overview
Katash Logic – The Bench-O-Meter is a personal home project designed to analyze  
real-time momentum for basketball players and recommend when a player should rest  
or stay on the court.

The system combines:
1. In-game performance (momentum)
2. Pre-game fitness levels and player roles (fitness score)

Inspired by Oded Katash’s flow-based coaching style.

---

## Project Goal
Build an FPGA-based system that receives basketball events as inputs,  
calculates momentum and fitness in real time, and outputs a substitution recommendation.

---

## 🚀 Hardware Bring-Up & Core Logic Validation (Dec 2025)

The Basys3 FPGA board was successfully connected and fully validated on real hardware.

Beyond the initial clock/LED test, the system now implements a **complete event → decode → accumulate pipeline**, verified directly on the FPGA.

### 🔧 What is implemented on hardware
- Event input via **switches (SW[3:0])**
- Event trigger via **btnC**
- Per-player momentum accumulation
- Reset via **btnU**
- Multi-player architecture (parallel momentum tracking)
- Binary momentum display via **LEDs**
- Correct XDC pin constraints and I/O standards
- Successful synthesis, implementation, and bitstream programming

### 🎉 Result
The Basys3 board correctly reacts to basketball events:
- Each event updates the selected player’s momentum
- Reset clears player momentum deterministically
- Multiple players are handled in parallel
- All behavior verified live on FPGA hardware

This marks the **first full functional hardware milestone** of the Bench-O-Meter project.

### Basys3 Board – Live Hardware Validation
![Basys3 Connected](assets/basys3_connected.heic)

---

## Documentation  
All detailed documents are available in the `/docs` directory:

- [System Architecture Diagram](docs/system_architecture_v0.md)  
- [Momentum Formula (v1.1)](docs/momentum_formula_v1.md)  
- [Fitness Formula (v1.0)](docs/fitness_formula_v1.md)  
- [Combined Decision Logic (v1.0)](docs/combined_decision_v1.md)

---

## Current Hardware Status (v0.2)

✔ Event decoding via switches (SW[3:0])  
✔ Event trigger via btnC  
✔ Per-player momentum accumulation  
✔ Multi-player momentum architecture  
✔ Reset via btnU  
✔ Binary momentum display on LEDs  
✔ Verified end-to-end on Basys3 hardware  

This version validates the **full real-time momentum pipeline** on actual FPGA hardware.

---

## Roadmap
- [x] Create GitHub repository  
- [x] Add initial README  
- [x] Add basic project specification (v0)  
- [x] Add momentum, fitness, and decision formulas  
- [x] Add system architecture diagram (Mermaid)  
- [x] **First FPGA Bring-Up: event decoding & momentum logic verified on hardware**  
- [x] **Implement momentum calculator (event-based, multi-player)**  
- [ ] Add team momentum aggregation  
- [ ] Integrate fitness score comparison  
- [ ] Implement substitution decision logic  
- [ ] Add simulation testbench  
- [ ] Extended Basys3 experiments  
- [ ] Full system integration and testing  

---

## License
MIT License

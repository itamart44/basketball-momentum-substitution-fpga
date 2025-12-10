# KATASH LOGIC  
## THE BENCH-O-METER  

A real-time basketball momentum & fitness–based substitution analyzer implemented on the Basys3 FPGA.

![Katash Logic Banner](assets/katash_logic_banner.png)

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

## 🚀 Hardware Bring-Up: First Basys3 Test Successful (10 Dec 2025)

Today the Basys3 FPGA board arrived, and the first on-board hardware validation was completed.

We implemented a simple **clock divider + LED blink** HDL design in VHDL, synthesized it in Vivado, generated a bitstream, and programmed the FPGA.

### 🔧 What was implemented
- **clock_divider.vhd** — divides the 100 MHz onboard oscillator down to 1 Hz  
- **top.vhd** — maps `CLK100MHZ`, `btnC`, and drives `LED[0]`  
- **Basys3.xdc** — correct pin assignments for clock, push button, and LED  

### 📸 Hardware Setup
(Images placed inside `/assets/`)

![Basys3 setup](assets/basys3_setup_1.jpg)  
![Basys3 closeup](assets/basys3_setup_2.jpg)

### 🎉 Result
LED0 on the Basys3 board blinks at ~1 Hz, confirming:

- HDL compilation ✔️  
- Constraint file correctness ✔️  
- Bitstream generation ✔️  
- JTAG communication ✔️  
- Real hardware execution ✔️  

This marks the **first hardware milestone** of the Bench-O-Meter project.

### 🎥 Blink Demo  
### FPGA LED Blink Demo
![Blink Demo](assets/blink_demo.gif)





---

## Documentation  
All detailed documents are available in the `/docs` directory:

- [System Architecture Diagram](docs/system_architecture_v0.md)  
- [Momentum Formula (v1.1)](docs/momentum_formula_v1.md)  
- [Fitness Formula (v1.0)](docs/fitness_formula_v1.md)  
- [Combined Decision Logic (v1.0)](docs/combined_decision_v1.md)

---

## Planned Development Steps
- Write full project specification  
- Finalize momentum calculation algorithm  
- Finalize fitness model and role adjustments  
- Build complete architecture diagram  
- Design first FPGA modules (clock, input, state machine)  
- Start experiments now that the Basys3 has arrived  
- Implement momentum calculator in VHDL  
- Add simulation testbench  
- Integrate all modules  
- Test on hardware  

---

## Roadmap
- [x] Create GitHub repository  
- [x] Add initial README  
- [x] Add basic project specification (v0)  
- [x] Add momentum, fitness, and decision formulas  
- [x] Add system architecture diagram (Mermaid)  
- [x] **First FPGA Bring-Up: LED blinking at 1 Hz**  
- [ ] Begin module design (clock, input, state machine)  
- [ ] Start extended Basys3 experiments  
- [ ] Implement momentum calculator  
- [ ] Add simulation testbench  
- [ ] Integrate logic and test on hardware  

---

## License
MIT License

(Will be added soon — GIF placeholder)


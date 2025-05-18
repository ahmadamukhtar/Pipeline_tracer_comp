# Pipelined RISC-V Processor Design

This project implements a fully functional **5-stage pipelined RISC-V processor** in SystemVerilog. The design is focused on improving instruction throughput and performance using classic pipelining techniques while addressing common challenges such as control hazards and data forwarding.

### 🎯 Objective

To design a complete pipelined RISC-V processor that:

* Executes instructions across 5 distinct pipeline stages
* Efficiently handles control and data hazards
* Demonstrates correct register and memory behavior through simulation

---

### 🧩 Key Features

#### ✅ **5-Stage Pipeline Architecture**

* **IF → ID → EX → MEM → WB**
* Pipeline registers are placed between stages to support instruction-level parallelism
* Increased throughput over single-cycle designs

#### ⚠️ **Control Hazard Management**

* Branches can disrupt pipeline flow due to late decisions
* Implemented **hazard detection** and **flush logic** to handle branch instructions effectively
* Reduces incorrect instruction execution after taken branches

#### 🔁 **Forwarding and Hazard Detection**

* Forwarding paths implemented to resolve data hazards
* Additional control logic detects and handles stalls when necessary

#### 🧪 **Single-Cycle Comparison**

* A reference single-cycle version was also simulated to compare pipeline efficiency
* The single-cycle design executes all stages in one clock cycle, but suffers from performance bottlenecks

---

### 🔍 Verification: Tracer Integration

Although the primary focus of this project is on **design**, a **tracer module** was developed and integrated to verify correctness. Using **Cadence Xcelium**, over 98,000 instructions were simulated and traced to confirm:

* Correct instruction sequencing
* Proper register and memory updates
* Effective handling of hazards under realistic workloads

---

### 🛠 Tools Used

* **SystemVerilog** – RTL design and verification
* **Cadence Xcelium** – Simulation and waveform analysis
* **Custom Tracer** – For full instruction monitoring and debugging

---

### 📌 Outcome

* The pipelined processor correctly handled arithmetic, memory, and branch instructions under simulated test conditions.
* Hazard detection and flushing logic ensured stable and correct execution flow.
* The tracer confirmed consistent and correct pipeline behavior across a large number of instructions.

---

**Author:** Ahmad Mukhtar
**Institution:** NUST Chip Design Centre (NCDC), Islamabad

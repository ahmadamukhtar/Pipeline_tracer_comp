`timescale 1ns / 1ps
module stage_3(
input logic cpu_clk,
input logic reset,
input logic enb_3,
input logic [31:0]ALU_OUT,
input logic [31:0]data_R2_rg2,
input logic RWBEn_rg2,
input logic MEMRW_rg2,
input logic [31:0]count_rg2,
input logic [2:0]func_3_rg2,
input logic [4:0]rd_rg2,
input logic [1:0]WBSel_rg2,
input logic haz_rg2,
input logic PCSel,
input logic [4:0]opcode_rg2,
input logic [4:0]rs2_rg2,
input logic [31:0]instt2,
input logic [4:0]rs1_rg2,
input logic [31:0]data_R1_rg2,
output logic [31:0]ALU_OUT_rg3,
output logic [31:0]data_R2_rg3,
output logic RWBEn_rg3,
output logic MEMRW_rg3,
output logic [31:0]count_rg3,
output logic [2:0]func_3_rg3,
output logic [4:0]rd_rg3,
output logic [1:0]WBSel_rg3,
output logic haz_rg3,
output logic PCSel_rg3,
output logic [4:0]opcode_rg3,
output logic [4:0]rs2_rg3,
output logic [31:0]instt3,
output logic [4:0]rs1_rg3,
output logic [31:0]data_R1_rg3
);

always_ff @(posedge cpu_clk or  posedge reset)
begin
if(enb_3)
begin
ALU_OUT_rg3<=ALU_OUT;
data_R2_rg3<=data_R2_rg2;
RWBEn_rg3<=RWBEn_rg2;
MEMRW_rg3<=MEMRW_rg2;
count_rg3<=count_rg2;
func_3_rg3<=func_3_rg2;
rd_rg3<=rd_rg2;
WBSel_rg3<=WBSel_rg2;
haz_rg3<=haz_rg2;
PCSel_rg3<=PCSel;
opcode_rg3<=opcode_rg2;
rs2_rg3<=rs2_rg2;
instt3<=instt2;
rs1_rg3<=rs1_rg2;
data_R1_rg3<=data_R1_rg2;
end
else
begin
ALU_OUT_rg3<=0;
data_R2_rg3<=0;
RWBEn_rg3<=0;
MEMRW_rg3<=0;
count_rg3<=count_rg2;
func_3_rg3<=0;
rd_rg3<=0;
WBSel_rg3<=0;
haz_rg3<=0;
PCSel_rg3<=0;
opcode_rg3<=0;
rs2_rg3<=0;
instt3<=0;
rs1_rg3<=0;
data_R1_rg3<=0;
end
end
endmodule

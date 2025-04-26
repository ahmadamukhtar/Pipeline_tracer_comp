`timescale 1ns / 1ps
module stage_4(
input logic cpu_clk,
input logic reset,
input logic enb_4,
input logic [31:0]count_rg3,
input logic [31:0]ALU_OUT_rg3,
input logic [31:0]MEM_data,
input logic [4:0]rd_rg3,
input logic RWBEn_rg3,
input logic [1:0]WBSel_rg3,
input logic haz_rg3,
input logic [31:0]instt3,
input logic [4:0]rs1_rg3,
input logic [4:0]rs2_rg3,
input logic [31:0]data_R1_rg3,
input logic [31:0]data_R2_rg3,
output logic [31:0]count_rg4,
output logic [31:0]ALU_OUT_rg4,
output logic [31:0]MEM_data_rg4,
output logic [4:0]rd_rg4,
output logic RWBEn_rg4,
output logic [1:0]WBSel_rg4,
output logic haz_rg4,
output logic [31:0]count_curr_rg4,
output logic [31:0]instt4,
output logic [4:0]rs1_rg4,
output logic [4:0]rs2_rg4,
output logic [31:0]data_R1_rg4,
output logic [31:0]data_R2_rg4
);

always_ff @(posedge cpu_clk or  posedge reset)
begin
if(enb_4)
begin
//count_rg4<=count_rg3+4;
count_curr_rg4<=count_rg3;
count_rg4<=count_rg3+4;
ALU_OUT_rg4<=ALU_OUT_rg3;
MEM_data_rg4<=MEM_data;
rd_rg4<=rd_rg3;
RWBEn_rg4<=RWBEn_rg3;
WBSel_rg4<=WBSel_rg3;
haz_rg4<=haz_rg3;
instt4<=instt3;
rs1_rg4<=rs1_rg3;
rs2_rg4<=rs2_rg3;
data_R1_rg4<=data_R1_rg3;
data_R2_rg4<=data_R2_rg3;
end
end
endmodule
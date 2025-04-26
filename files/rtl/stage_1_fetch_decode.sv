`timescale 1ns / 1ps
module stage_1(
input logic cpu_clk,
input logic reset,
input logic [1:0]enb,
input logic [31:0]count,
input logic [4:0]rs1,
input logic [4:0]rs2,
input logic [4:0]rd,
input logic [4:0]opcode,
input logic [2:0]func_3,
input logic [6:0]func_7,
input logic haz,
input logic [31:0]instt,
output logic [31:0]count_rg,
output logic [4:0]rs1_rg,
output logic [4:0]rs2_rg,
output logic [4:0]rd_rg,
output logic [4:0]opcode_rg,
output logic [2:0]func_3_rg,
output logic [6:0]func_7_rg,
output logic haz_rg,
output logic [31:0]instt1
);
always_ff @(posedge cpu_clk or  posedge reset)
begin
if(enb==1)                        //normal
begin
count_rg<=count;
rs1_rg<=rs1;
rs2_rg<=rs2;
rd_rg<=rd;
opcode_rg<=opcode;
func_3_rg<=func_3;
func_7_rg<=func_7;
instt1<=instt;
end
else if(enb==0)                     //flush
begin
count_rg<=count;
rs1_rg<=0;
rs2_rg<=0;
rd_rg<=0;
opcode_rg<=0;
func_3_rg<=0;
func_7_rg<=0;
haz_rg<=0;
instt1<=0;
end
else                                  //stall
begin
count_rg<=count;
rs1_rg<=rs1_rg;
rs2_rg<=rs2_rg;
rd_rg<=rd_rg;
opcode_rg<=opcode_rg;
func_3_rg<=func_3_rg;
func_7_rg<=func_7_rg;
haz_rg<=haz;
instt1<=instt1;
end
end
endmodule
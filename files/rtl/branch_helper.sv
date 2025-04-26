`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2024 08:48:05 AM
// Design Name: 
// Module Name: branch_helper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module branch_helper(
input logic [4:0]rs1_rg,
input logic [4:0]rs2_rg,
input logic [4:0]rd_rg2,
input logic [4:0]rd_rg3,
input logic [4:0]rd_rg4,
input logic [31:0]ALU_OUT,
input logic [31:0]ALU_OUT_rg3,
input logic [31:0]ALU_OUT_rg4,
input logic [31:0]data_R1,
input logic [31:0]data_R2,
output logic [31:0]d1,
output logic [31:0]d2

    );
    always_comb
            begin
            if(rs1_rg==rd_rg2)
            begin
            d1=ALU_OUT;
            end
            else if(rs1_rg==rd_rg3)
            begin
            d1=ALU_OUT_rg3;
            end
            else if(rs1_rg==rd_rg4)
            begin
            d1=ALU_OUT_rg4;
            end
            else
            begin
             d1=data_R1; 
            end
            end
    always_comb
    begin
            if(rs2_rg==rd_rg2)
            begin
            d2=ALU_OUT;
            end
            else if(rs2_rg==rd_rg3)
            begin
            d2=ALU_OUT_rg3;
            end
            else if(rs2_rg==rd_rg4)
            begin
            d2=ALU_OUT_rg4;
            end
            else
            begin
              d2=data_R2;
    end
    end
endmodule

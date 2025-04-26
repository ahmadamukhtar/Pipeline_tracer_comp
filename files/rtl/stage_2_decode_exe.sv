`timescale 1ns / 1ps
module stage_2(
input logic cpu_clk,
input logic reset,
input logic [1:0]enb_2,
input logic [31:0]ImmOut,
input logic [31:0]data_R1,
input logic [31:0]data_R2,
input logic [31:0]count_rg,
input logic [3:0]ALUSel,
input logic RWBEn,
input logic ASel,
input logic BSel,
input logic [1:0]WBSel,
input logic [4:0]rd_rg,
input logic [2:0]func_3_rg,
input logic MEMRW,
input logic [4:0]rs1_rg,
input logic [4:0]rs2_rg,
input logic haz,
input logic PCSel_l,
input logic [4:0]opcode_rg,
input logic [31:0]instt1,
output logic [31:0]ImmOut_rg2,
output logic [31:0]data_R1_rg2,
output logic [31:0]data_R2_rg2,
output logic [31:0]count_rg2,
output logic [3:0]ALUSel_rg2,
output logic RWBEn_rg2,
output logic ASel_rg2,
output logic BSel_rg2,
output logic MEMRW_rg2,
output logic [2:0]func_3_rg2,
output logic [4:0]rd_rg2,
output logic [1:0]WBSel_rg2,
output logic [4:0]rs1_rg2,
output logic [4:0]rs2_rg2,
output logic haz_rg2,
output logic PCSel,
output logic [4:0]opcode_rg2,
output logic [31:0]instt2
);


always_ff @(posedge cpu_clk or posedge reset) begin
if (enb_2==1) begin
        // Normal operation: pass inputs to outputs
        ImmOut_rg2   <= ImmOut;
        data_R1_rg2  <= data_R1;
        data_R2_rg2  <= data_R2;
        count_rg2    <= count_rg;
        ALUSel_rg2   <= ALUSel;
        RWBEn_rg2    <= RWBEn;
        ASel_rg2     <= ASel;
        BSel_rg2     <= BSel;
        MEMRW_rg2    <= MEMRW;
        func_3_rg2   <= func_3_rg;
        rd_rg2       <= rd_rg;
        WBSel_rg2    <= WBSel;
        rs1_rg2      <= rs1_rg;
        rs2_rg2      <= rs2_rg;
        PCSel<=PCSel_l;
        opcode_rg2<=opcode_rg;
        instt2<=instt1;
     //   haz_rg2      <= haz;
    end
   else if(enb_2==0)
    begin
        ImmOut_rg2   <= 32'b0;
        data_R1_rg2  <= 32'b0;
        data_R2_rg2  <= 32'b0;
        count_rg2    <= count_rg;
        ALUSel_rg2   <= 4'b0;
        RWBEn_rg2    <= 1'b0;
        ASel_rg2     <= 1'b0;
        BSel_rg2     <= 1'b0;
        MEMRW_rg2    <= 1'b0;
        func_3_rg2   <= 3'b0;
        rd_rg2       <= 5'b0;
        WBSel_rg2    <= 2'b0;
        rs1_rg2      <= 5'b0;
        rs2_rg2      <= 5'b0;
         opcode_rg2<=0;
             instt2<=0;
    //    haz_rg2      <= 1'b1;
//     ImmOut_rg2   <= ImmOut;
//        data_R1_rg2  <= data_R1_rg2;
//        data_R2_rg2  <= data_R2_rg2;
//        count_rg2    <= count_rg2;
//        ALUSel_rg2   <= ALUSel_rg2;
//        RWBEn_rg2    <= RWBEn_rg2;
//        ASel_rg2     <= ASel_rg2;
//        BSel_rg2     <= BSel_rg2;
//        MEMRW_rg2    <= MEMRW_rg2;
//        func_3_rg2   <= func_3_rg2;
//        rd_rg2       <= rd_rg2;
//        WBSel_rg2    <= WBSel_rg2;
//        rs1_rg2      <= rs1_rg2;
//        rs2_rg2      <= rs2_rg2;
//    //    haz_rg2      <= haz_rg2;
    end
    else
    begin
         ImmOut_rg2   <= ImmOut_rg2;
        data_R1_rg2  <= data_R1_rg2;
        data_R2_rg2  <= data_R2_rg2;
          count_rg2    <= count_rg;
        ALUSel_rg2   <= ALUSel_rg2;
        RWBEn_rg2    <= RWBEn_rg2;
        ASel_rg2     <= ASel_rg2;
        BSel_rg2     <= BSel_rg2;
        MEMRW_rg2    <= MEMRW_rg2;
        func_3_rg2   <= func_3_rg2;
        rd_rg2       <= rd_rg2;
        WBSel_rg2    <= WBSel_rg2;
        rs1_rg2      <= rs1_rg2;
        rs2_rg2      <= rs2_rg2;
      //  PCSel<=PCSel_l;
         opcode_rg2<=opcode_rg2;
          instt2<=instt2;
    end
end

endmodule
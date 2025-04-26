`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module forwarding_unit(
input logic [4:0]opcode,
input logic haz,
input logic [4:0]rs1_rg2,
input logic [4:0]rs2_rg2,
input logic [4:0]rd_rg3,
input logic [4:0]rd_rg4,
input logic RWBEn_rg3,
input logic RWBEn_rg4,
output logic [1:0]FselA,
output logic [1:0]FselB
    );
 always_comb
    begin
     
     if(RWBEn_rg3&&(rs1_rg2==rd_rg3)&&(rd_rg3!=0))
    begin
    FselA=2'b01;
    end
    else if(RWBEn_rg4&&(rs1_rg2==rd_rg4)&&(rd_rg4!=0))
    begin
       FselA=2'b10;
    end
    else
    begin
       FselA=2'b00;
    end
    end
     always_comb
    begin
    if(RWBEn_rg3&&(rs2_rg2==rd_rg3)&&(rd_rg3!=0))
    begin
    FselB=2'b01;
    end
    else if(RWBEn_rg4&&(rs2_rg2==rd_rg4)&&(rd_rg4!=0))
    begin
       FselB=2'b10;
    end
    else
    begin
       FselB=2'b00;
    end
    end
endmodule
// always_comb
//    begin
//     if(haz==1)begin  end
//    else if(RWBEn_rg3&&(rs1_rg2==rd_rg3)&&(rd_rg3!=0))
//    begin
//    FselA=2'b01;
//    end
//    else if(RWBEn_rg4&&(rs1_rg2==rd_rg4)&&(rd_rg4!=0))
//    begin
//       FselA=2'b10;
//    end
//    else
//    begin
//       FselA=2'b00;
//    end
//    end
//     always_comb
//    begin
//    if(haz==1) begin   end
//      else if(RWBEn_rg3&&(rs2_rg2==rd_rg3)&&(rd_rg3!=0))
//    begin
//    FselB=2'b01;
//    end
//    else if(RWBEn_rg4&&(rs2_rg2==rd_rg4)&&(rd_rg4!=0))
//    begin
//       FselB=2'b10;
//    end
//    else
//    begin
//       FselB=2'b00;
//    end
//    end
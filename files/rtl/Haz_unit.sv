`timescale 1ns / 1ps
module Haz_unit(
input logic cpu_clk,
input logic reset,
input logic [4:0]rs1_rg,
input logic [4:0]rs2_rg,
input logic [4:0]rd_rg2,
input logic MEMRW_rg2,
input logic PCSel_l,
output logic count_enb,
output logic  [1:0]enb,
output logic [1:0]enb_2,
output logic enb_3,
output logic enb_4,
output logic haz,
input logic B
    );
    always_comb
    begin
    if(reset) begin  
     count_enb<=0;
     enb=2;  //flush
     enb_2=0;  //flush
      enb_3=0;  //flush
      enb_4=0;
   end
      else if (((rs1_rg == rd_rg2) && MEMRW_rg2)||((rs2_rg == rd_rg2) && MEMRW_rg2) ) 
    begin
     count_enb=0;
        enb=0;
       enb_2=1;
       enb_4<=1;haz<=1;
    end
  else if(PCSel_l&&B)
   begin
     count_enb=1;
     enb=1;
     enb_2=0;
     enb_3=0; 
     enb_4=1;
   end
   else if(PCSel_l)
   begin
     count_enb<=1;
     enb=1;
     enb_2=0; 
     enb_3=0; 
     enb_4=1;
   end
   else
    begin
     count_enb<=1;
     enb=1;
     enb_2=1;
     enb_3=1;
          enb_4=1;
     haz=0;
    end
    end

endmodule

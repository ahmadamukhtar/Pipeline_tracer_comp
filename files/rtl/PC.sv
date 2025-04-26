`timescale 1ns / 1ps
module PC #(parameter width=32)(
    input logic reset,
    input logic cpu_clk,
    input logic count_enb,
    input logic Bn,         // Select between PC + 1 and jump address
    input logic PCSel_l,
    input logic [31:0] alu_out, // Address for jump instructions
    output logic [width-1:0] count=32'h80000000 ,   // Program counter
    output logic [31:0]count_out
);
logic a=0;
always @(posedge cpu_clk or posedge reset) begin
    if (reset)
    begin    count <= 32'h80000000;   end
    else if (!count_enb)
    begin
        count <= count;
     //   a<=1;
    end 
   else if(PCSel_l)
     begin
     count <=alu_out;
     a<=0;
     end
//   else if(PCSel_l)
//     begin
//     count <=count-4;
//     a<=0;
//     end
    else
      begin    count <= count+4; end
end
assign count_out= count;
endmodule

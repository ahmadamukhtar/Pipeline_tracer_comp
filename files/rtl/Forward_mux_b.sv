module Forward_mux_b(
input logic  [1:0]FselB,
input logic [31:0]data_mux_b_alu,
input logic [31:0]ALU_OUT_rg3,
input logic [31:0]final_mux_out,
output logic [31:0]forward_b_out
    );  
    always_comb
    begin
    case(FselB)
    2'b00: begin forward_b_out=data_mux_b_alu; end
    2'b01: begin forward_b_out=ALU_OUT_rg3; end
    2'b10: begin forward_b_out=final_mux_out; end
    default:  begin forward_b_out=data_mux_b_alu;  end
    endcase
    end
endmodule

    
 

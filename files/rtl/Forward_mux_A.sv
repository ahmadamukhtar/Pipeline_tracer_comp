module Forward_mux_a(
input logic  [1:0]FselA,
input logic [31:0]data_mux_a_out,
input logic [31:0]ALU_OUT_rg3,
input logic [31:0]final_mux_out,
output logic [31:0]forward_a_out
    );  
    always_comb
    begin
    case(FselA)
    2'b00: begin forward_a_out=data_mux_a_out; end
    2'b01: begin forward_a_out=ALU_OUT_rg3; end
    2'b10: begin forward_a_out=final_mux_out; end
    default:  begin forward_a_out=data_mux_a_out;  end
    endcase
    end
endmodule
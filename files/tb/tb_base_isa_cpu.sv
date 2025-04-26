`timescale 1ns / 1ps
module RISC_V_Base_data_path_tb();
    // Testbench signals
    logic cpu_clk;
    logic reset;    
    // Instantiate the RISC-V datapath module
    RISC_V_Base_data_path uut (
        .cpu_clk(cpu_clk),
        .reset(reset)
    );
    // Clock generation
    initial begin
        cpu_clk = 0;
        #20;
        forever #5 cpu_clk = ~cpu_clk;  // 100 MHz clock
    end
    
    // Reset logic
    initial begin
        // Apply reset
        reset = 1;
        #20;  // Hold reset for 20 time units
        
        // Deassert reset
        reset = 0;
    end
    
    // Test sequence
    initial begin

        #100000;  // Wait for 100 time units to observe the results       
       $finish;
    end
    
endmodule
//module top_tb();
//logic clk, rst;

//logic clk;
//logic rst;
//RISC_V_Base_data_path dut(.cpu_clk(clk), .reset(rst));

//initial begin
//clk = 0;
//rst =1;
//#20 rst = 0;

//#10000000;
//$finish();
//end
//always #10 clk = ~clk;
//endmodule
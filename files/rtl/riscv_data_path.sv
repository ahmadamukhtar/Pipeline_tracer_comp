
module RISC_V_Base_data_path(
    input logic cpu_clk,
    input logic reset
);    
   
 logic [31:0]data_R2_rg4;
     logic  [6:0]func_7_rg2;
     logic  [6:0]func_7_rg3;
     logic  [6:0]func_7_rg4;
     logic [31:0]forward_b_out,forward_a_out; 
logic [4:0]opcode_rg3;
logic [4:0]rs2_rg3;
logic [4:0]rs2_rg4;
logic [4:0]rs1_rg3;
logic [4:0]rs1_rg4;
logic [4:0]opcode_rg2;
 logic [31:0]data_R1_rg3;
 logic [31:0]data_R1_rg4;
       logic haz_rg;
      parameter [31:0]width=32;     //width in n bit
      parameter [31:0]depth=27000;      //depth in n
logic [4:0]rd_rg4;    logic RWBEn_rg4;  logic [1:0]FselB,FselA;
logic haz_rg3,haz_rg4;
logic PCSel_l;
logic PCSel_rg3;
   logic Bn;
logic [1:0]enb;
  logic PCSel;
  logic [31:0]count;
  logic [31:0]ALU_OUT;
  logic [4:0]rs1,rs2,rd;
  logic [6:0]func_7;
  logic [2:0]func_3;
  logic [4:0]opcode;
  logic enb_3,enb_4;
  logic [1:0]enb_2;  
 //assign enb_3=1;
  logic [31:0]ALU_OUT_rg3;
 
    logic count_enb;logic haz;
    logic haz_rg2;
    logic B;logic bn2;
    // Program Counter
    logic [31:0]instt;
    logic [31:0]instt1;
    logic [31:0]instt2;
    logic [31:0]instt3;
    logic [31:0]instt4;
    logic [31:0]count_out;
        logic [31:0]count_out1;
            logic [31:0]count_out2;
                logic [31:0]count_out3;
                    logic [31:0]count_out4;
    PC #(width)pc_inst (reset,cpu_clk,count_enb,Bn,PCSel,ALU_OUT,count,count_out); 
    // Instruction Memory
    instruction_memory #(width,depth) IM(count,rs1,rs2,rd,opcode,func_3,func_7,instt); 
   //statge_1       
  ////
    logic [6:0]opcode1;
    logic [6:0]opcode2;
    logic [6:0]opcode3;
    logic [6:0]opcode4;
  assign Bn=((opcode==7'b11011||(opcode==7'b11001&&func_3==3'b000)))?(1'b1):(1'b0);
  logic [4:0]rs1_rg,rs2_rg,rd_rg;
  logic [4:0]opcode_rg;
  logic [6:0]func_7_rg;
  logic [2:0]func_3_rg;
  logic [31:0]count_rg;

  //Stage__1
stage_1 s_1(cpu_clk,reset,enb,count,rs1,rs2,rd,opcode,func_3,func_7,haz,instt,count_rg,rs1_rg,rs2_rg,rd_rg,opcode_rg,func_3_rg,func_7_rg,haz_rg,instt1);
  
  logic [2:0]ImmSel;
  logic [31:0]immGen_out;
  logic [1:0]WBSel;
  logic RegWEn;
  logic MEMRW;
  logic ASel,BSel,BrUn;
  logic [3:0]ALUSel;
  logic BrEq,BrLt;
  logic RegWEn_rg_final;
  logic [31:0]final_mux_out;
  logic [31:0]data_R1,data_R2;
  
  
 
  ////Imm_gen
   imm_gen  img(rs1_rg,rs2_rg,rd_rg,func_7_rg,func_3_rg,ImmSel,immGen_out);
     /////Control_unit
  
  control_unit control_unit_inst (func_3_rg,opcode_rg,func_7_rg[5],BrEq,BrLt,PCSel_l,ImmSel,BrUn,ASel,BSel,ALUSel,MEMRW,RegWEn,WBSel,B);  
  
//control_unit control_unit_inst(func_3_rg,opcode_rg,func_7_rg,BrEq,BrLt,PCSel,ImmSel,BrUn,ASel, BSel,ALUSel,MemRW, RegWEn,WBSel ); 
    // Register File
  reg_file reg_file_inst (cpu_clk,RWBEn_rg4,rs1_rg,rs2_rg,rd_rg4,final_mux_out,data_R1,data_R2);
  logic [31:0]d1,d2;

 
logic ASel_rg2,BSel_rg2,RWBEn_rg2;
logic [31:0]ImmOut_rg2,data_R1_rg2,data_R2_rg2,count_rg2,ImmOut;
logic [3:0]ALUSel_rg2;
logic MEMRW_rg2;logic [2:0]func_3_rg2; logic [4:0]rd_rg2;logic [1:0]WBSel_rg2;logic [4:0]rs1_rg2;logic [4:0]rs2_rg2;
//////stage ++2
stage_2 s_2(
cpu_clk,
reset,
enb_2,
immGen_out,
data_R1,data_R2,
count_rg,
ALUSel,
RegWEn,
ASel,
BSel,
WBSel,
rd_rg,
func_3_rg,
MEMRW,
rs1_rg,
rs2_rg,
haz_rg,
PCSel_l,
opcode_rg,
instt1,
ImmOut_rg2,
data_R1_rg2,
data_R2_rg2,
count_rg2,
ALUSel_rg2,
RWBEn_rg2,
ASel_rg2,
BSel_rg2,
MEMRW_rg2,
func_3_rg2,
rd_rg2,WBSel_rg2,
rs1_rg2,
rs2_rg2,
haz_rg2,
PCSel,
opcode_rg2,
instt2
);
 
logic [31:0]data_mux_b_alu;
logic [31:0]data_mux_a_out;


    //    // Branch Comparator
  //  Branch_comp branch_comp_inst (data_R1_rg2,data_R2_rg2,BrUn,BrLt,BrEq);

                          //data_mux_b_alu  //ImmOut_rg2  //data_mux_a_out
        //forward _B
     Forward_mux_b F_1(FselB,data_R2_rg2,ALU_OUT_rg3,final_mux_out,forward_b_out);
     //forward _A
     Forward_mux_a f_2(FselA,data_R1_rg2,ALU_OUT_rg3,final_mux_out,forward_a_out); 
         // MUX_A for ALU source A selection
    mux_A mux_a_inst (ASel_rg2,count_rg2,forward_a_out,data_mux_a_out);
        // ALU  mux b
    mux_B mux_b_inst (BSel_rg2,ImmOut_rg2,forward_b_out,data_mux_b_alu);
     //    // ALU
    ALU alu_inst(data_mux_a_out,data_mux_b_alu,ALUSel_rg2,ALU_OUT);
/////stage__3  
   logic [31:0]count_rg4,MEM_data_rg4,ALU_OUT_rg4;logic [1:0]WBSel_rg4;
  logic  MEMRW_rg3,RWBEn_rg3;logic [31:0]data_R2_rg3,count_rg3;logic [2:0]func_3_rg3;
   logic [4:0]rd_rg3;logic [1:0]WBSel_rg3;
//stage_3  s_3(cpu_clk,reset,enb_3,ALU_OUT,data_R2_rg2,RWBEn_rg2,MEMRW_rg2,count_rg2,func_3_rg2,rd_rg2,WBSel_rg2,haz_rg2,PCSel,ALU_OUT_rg3,data_R2_rg3,RWBEn_rg3,MEMRW_rg3,count_rg3,func_3_rg3,rd_rg3,WBSel_rg3,haz_rg3,PCSel_rg3);
stage_3  s_3(cpu_clk,reset,enb_3,ALU_OUT,data_R2_rg2,RWBEn_rg2,MEMRW_rg2,count_rg2,func_3_rg2,rd_rg2,WBSel_rg2,haz_rg2,PCSel,opcode_rg2,rs2_rg2,instt2,rs1_rg2,data_R1_rg2,ALU_OUT_rg3,data_R2_rg3,RWBEn_rg3,MEMRW_rg3,count_rg3,func_3_rg3,rd_rg3,WBSel_rg3,haz_rg3,PCSel_rg3,opcode_rg3,rs2_rg3,instt3,rs1_rg3,data_R1_rg3);

           logic [31:0]MEM_data;
    
  
logic [31:0]count_curr_rg4;
 
 stage_4 s_4(cpu_clk,reset,enb_4,count_rg3,ALU_OUT_rg3,MEM_data,rd_rg3,RWBEn_rg3,WBSel_rg3,haz_rg3,instt3,rs1_rg3,rs2_rg3,data_R1_rg3,data_R2_rg3,count_rg4,ALU_OUT_rg4,MEM_data_rg4,rd_rg4,RWBEn_rg4,WBSel_rg4,haz_rg4,count_curr_rg4,instt4,rs1_rg4,rs2_rg4,data_R1_rg4,data_R2_rg4);     

//    // Write Back MUX (mux_WB)
    mux_WB mux_wb_inst (ALU_OUT_rg4,MEM_data_rg4,count_rg4,WBSel_rg4,final_mux_out);
//////////////////////////////////////////////////////////////////////
//forwarding unit

forwarding_unit fu_1(opcode_rg3,haz_rg3,rs1_rg2,rs2_rg2,rd_rg3,rd_rg4,RWBEn_rg3,RWBEn_rg4,FselA,FselB);
logic [31:0]data_for_mem;
assign data_for_mem=(opcode_rg3==5'b01000&&(rs2_rg3==rd_rg4))?(ALU_OUT_rg4):(data_R2_rg3);
data_mem  DM(cpu_clk,ALU_OUT_rg3,data_for_mem,MEMRW_rg3,func_3_rg3,MEM_data);

//Haz_unit Hz_1(cpu_clk,reset,rs1_rg,rs2_rg,rd_rg2,MEMRW_rg2,PCSel_l,count_enb,enb,enb_2,enb_3,enb_4,haz,B);


branch_helper  bh(rs1_rg,rs2_rg,rd_rg2,rd_rg3,rd_rg4,ALU_OUT,ALU_OUT_rg3,ALU_OUT_rg4,data_R1,data_R2,d1,d2);

 // assign d1=data_R1; /////////////////////////////////////////////////////////////////////////////////////////////////////////
 // assign d2=data_R2;
logic b2,b3;
 logic [2:0]func_3_rg4;
 Branch_comp branch_comp_inst (d1,d2,BrUn,BrLt,BrEq);
 always_ff @(posedge cpu_clk)
 begin
   count_out1<=count_out;
    count_out2<=count_out1;
     count_out3<=count_out2;
      count_out4<=count_out3;
      
      b2<=B;
      b3<=b2;
// func_7_rg2<=func_7_rg;
// func_7_rg3<=func_7_rg2;
// func_7_rg4<=func_7_rg3;
// opcode1<=opcode;
// opcode2<=opcode1;
// opcode3<=opcode2;
// opcode4<=opcode3;
// func_3_rg4<=func_3_rg3;
 end
////////////////////////////////////////////
//tracer tracer_ip (
//    .clk_i(cpu_clk),                  
//    .rst_ni(reset),                 
//    .hart_id_i(32'b0),                  
//    .rvfi_valid(1'b1),                  
//    .rvfi_insn_t(instt4), 
//// .rvfi_insn_t({func_7_rg4,rs2_rg4,rs1_rg4,func_3_rg4,rd_rg4,opcode4}), 
//    .rvfi_rs1_addr_t(rs1_rg4),              
//    .rvfi_rs2_addr_t(rs2_rg4),              
//    .rvfi_rs1_rdata_t(data_R1_rg4),      
//    .rvfi_rs2_rdata_t(data_R2_rg4),        
//    .rvfi_rd_addr_t(rd_rg4),                
//    .rvfi_rd_wdata_t(final_mux_out),          // Write-back data (what is written to rd)
//    .rvfi_pc_rdata_t(count_curr_rg4),           // Current program counter value
// //   .rvfi_pc_wdata_t(count_rg4),          // Next program counter value (ALU result)  /// pc mux
//     .rvfi_pc_wdata_t(count_out4), 
//    .rvfi_mem_addr(0),            // Memory address is the ALU output  ///aluout
//    .rvfi_mem_rmask(4'b0),              // Memory read mask, assuming no memory operation in this case
//    .rvfi_mem_wmask(4'b0),              // Memory write mask, assuming no memory operation
//    .rvfi_mem_rdata(32'b0),             // Memory read data, assuming no memory read in this case
//    .rvfi_mem_wdata(32'b0)              // Memory write data, assuming no memory write in this case
//);
 
 Haz_unit  hz_1( cpu_clk,reset,rs1_rg,rs2_rg,rd_rg2,MEMRW_rg2,PCSel_rg3,count_enb,enb,enb_2,enb_3,enb_4,haz,b3);
endmodule

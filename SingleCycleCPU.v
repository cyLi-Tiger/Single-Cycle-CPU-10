`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/24 09:42:00
// Design Name: 
// Module Name: SingleCycleCPU
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


module MAIN(Clk,Reset);
  input Clk,Reset;
  wire [31:0] Inst,NEXTADDR,ALU_R,Qb,Qa,Addr;



  wire [31:0]Result,PCadd4,EXTIMM,InstL2,EXTIMML2,D,Y,Dout,mux4x32_2,R;
  wire Z,Regrt,Se,Wreg,Aluqb,Reg2reg,Cout,Wmem;
  wire [2:0]Pcsrc;
  wire [2:0]Aluc;
  wire [4:0]Wr;

  PC pc(Clk,Reset,Result,Addr);
  PCAdd4 pcadd4(Addr,PCadd4);
  im_4k instmem(Addr,Inst);

  CONUNIT conunit(Inst[31:26],Inst[5:0],Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg);
  MUX2X5 mux2x5(Inst[15:11],Inst[20:16],Regrt,Wr);

  SHIFTER_COMBINATION shifter1(Inst[26:0],PCadd4,InstL2);//J指令的跳转地址

  RegisterFile regfile(Inst[25:21],Inst[20:16],D,Wr,Wreg,Clk,Reset,Qa,Qb,Pcsrc,PCadd4);

  ALU alu(Qa,Y,Aluc,R,Z);
  dm_4k datamem(R,Qb,Wmem,Clk,Dout);
  MUX2X32 mux2x322(Dout,R,Reg2reg,D);//写寄存器堆的来源，是ALU 还是 DM
  SignExtend ext16t32(Inst[15:0],Se,EXTIMM);//扩展 0还是符号
  MUX2X32 mux2x321(EXTIMM,Qb,Aluqb,Y);//选择ALU B端的来源
  SHIFTER32_L2 shifter2(EXTIMM,EXTIMML2);
  CLA_32 cla_32(PCadd4,EXTIMML2,0,mux4x32_2, Cout);//beq bne的跳转至零


  MUX5X32 mux5x32(PCadd4,0,mux4x32_2,InstL2,Qa,Pcsrc,Result);//选择跳转的地址

  assign NEXTADDR=Result;
  assign ALU_R=R;

  integer i;
  initial begin
          $display("start simulation");
          //for (i=0;i<3;i=i+1)
            //  $display("%h %h", i,instmem.Rom[i]);
          //$display("%h %h",regfile.ReadReg1,regfile.ReadReg2);
          //$display("%h",pc.Address);
          //$display("%h",instmem.Addr);
      end

endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/24 09:42:00
// Design Name: 
// Module Name: REGFILE
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


module RegisterFile(ReadReg1,ReadReg2,WriteData,WriteReg,RegWrite,CLK,Reset,ReadData1,ReadData2,Pcsrc,PcAdd4);
    input [4:0] ReadReg1;//rs
    input [4:0] ReadReg2;//rt或者立即数
    input [31:0] WriteData;//写入的数据
    input [4:0] WriteReg;//写入地址
    input RegWrite; //写信号
    input CLK;
    input Reset;
    output reg[31:0] ReadData1;
    output reg[31:0] ReadData2;
    input [2:0] Pcsrc;
    input [31:0] PcAdd4;
    

    initial begin
       ReadData1 <=0;
       ReadData2 <=0; 
    end

    reg [31:0] regFile[0:31];
    integer i;
    initial begin
        for (i=0;i<32;i=i+1)
            regFile[i]<=0;
    end
        
    always@(ReadReg1 or ReadReg2)
    begin
        ReadData1 = regFile[ReadReg1];
        ReadData2 = regFile[ReadReg2];
        //$display("regfile %d %d\n", ReadReg1, ReadReg2);
        
    end
/*
    always@(posedge CLK)
    begin
     $display("pos lala");
    end
    
    always@(negedge CLK)
    begin
     $display("neg lala");
    end
  */  
    always@(negedge CLK )
    begin
     //$display("lala");
        if(RegWrite && WriteReg)
        begin
            regFile[WriteReg] = WriteData;
            //$display("%d %d",WriteReg, WriteData);
        end
    end

    always@(negedge CLK)
    begin
        //$display("lala");
        if(Pcsrc == 3'b100 && RegWrite )
        begin
        //$display("%h",PcAdd4);
            regFile[31] = PcAdd4;
        end
    end
endmodule


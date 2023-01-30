`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2023 00:36:52
// Design Name: 
// Module Name: ROM4x4tb
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


module memtb();
  wire[3:0] dout;
  reg[3:0] din;
  reg[1:0] addr;
  reg WE;
  reg clk;
  memory4x4 mem(dout,addr,din,WE,clk);
  initial
    begin
      clk=0;                   //providing clock
      forever
        #5clk=~clk;
    end

  initial
    begin
      #10WE=0; addr=0;      //default values
      #10WE=0; addr=1;
      #10WE=0; addr=2;
      #10WE=0; addr=3;
      #5WE=1;              //enabling writing and providing new value to address 2
      din=4'b1011;addr=2;
      #5WE=0;addr=2;         //reading and expecting new value for address 2
      #5WE=1;              //enabling writing and providing new value to address 0
      din=4'b0111;addr=0;
      #5WE=0;addr=0;        //reading and expecting new value for address 0
      din=4'b1000;
      #5
      WE=1;              //enabling writing and providing new value to address 1
      din=4'b1001;addr=1;
      #5WE=0;            //reading and expecting new value for address 1
      din=4'b1011;addr=1;
      #5WE=1;               //enabling writing and providing new value to address 3
      din=4'b1011;addr=3;
      #10WE=0; addr=3;        //reading and expecting new value for address 3
      $stop;
    end
  initial
    begin
      $monitor("for address= %0d,and WE=%0b,value of dout= %0b",addr,WE,dout,$time);
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
    end
endmodule
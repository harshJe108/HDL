`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2023 00:31:12
// Design Name: 
// Module Name: memory4x4
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


module memory4x4(output reg[3:0] dout, input wire[1:0]addr, input wire[3:0] din,input wire WE, clk);
  reg[3:0] rw[0:3];
  always@(posedge clk,WE, addr, din)
    begin
      if(WE)
        rw[addr]=din;
      else
        dout=rw[addr];
    end
  initial
    begin
      rw[0]=4'b1010;
      rw[1]=4'b1110;
      rw[2]=4'b0110;
      rw[3]=4'b1111;
    end
      
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2019 03:43:25 PM
// Design Name: 
// Module Name: audioout
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


module audioout(
        output anout,
        output ampSD,
        output sclk,
        output ncs_lr,
        input sdata,
        input clk
        );
    
    reg [4:0]clk_cntr_reg;
    reg pwm_val_reg;
    initial
    begin
        clk_cntr_reg=0;
        pwm_val_reg=0;
    end
    always @(posedge clk)
    begin
        clk_cntr_reg <= clk_cntr_reg + 1;
        //mic_clk <= clk_cntr_reg[4];
    end
    
    always @(posedge clk)
    begin
        if(clk_cntr_reg == 5'b01111) begin
            pwm_val_reg <= sdata;
        end
    end
    
    //sclk = 100MHz / 32 = 3.125 MHz
    assign sclk = clk_cntr_reg[4];
    
    assign anout = pwm_val_reg;
    assign ncs_lr = 1'b0;      //mic LRSel
    assign ampSD = 1'b1;
    
    
endmodule

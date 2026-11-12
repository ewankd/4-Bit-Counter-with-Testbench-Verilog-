`timescale 1ns/1ps
// 4-bit modulo-16 up-counter with active-high synchronous reset and enable.
// The output changes only on a rising edge of clk.
module counter4 (
    input  wire       clk,
    input  wire       rst,
    input  wire       enable,
    output reg [3:0] count
);
    always @(posedge clk) begin
        if (rst)
            count <= 4'd0;
        else if (enable)
            count <= count + 4'd1;
    end
endmodule

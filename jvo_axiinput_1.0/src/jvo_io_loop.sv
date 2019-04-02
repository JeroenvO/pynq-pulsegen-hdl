`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/29/2019 01:46:35 PM
// Design Name:
// Module Name: jvo_io_loop
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


module jvo_io_loop(
    input wire clk,
    input wire [31:0] cnt_beg [19:0],
    input wire [31:0] cnt_end [19:0],
    input wire [31:0] io_init,
    output wire [3:0] led,
    output reg [19:0] io,
    input wire [1:0] sw,
//    input wire [3:0] btn,
    output reg led4_r,
    output reg led4_g,
    output reg led4_b,
    output reg led5_r,
    output reg led5_g,
    output reg led5_b,
    input wire [31:0] max_count
    );

    integer count = 0;
    initial begin
    led4_r = 1'b0;
    led4_g = 1'b0;
    led4_b = 1'b1;
    led5_r = 1'b1;
    led5_g = 1'b1;
    led5_b = 1'b1;
    end


    //counter
    always@ (posedge clk) begin
    if (sw[1] == 1'b1) begin // enable
        if (sw[0] == 1'b1) begin
            //green
            led5_g <= 1'b1;
            led5_r <= 1'b0;
            led5_b <= 1'b0;
                if (count == max_count) begin  // hardcoded one second for 8ns clock
                    count <= 0;
                    led4_r <= ~led4_r;
                    led4_g <= 1'b0;
                    led4_b <= ~led4_b;
                    end
                else begin
                    count <= count +1;
                    end
            end
        else begin
            //orange
            count <= 0;
            led5_g <= 1'b1;
            led5_r <= 1'b1;
            led5_b <= 1'b0;
            led4_r <= 1'b0;
            led4_g <= 1'b0;
            led4_b <= 1'b1;
        end
    end
    else begin //disable
        //red
        count <= 0;
        led5_r <= 1'b1;
        led5_g <= 1'b0;
        led5_b <= 1'b0;
        led4_r <= 1'b1;
        led4_g <= 1'b0;
        led4_b <= 1'b0;
    end
    end

     //logic for io ports
    genvar c;
    generate
        for (c = 0; c < 20; c = c + 1) begin: test  // 20 outputs
            always @(posedge clk) begin
                if (sw[0]==1'b1 & sw[1]==1'b1)
                    begin
                        if (count == cnt_beg[c])
                            io[c] <= ~io_init[c];
                        else if (count == cnt_end[c])
                            io[c] <= io_init[c];
                        else
                            io[c] <= io[c];
                    end
                else
                    begin
                        // disable outputs
                        io[c] <= 1'b0;
                    end
            end
        end
    endgenerate
    assign led[0] = io[0];
    assign led[1] = io[1];
    assign led[2] = io[2];
    assign led[3] = io[3];

endmodule

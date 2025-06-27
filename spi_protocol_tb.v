`timescale 1ns / 1ps

module spi_protocol_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg [15:0] datain;
    
    wire spi_cs_l;
    wire spi_sclk;
    wire spi_data;
    wire [4:0] counter;

    // Instantiate the SPI module
    spi_protocol uut (
        .clk(clk),
        .reset(reset),
        .datain(datain),
        .spi_cs_l(spi_cs_l),
        .spi_sclk(spi_sclk),
        .spi_data(spi_data),
        .counter(counter)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin


        // Initialize inputs
        reset = 1;
        datain = 16'b1010_1100_1111_0001;

        #20;
        reset = 0;

        #500;

        $finish;
    end



endmodule

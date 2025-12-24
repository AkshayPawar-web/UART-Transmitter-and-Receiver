`timescale 1ns / 1ps

module uart_test;

  reg clk;
  reg rst;
  reg tx_start;
  reg [7:0] tx_data_in;
  
  wire tx_wire;       
  wire [7:0] rx_data;
  wire rx_done;
  wire tx_busy;
  wire tx_done;

  // Instantiate Top Module
  uart_top uut (
    .clk(clk),
    .rst(rst),
    
    .rx(tx_wire),// Input 'rx' gets signal from Output 'tx'
    .tx(tx_wire),
    
    .rx_data(rx_data),
    .rx_done(rx_done),
    .tx_start(tx_start),
    .tx_data_in(tx_data_in),
    .tx_busy(tx_busy),
    .tx_done(tx_done)
  );

  // Clock Generation 
  initial begin
    clk = 0;
    forever #20 clk = ~clk;
  end

  initial begin
    $dumpfile("uart_test.vcd");
    $dumpvars(0, uart_top);

    rst = 1;
    tx_start = 0;
    tx_data_in = 0;

    #200;
    rst = 0;
    #200;

    // Send 0xAB (10101011)
    @(posedge clk);
    tx_data_in = 8'hAB;
    tx_start = 1;
    @(posedge clk);
    tx_start = 0;

    // Wait for RX Done
    @(posedge rx_done);
    
    #100; 
    
    if (rx_data == 8'hAB)
      $display("PASSED: Sent 0xAB, Received 0x%h", rx_data);
    else
      $display("FAILED: Sent 0xAB, Received 0x%h", rx_data);

    #1000;
    $finish;
  end

endmodule

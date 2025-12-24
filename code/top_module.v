module uart_top
  (
    input  wire clk,
    input  wire rst,
    
    // RX Interface
    input  wire rx,
    output wire [7:0] rx_data,
    output wire rx_done,
    
    // TX Interface
    input  wire tx_start,
    input  wire [7:0] tx_data_in,
    output wire tx,
    output wire tx_busy,
    output wire tx_done
  );

  // Wires to connect Baud Generator 
  wire tx_enable;
  wire rx_enable;

  baud_rate_gen baud_gen (
    .clk(clk),
    .rst(rst),
    .tx_enb(tx_enable),
    .rx_enb(rx_enable)
  );

  transmmiter tx_inst (
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .tx_data_in(tx_data_in),
    .tx_enb(tx_enable),
    .tx(tx),
    .tx_busy(tx_busy),
    .tx_done(tx_done)
  );

  receiver rx_inst (
    .clk(clk),
    .rst(rst),
    .rx(rx),
    .rx_enb(rx_enable), 
    .rx_done(rx_done),
    .rx_data(rx_data)
  );

endmodule

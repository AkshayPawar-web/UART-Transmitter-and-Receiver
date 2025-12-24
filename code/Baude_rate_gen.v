module baud_rate_gen(
    input clk,
    input rst,
    output tx_enb,
    output rx_enb
);

// TX Counter: 25MHz / 115200 = 217. Count 0 to 216.
    reg [7:0] tx_counter;
    // RX Counter: 25MHz / (115200 * 16) = 13.5 (~14). Count 0 to 13.
    reg [3:0] rx_counter; //16 is sampling factor 
    always @(posedge clk) begin
        if (rst)
            tx_counter <= 8'd0;
        else if (tx_counter == 8'd216) 
            tx_counter <= 8'd0;
        else
            tx_counter <= tx_counter + 1'b1;
    end
    always @(posedge clk) begin
        if (rst)
            rx_counter <= 4'd0;
        else if (rx_counter == 4'd13) 
            rx_counter <= 4'd0;
        else
            rx_counter <= rx_counter + 1'b1;
    end
    assign tx_enb = (tx_counter == 8'd0);
    assign rx_enb = (rx_counter == 4'd0);
endmodule

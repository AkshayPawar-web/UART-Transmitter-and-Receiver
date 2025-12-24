module receiver
  (
    input  wire clk,
    input  wire rst,
    input  wire rx,
    input  wire rx_enb,     // Connected to baude rate generator 
    output reg  rx_done,
    output reg  [7:0] rx_data
  );

  parameter IDLE  = 2'b00;
  parameter START = 2'b01;
  parameter DATA  = 2'b10;
  parameter STOP  = 2'b11;

  reg [1:0] state;
  reg [3:0] count; 
  reg [2:0] bit_index;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      state      <= IDLE;
      rx_done    <= 0;
      count <= 0;
      bit_index  <= 0;
      rx_data    <= 0;
    end 
    else begin
      
      case (state)
        IDLE: begin
          rx_done    <= 0;
          count <= 0;
          bit_index  <= 0;
          if (rx == 0) // Start bit 
            state <= START;
        end

        START: begin
          if (rx_enb) begin
            if (count == 7) begin 
              count <= 0;
              if (rx == 0)
                state <= DATA;
              else
                state <= IDLE;
            end 
            else begin
              count <= count + 1;
            end
          end
        end

        DATA: begin
          if (rx_enb) begin
            if (count == 15) begin
              count <= 0;
              rx_data[bit_index] <= rx;
              if (bit_index == 7)
                state <= STOP;
              else
                bit_index <= bit_index + 1;
            end 
            else begin
              count <= count + 1;
            end
          end
        end

        STOP: begin
          if (rx_enb) begin
            if (count == 15) begin
              rx_done <= 1;
              state   <= IDLE;
            end 
            else begin
              count <= count + 1;
            end
          end
        end
        
        default: state <= IDLE;
      endcase
    end
  end
endmodule

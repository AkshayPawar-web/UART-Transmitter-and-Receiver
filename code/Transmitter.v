module transmmiter
  (
    input  wire clk,
    input  wire rst,
    input  wire tx_start,
    input  wire [7:0] tx_data_in,
    input  wire tx_enb,    // Connected to your generator
    output reg  tx,
    output reg  tx_busy,
    output reg  tx_done
  );

  parameter IDLE  = 2'b00;
  parameter START = 2'b01;
  parameter DATA  = 2'b10;
  parameter STOP  = 2'b11;

  reg [1:0] state;
  reg [2:0] bit_index;
  reg [7:0] data_reg;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      state     <= IDLE;
      tx        <= 1; // Idle High
      tx_busy   <= 0;
      tx_done   <= 0;
      bit_index <= 0;
      data_reg  <= 0;
    end
    else begin
      
      tx_done <= 0; // Default low

      case (state)
        IDLE: begin
          tx <= 1;
          bit_index <= 0;
          if (tx_start) begin
            data_reg <= tx_data_in;
            tx_busy  <= 1;
            state    <= START;
          end 
          else begin
            tx_busy  <= 0;
          end
        end

        START: begin
          tx <= 0; // Start bit = 0
          if (tx_enb) 
            state <= DATA;
        end

        DATA: begin
          tx <= data_reg[bit_index];
          if (tx_enb) begin
            if (bit_index == 7) begin
              bit_index <= 0;
              state <= STOP;
            end 
            else begin
              bit_index <= bit_index + 1;
            end
          end
        end

        STOP: begin
          tx <= 1; // Stop bit = 1
          if (tx_enb) begin
            tx_done <= 1;
            state   <= IDLE;
            tx_busy <= 0;
          end
        end
        
        default: state <= IDLE;
      endcase
    end
  end
endmodule

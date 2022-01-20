/*
   This file was generated automatically by Alchitry Labs version 1.2.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module blink_2 (
    input clk,
    input rst,
    output reg [7:0] leds
  );
  
  
  
  reg [31:0] M_counter_d, M_counter_q = 1'h0;
  
  always @* begin
    M_counter_d = M_counter_q;
    
    leds[0+0-:1] = M_counter_q[31+0-:1];
    leds[1+0-:1] = M_counter_q[30+0-:1];
    leds[2+0-:1] = M_counter_q[29+0-:1];
    leds[3+0-:1] = M_counter_q[28+0-:1];
    leds[4+0-:1] = M_counter_q[27+0-:1];
    leds[5+0-:1] = M_counter_q[26+0-:1];
    leds[6+0-:1] = M_counter_q[25+0-:1];
    leds[7+0-:1] = M_counter_q[24+0-:1];
    M_counter_d = M_counter_q + 1'h1;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
endmodule

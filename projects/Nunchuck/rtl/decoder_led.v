module decoder_led(
  input clk,
  input [3:0] data,
  output reg [7:0] seg
);

always @(posedge clk) begin
 case(data)
  'h0: seg <= 5'd1;
  'h1: seg <= 5'd2;
  'h2: seg <= 5'd3;
  'h3: seg <= 5'd4;
  'h4: seg <= 5'd5;
  'h5: seg <= 5'd6;
  'h6: seg <= 5'd7;
  'h7: seg <= 5'd8;
  'h8: seg <= 5'd9;
  'h9: seg <= 5'd10;
  'hA: seg <= 5'd11;
  'hB: seg <= 5'd12;
  'hC: seg <= 5'd13;
  'hD: seg <= 5'd14;
  'hE: seg <= 5'd15;
  'hF: seg <= 5'd16;
 endcase
end
endmodule

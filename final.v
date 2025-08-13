module final(clk,fm_out);
reg [11:0]sin1,sin2,cos1,cos2;
input clk;
output [23:0]fm_out;
wire [23:0]mul,cascade;

signal1 a1(.fsin_o(sin1),.fcos_o(cos1),.phi_inc_i(32'd42950),.clk(clk),.reset_n(1'b1),.clken(1'b1));//for massage signal
signal2 a2(.fsin_o(sin2),.fcos_o(cos2),.phi_inc_i(32'd42949673),.clk(clk),.reset_n(1'b1),.clken(1'b1));//for carrier signal
assign cascade={11'b0,cos1};
assign mul=sin1*sin2;
assign fm_out=cascade-mul;

endmodule 
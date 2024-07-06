`include "verilog_files/fp_adder.v"








module top();
reg[63:0] a, b;  // they should hold one bit value input, thus 'reg' (input sholuld always be reg)
reg[2:0] sel;
wire[63:0] out;     // output should be 'wire'
wire[127:0] pro;
wire carry;
//

FP_ADDER fpadder1(a, b, out);

initial begin   // initializing values
    #0
	a = 64'b0100000001000100000000000000000000000000000000000000000000000000;
	b = 64'b0100000001000101000000000000000000000000000000000000000000000000;
	sel = 3'b000;
end

initial
$monitor("%b", out);
	// $monitor("%0t     a = %b ; b = %b; cin = %b; sum = %b; ca = %b",$time, a, b, cin ,sum, ca);
endmodule
	
// Lines to be changed: (1, (15), 18, 22, 23, 24, 28, 29)
// corresponding indices: (0, (14), 17, 21, 22, 23, 27, 28)
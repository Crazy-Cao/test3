// *********************************************************************************
// Project Name : Fall edge detect
// Email        : 
// Website      : 
// Create Time  : 201// 
// File Name    : .v
// Module Name  : 
// Abstract     : Detecting the falling edge of input signal
// editor		: sublime text 3
// *********************************************************************************
// Modification History:
// Date         By              Version                 Change Description
// -----------------------------------------------------------------------
// 201//    Crazy Cao           1.0                     Original
//  
// *********************************************************************************
`timescale      1ns/1ns
module falledge_detect
		(clk,
		rst_n,
		sig_a,
		sig_a_falledge);

input	clk;
input	rst_n;
input	sig_a;
output	sig_a_falledge;

reg	[1:0] sig_a_d;

always @(posedge clk, negedge rst_n) begin
	if(!rst_n)
		sig_a_d <= 2'b00;
	else
		sig_a_d <= {sig_a_d[0], sig_a};
end

assign sig_a_falledge = sig_a_d[1] & !sig_a_d[0];

endmodule
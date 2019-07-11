// *********************************************************************************
// Project Name : 
// Email        : 
// Website      : 
// Create Time  : 201// 
// File Name    : .v
// Module Name  : 
// Abstract     :
// editor		: sublime text 3
// *********************************************************************************
// Modification History:
// Date         By              Version                 Change Description
// -----------------------------------------------------------------------
// 201//    Crazy Cao           1.0                     Original
//  
// *********************************************************************************
`timescale      1ns/1ns
module anyedge_detect
		(input 	clk,
		input	rst_n,
		input	sig_a,
		output	sig_a_anyedge);

reg		[1:0]	sig_a_d;

always @(posedge clk, negedge rst_n) begin
	if(!rst_n)
		sig_a_d <= 2'd0;
	else
		sig_a_d <= {sig_a_d[0], sig_a};
end

assign sig_a_anyedge = sig_a_d[0] ^ sig_a_d[1];

endmodule
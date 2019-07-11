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
module posedge_detect
		(clk,
		rst_n,
		sig_a,
		sig_a_risedge);
input 	clk;
input 	rst_n;
input 	sig_a;
output 	sig_a_risedge;

reg		[1:0]	sig_a_d1;

always @(posedge clk, negedge rst_n) begin
	if(!rst_n)
		sig_a_d1 <= 2'b00;
	else
		sig_a_d1 <= {sig_a_d1[0],sig_a};
end

assign sig_a_risedge = sig_a_d1[0] & !sig_a_d1[1];

endmodule


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
module risedge_detect_test();
reg clk;
reg rst_n;
reg sig_a;
wire  sig_a_risedge;
wire  sig_a_falledge;
wire  sig_a_anyedge1, sig_a_anyedge2;

reg clk1;

initial begin
	clk = 0;
	clk1 = 0;
	rst_n = 1;
	#2 rst_n = 0;
	#2 rst_n = 1;
	sig_a = 0;
end

always #5 clk = ~clk;

always #2 clk1 = ~clk1;

always #50 sig_a = ~sig_a;


posedge_detect risedge_u(
					.clk(clk),
					.rst_n(rst_n),
					.sig_a(sig_a),
					.sig_a_risedge(sig_a_risedge)
				);

falledge_detect falledge_u(
					.clk(clk),
					.rst_n(rst_n),
					.sig_a(sig_a),
					.sig_a_falledge(sig_a_falledge)
				  );

anyedge_detect anyedge_u1
				(.clk(clk),
				.rst_n(rst_n),
				.sig_a(sig_a),
				.sig_a_anyedge(sig_a_anyedge1)
				);

anyedge_detect anyedge_u2
				(.clk(clk1),
				.rst_n(rst_n),
				.sig_a(sig_a_anyedge1),
				.sig_a_anyedge(sig_a_anyedge2)
				);

endmodule
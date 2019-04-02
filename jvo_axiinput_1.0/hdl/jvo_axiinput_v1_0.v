
`timescale 1 ns / 1 ps

	module jvo_axiinput_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 8
	)
	(
		// Users to add ports here
        input wire sysclk,
        input wire [1:0] sw,
        input wire [3:0] btn,
        output wire [3:0] led,
        output wire led4_r,
        output wire led4_g,
        output wire led4_b,   
        output wire led5_r,
        output wire led5_g,
        output wire led5_b,
        output wire [13:0] ar,
        output wire [5:0] a,
		// User ports ends
		// Do not modify the ports beyond this line

		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);      

    wire [19:0] io;
// Instantiation of Axi Bus Interface S00_AXI
	jvo_axiinput_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) jvo_axiinput_v1_0_S00_AXI_inst (
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready),
		
		 .sysclk(sysclk),
        .led(led),
        .io(io),
        .sw(sw),
        .btn(btn),
        .led4_r(led4_r),
        .led4_g(led4_g),
        .led4_b(led4_b),   
        .led5_r(led5_r),
        .led5_g(led5_g),
        .led5_b(led5_b)
	);

	// Add user logic here
	//port mapping
    assign io[0 ]=ar[13];
    assign io[1 ]=ar[12];
    assign io[2 ]=ar[11];
    assign io[3 ]=ar[10];
    assign io[4 ]=ar[9];
    assign io[5 ]=ar[8];
    assign io[6 ]=ar[7];
    assign io[7 ]=ar[6];
    assign io[8 ]=a[0];
    assign io[9 ]=ar[5];
    assign io[10]=a[1];
    assign io[11]=ar[4];
    assign io[12]=a[2];
    assign io[13]=ar[3];
    assign io[14]=a[3];
    assign io[15]=ar[2];
    assign io[16]=a[4];
    assign io[17]=ar[1];
    assign io[18]=a[5];
    assign io[19]=ar[0];
    
	// User logic ends

	endmodule

module clock_divider(
    input clk,
    output reg divided_clk = 0
    );

	integer counter_value = 0;
	 
	always@ (posedge clk)
		begin
			if(counter_value == 2400000)
				counter_value <= 0;
			else
				counter_value <= counter_value + 1;
		end
		
	 always@ (posedge clk)
		begin
			if(counter_value == 2400000)//2400000
				divided_clk <= ~divided_clk;
			else
				divided_clk <= divided_clk;
		end
endmodule

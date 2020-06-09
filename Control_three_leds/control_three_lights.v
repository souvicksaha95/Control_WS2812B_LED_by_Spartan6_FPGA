module control_three_leds(clk, see, see_clk);
    input clk;
    output reg see;
	 output see_clk;
	 reg [3:0] state = 0;
	 reg [23:0] string [2:0];
	 integer i = 23, j = 2, counter = 0, num_of_leds = 3;
	 reg cur_bool, finish;
	 
assign see_clk = clk;

initial
	begin
		string[2] = 24'b111111110000000000000000; // GREEN
		string[1] = 24'b000000001111111100000000; // RED
		string[0] = 24'b000000000000000011111111; // BLUE
		cur_bool = string[j][i];
		finish = 1;
	end
	
always @(posedge clk)
	begin
		if (finish)
			begin
			if (cur_bool)
				begin
					see = (state <= 9) ? 1 : 0;
				end
			else if(!cur_bool)
				begin
					see = (state <= 4) ? 1 : 0;
				end
			if (state <= 13) state = state + 1;
			else
				begin
					state = 0;
					i = i - 1;
					cur_bool = string[j][i];
				end
			if (i < 0)
				begin
					i = 23;
					if (j > 0) j = j - 1;
					else if (j == 0)
						begin
							j = 2;
							finish = 0;
						end
					cur_bool = string[j][i];
				end
			end
		else if(finish == 0)
			begin
				counter = (counter <= 29000) ? counter + 1 : 0;
				if (counter == 0) finish = 1;
			end
	end
	
endmodule

module CACHE_TB;
    reg[20:0] read_addr, write_addr;
    reg[63:0] write_data;
    reg clk, read_enable, write_enable;

    wire[63:0] read_data;

    CACHE cache(read_addr, read_data, read_enable, write_addr, write_data, write_enable, clk);

    initial begin
        clk = 0;
        forever begin
            #2 clk = ~clk;
        end
    end
    

    initial begin
        //Read Miss
		#10 read_enable = 1'b1;
		read_addr = 21'b100000011100000001011;
		#10 read_enable = 1'b0;
		#10$display("%d # %b: %h", $time, read_addr, read_data);

        //Write Hit
		#10 write_enable = 1'b1;
		write_addr = 21'b100000011100000001011;
		write_data = 64'habcdef1010110110;
		#10 write_enable = 1'b0;

		//Read Hit
		#10 read_enable = 1'b1;
		read_addr = 21'b100000011100000001011;
		#10 read_enable = 1'b0;
		#10 $display("%d # %b: %h", $time, read_addr, read_data);

		//Read Miss 
        // Since Different Tag(Which means that the modulo of frame is same but came from different division of main memory). So miss will happen. But the same line is already written previously. so data present in that line will be written to main memory.
		#10 read_enable = 1'b1;
		read_addr = 21'b111000011100000001011;
		#10 read_enable = 1'b0;
		#10 $display("%d # %b: %h", $time, read_addr, read_data);

		//Read Miss
		#10 read_enable = 1'b1;
		read_addr = 21'b100000011100000001011;
		#10 read_enable = 1'b0;
		#10 $display("%d # %b: %h", $time, read_addr, read_data);
		
		//Write Miss
		#10 write_enable = 1'b1;
		write_addr = 21'b101000011100000001011;
		write_data = 64'h01011120abcdef;
		#10 write_enable = 1'b0;

		//Read Hit
		#10 read_enable = 1'b1;
		read_addr = 21'b101000011100000001011;
		#10 read_enable = 1'b0;
		#10 $display("%d # %b: %h", $time, read_addr, read_data);
		
		#200 $finish;
    end

endmodule


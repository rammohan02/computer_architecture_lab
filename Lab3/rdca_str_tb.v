
module RCDA_TB;
    reg[63:0] a, b;

    wire[63:0] sum;
    wire carry;

    RCDA rcda1(a, b, 1'b0, sum, carry);


    initial begin
        #0 a=64'b0010010101010110110110111010000100010001100100010100010001011010;                                                      b=64'b0111000110000110100110000110000111011110110111100111001110111011;
        //sum=1001011011011101011101000000001011110000011011111011100000010101 carry=0

        // a=15703793010140570380 b=8400695157779202120
        #10 a=64'b1101100111101111000101001000101001011011101100001110001100001100;                                                       b=64'b0111010010010101010000111011110010111001110001100000000001001000;
        //sum=0100111010000100010110000100011100010101011101101110001101010100 carry=1

        // a=2690579312231400633 b=8180393319283454732 sum=10870972631514855445
        #10 a=64'b1010010101010110110110111010000100010001100100010100010001011010;                                                   b=64'b0111000110000110100110000110000111011110110111100111001110111011;
        //    0101010011011000011001000000000011000101010011110011100000010101
        //sum=010001011011011101011101000000001011110000011011111011000000000000 carry=0


        // a=15703793010140570380 b=8400695157779202120
        #10 a=64'b0101100111101111000101001000101001011011101100001110001100001101;                                                       b=64'b0111010010010101010000111011110010111001110001100000000001001010;
        //sum=0100111010000100010110000100011100010101011101101110001101010100 carry=1

        
        #10 a=64'b1111111111111111111111111111111111111111111111111111111111111111;                                                       b=64'b1111111111111111111111111111111111111111111111111111111111111111;

        #10;
    end

    initial begin
        $monitor(" in1=%b \n in2=%b \n sum=%b \n carry=%b", a, b, sum, carry);
        $dumpfile("rcda.vcd");
        $dumpvars(0, rcda1);
    end
endmodule

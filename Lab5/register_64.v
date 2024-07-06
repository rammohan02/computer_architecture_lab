module REGISTERFILE (write, writeReg, writeData, readReg1, readData1, readReg2, readData2, clk);
    input[4:0] writeReg;
    input[63:0] writeData;
    input write;

    input[4:0] readReg1, readReg2;

    // wire [63:0] regFile[0:31];

    output[63:0] readData1, readData2;

    input clk;

    reg[63:0] regFile[0:31];

    assign readData1 = regFile[readReg1];
    assign readData2 = regFile[readReg2];

    initial begin
        regFile[0] = 64'b0;
        regFile[1] = 64'b0;
        regFile[2] = 64'b0;
        regFile[3] = 64'b0;
        regFile[4] = 64'b0;
        regFile[5] = 64'b0;
        regFile[6] = 64'b0;
        regFile[7] = 64'b0;
        regFile[8] = 64'b0;
        regFile[9] = 64'b0;
        regFile[10] = 64'b0;
        regFile[11] = 64'b0;
        regFile[12] = 64'b0;
        regFile[13] = 64'b0;
        regFile[14] = 64'b0;
        regFile[15] = 64'b0;
        regFile[16] = 64'b0;
        regFile[17] = 64'b0;
        regFile[18] = 64'b0;
        regFile[19] = 64'b0;
        regFile[20] = 64'b0;
        regFile[21] = 64'b0;
        regFile[22] = 64'b0;
        regFile[23] = 64'b0;
        regFile[24] = 64'b0;
        regFile[25] = 64'b0;
        regFile[26] = 64'b0;
        regFile[27] = 64'b0;
        regFile[28] = 64'b0;
        regFile[29] = 64'b0;
        regFile[30] = 64'b0;
        regFile[31] = 64'b0;
    end

    always @(posedge clk) begin
        // if (write) begin
        //     regFile[writeReg] = writeData;
        // end
        regFile[writeReg] = writeData & {64{write}};
        
    end

    // assign regFile[writeReg] = writeData & {64{write}};
endmodule
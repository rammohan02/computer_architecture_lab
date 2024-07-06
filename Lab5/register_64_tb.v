module REGISTERFILE_TB ;
    reg[4:0] writeReg;
    reg[63:0] writeData;
    reg write;

    reg[4:0] readReg1, readReg2;

    wire[63:0] readData1, readData2;
    
    reg clk;

    reg[4:0] index;

    // reg[63:0] regFile[0:31];

    
    REGISTERFILE regfile1(write, writeReg, writeData, readReg1, readData1, readReg2, readData2, clk);
        
    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        clk = 0;
        write = 1;
        
        $display("Writing Data");
        #0 writeReg = 2; writeData = 10;
        $display("Write Address: %d, WriteData: %d", writeReg, writeData);
        #10 writeReg = 23; writeData = 100;
        $display("Write Address: %d, WriteData: %d", writeReg, writeData);
        #10 writeReg = 20; writeData = 45;
        $display("Write Address: %d, WriteData: %d", writeReg, writeData);
        #10 writeReg = 10; writeData = 32;
        $display("Write Address: %d, WriteData: %d", writeReg, writeData);
        #10 writeReg = 11; writeData = 31;
        $display("Write Address: %d, WriteData: %d", writeReg, writeData);

        write = 0;

        $display("\nReading");
        #10 readReg1 = 2; readReg2 = 23;
        #2 $display("Read Address1: %d, Read Data1: %d \tRead Address2: %d, Read Data2: %d", readReg1, readData1, readReg2, readData2);
        #10 readReg1 = 20; readReg2 = 10;
        #2 $display("Read Address1: %d, Read Data1: %d \tRead Address2: %d, Read Data2: %d", readReg1, readData1, readReg2, readData2);

        // $display("Writing Data");
        // for (index = 0; index < 31; index = index + 1) begin
        //     #10 writeReg = index; writeData = index;
        //     $display("Write Address: %d, WriteData: %d", writeReg, writeData);
        // end

        // write = 0;

        // $display("\nReading");

        // for (index = 0; index < 30; index = index + 2) begin
        //     #10 readReg1 = index; readReg2 = index+  1;
        //     #2 $display("Read Address1: %d, Read Data1: %d \tRead Address2: %d, Read Data2: %d", readReg1, readData1, readReg2, readData2);
        // end

        $finish(500);
    end


endmodule
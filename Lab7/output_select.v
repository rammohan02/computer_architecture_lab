module MUX_8X1 (sel, in1, in2, in3, in4, in5, in6, in7, in8, out);
    input[2:0] sel;
    input in1, in2, in3, in4, in5, in6, in7, in8;
    output out;

    wire[7:0] c;
    wire tmp, tmp2;
    wire[2:0] neg_sel;
    
    not(neg_sel[0], sel[0]);
    not(neg_sel[1], sel[1]);
    not(neg_sel[2], sel[2]);

    and(c[0], in1, neg_sel[2], neg_sel[1], neg_sel[0]);
    and(c[1], in2, neg_sel[2], neg_sel[1], sel[0]);
    and(c[2], in3, neg_sel[2], sel[1], neg_sel[0]);
    and(c[3], in4, neg_sel[2], sel[1], sel[0]);
    and(c[4], in5, sel[2], neg_sel[1], neg_sel[0]);
    and(c[5], in6, sel[2], neg_sel[1], sel[0]);
    and(c[6], in7, sel[2], sel[1], neg_sel[0]);
    and(c[7], in8, sel[2], sel[1], sel[0]);

    or(tmp, c[0], c[1], c[2], c[3]);
    or(tmp2, c[4], c[5], c[6], c[7]);
    or(out, tmp, tmp2);
    
endmodule

module SELECT (sel, and_, nand_, or_, nor_, xor_, not_, t_comp, xnor_, out);
    input[2:0] sel;
    input[63:0] and_, nand_, or_, nor_, xor_, not_, t_comp, xnor_;

    output[63:0] out;

    // MUX_8X1 mux1(sel, and_[0], xor_[0], nand_[0], or_[0], not_[0], nor_[0], t_comp[0], xnor[0], out[0]);

    MUX_8X1 mux1(sel, and_[0], xor_[0], nand_[0], or_[0], not_[0], nor_[0], t_comp[0], xnor_[0], out[0]);
    MUX_8X1 mux2(sel, and_[1], xor_[1], nand_[1], or_[1], not_[1], nor_[1], t_comp[1], xnor_[1], out[1]);
    MUX_8X1 mux3(sel, and_[2], xor_[2], nand_[2], or_[2], not_[2], nor_[2], t_comp[2], xnor_[2], out[2]);
    MUX_8X1 mux4(sel, and_[3], xor_[3], nand_[3], or_[3], not_[3], nor_[3], t_comp[3], xnor_[3], out[3]);
    MUX_8X1 mux5(sel, and_[4], xor_[4], nand_[4], or_[4], not_[4], nor_[4], t_comp[4], xnor_[4], out[4]);
    MUX_8X1 mux6(sel, and_[5], xor_[5], nand_[5], or_[5], not_[5], nor_[5], t_comp[5], xnor_[5], out[5]);
    MUX_8X1 mux7(sel, and_[6], xor_[6], nand_[6], or_[6], not_[6], nor_[6], t_comp[6], xnor_[6], out[6]);
    MUX_8X1 mux8(sel, and_[7], xor_[7], nand_[7], or_[7], not_[7], nor_[7], t_comp[7], xnor_[7], out[7]);
    MUX_8X1 mux9(sel, and_[8], xor_[8], nand_[8], or_[8], not_[8], nor_[8], t_comp[8], xnor_[8], out[8]);
    MUX_8X1 mux10(sel, and_[9], xor_[9], nand_[9], or_[9], not_[9], nor_[9], t_comp[9], xnor_[9], out[9]);
    MUX_8X1 mux11(sel, and_[10], xor_[10], nand_[10], or_[10], not_[10], nor_[10], t_comp[10], xnor_[10], out[10]);
    MUX_8X1 mux12(sel, and_[11], xor_[11], nand_[11], or_[11], not_[11], nor_[11], t_comp[11], xnor_[11], out[11]);
    MUX_8X1 mux13(sel, and_[12], xor_[12], nand_[12], or_[12], not_[12], nor_[12], t_comp[12], xnor_[12], out[12]);
    MUX_8X1 mux14(sel, and_[13], xor_[13], nand_[13], or_[13], not_[13], nor_[13], t_comp[13], xnor_[13], out[13]);
    MUX_8X1 mux15(sel, and_[14], xor_[14], nand_[14], or_[14], not_[14], nor_[14], t_comp[14], xnor_[14], out[14]);
    MUX_8X1 mux16(sel, and_[15], xor_[15], nand_[15], or_[15], not_[15], nor_[15], t_comp[15], xnor_[15], out[15]);
    MUX_8X1 mux17(sel, and_[16], xor_[16], nand_[16], or_[16], not_[16], nor_[16], t_comp[16], xnor_[16], out[16]);
    MUX_8X1 mux18(sel, and_[17], xor_[17], nand_[17], or_[17], not_[17], nor_[17], t_comp[17], xnor_[17], out[17]);
    MUX_8X1 mux19(sel, and_[18], xor_[18], nand_[18], or_[18], not_[18], nor_[18], t_comp[18], xnor_[18], out[18]);
    MUX_8X1 mux20(sel, and_[19], xor_[19], nand_[19], or_[19], not_[19], nor_[19], t_comp[19], xnor_[19], out[19]);
    MUX_8X1 mux21(sel, and_[20], xor_[20], nand_[20], or_[20], not_[20], nor_[20], t_comp[20], xnor_[20], out[20]);
    MUX_8X1 mux22(sel, and_[21], xor_[21], nand_[21], or_[21], not_[21], nor_[21], t_comp[21], xnor_[21], out[21]);
    MUX_8X1 mux23(sel, and_[22], xor_[22], nand_[22], or_[22], not_[22], nor_[22], t_comp[22], xnor_[22], out[22]);
    MUX_8X1 mux24(sel, and_[23], xor_[23], nand_[23], or_[23], not_[23], nor_[23], t_comp[23], xnor_[23], out[23]);
    MUX_8X1 mux25(sel, and_[24], xor_[24], nand_[24], or_[24], not_[24], nor_[24], t_comp[24], xnor_[24], out[24]);
    MUX_8X1 mux26(sel, and_[25], xor_[25], nand_[25], or_[25], not_[25], nor_[25], t_comp[25], xnor_[25], out[25]);
    MUX_8X1 mux27(sel, and_[26], xor_[26], nand_[26], or_[26], not_[26], nor_[26], t_comp[26], xnor_[26], out[26]);
    MUX_8X1 mux28(sel, and_[27], xor_[27], nand_[27], or_[27], not_[27], nor_[27], t_comp[27], xnor_[27], out[27]);
    MUX_8X1 mux29(sel, and_[28], xor_[28], nand_[28], or_[28], not_[28], nor_[28], t_comp[28], xnor_[28], out[28]);
    MUX_8X1 mux30(sel, and_[29], xor_[29], nand_[29], or_[29], not_[29], nor_[29], t_comp[29], xnor_[29], out[29]);
    MUX_8X1 mux31(sel, and_[30], xor_[30], nand_[30], or_[30], not_[30], nor_[30], t_comp[30], xnor_[30], out[30]);
    MUX_8X1 mux32(sel, and_[31], xor_[31], nand_[31], or_[31], not_[31], nor_[31], t_comp[31], xnor_[31], out[31]);
    MUX_8X1 mux33(sel, and_[32], xor_[32], nand_[32], or_[32], not_[32], nor_[32], t_comp[32], xnor_[32], out[32]);
    MUX_8X1 mux34(sel, and_[33], xor_[33], nand_[33], or_[33], not_[33], nor_[33], t_comp[33], xnor_[33], out[33]);
    MUX_8X1 mux35(sel, and_[34], xor_[34], nand_[34], or_[34], not_[34], nor_[34], t_comp[34], xnor_[34], out[34]);
    MUX_8X1 mux36(sel, and_[35], xor_[35], nand_[35], or_[35], not_[35], nor_[35], t_comp[35], xnor_[35], out[35]);
    MUX_8X1 mux37(sel, and_[36], xor_[36], nand_[36], or_[36], not_[36], nor_[36], t_comp[36], xnor_[36], out[36]);
    MUX_8X1 mux38(sel, and_[37], xor_[37], nand_[37], or_[37], not_[37], nor_[37], t_comp[37], xnor_[37], out[37]);
    MUX_8X1 mux39(sel, and_[38], xor_[38], nand_[38], or_[38], not_[38], nor_[38], t_comp[38], xnor_[38], out[38]);
    MUX_8X1 mux40(sel, and_[39], xor_[39], nand_[39], or_[39], not_[39], nor_[39], t_comp[39], xnor_[39], out[39]);
    MUX_8X1 mux41(sel, and_[40], xor_[40], nand_[40], or_[40], not_[40], nor_[40], t_comp[40], xnor_[40], out[40]);
    MUX_8X1 mux42(sel, and_[41], xor_[41], nand_[41], or_[41], not_[41], nor_[41], t_comp[41], xnor_[41], out[41]);
    MUX_8X1 mux43(sel, and_[42], xor_[42], nand_[42], or_[42], not_[42], nor_[42], t_comp[42], xnor_[42], out[42]);
    MUX_8X1 mux44(sel, and_[43], xor_[43], nand_[43], or_[43], not_[43], nor_[43], t_comp[43], xnor_[43], out[43]);
    MUX_8X1 mux45(sel, and_[44], xor_[44], nand_[44], or_[44], not_[44], nor_[44], t_comp[44], xnor_[44], out[44]);
    MUX_8X1 mux46(sel, and_[45], xor_[45], nand_[45], or_[45], not_[45], nor_[45], t_comp[45], xnor_[45], out[45]);
    MUX_8X1 mux47(sel, and_[46], xor_[46], nand_[46], or_[46], not_[46], nor_[46], t_comp[46], xnor_[46], out[46]);
    MUX_8X1 mux48(sel, and_[47], xor_[47], nand_[47], or_[47], not_[47], nor_[47], t_comp[47], xnor_[47], out[47]);
    MUX_8X1 mux49(sel, and_[48], xor_[48], nand_[48], or_[48], not_[48], nor_[48], t_comp[48], xnor_[48], out[48]);
    MUX_8X1 mux50(sel, and_[49], xor_[49], nand_[49], or_[49], not_[49], nor_[49], t_comp[49], xnor_[49], out[49]);
    MUX_8X1 mux51(sel, and_[50], xor_[50], nand_[50], or_[50], not_[50], nor_[50], t_comp[50], xnor_[50], out[50]);
    MUX_8X1 mux52(sel, and_[51], xor_[51], nand_[51], or_[51], not_[51], nor_[51], t_comp[51], xnor_[51], out[51]);
    MUX_8X1 mux53(sel, and_[52], xor_[52], nand_[52], or_[52], not_[52], nor_[52], t_comp[52], xnor_[52], out[52]);
    MUX_8X1 mux54(sel, and_[53], xor_[53], nand_[53], or_[53], not_[53], nor_[53], t_comp[53], xnor_[53], out[53]);
    MUX_8X1 mux55(sel, and_[54], xor_[54], nand_[54], or_[54], not_[54], nor_[54], t_comp[54], xnor_[54], out[54]);
    MUX_8X1 mux56(sel, and_[55], xor_[55], nand_[55], or_[55], not_[55], nor_[55], t_comp[55], xnor_[55], out[55]);
    MUX_8X1 mux57(sel, and_[56], xor_[56], nand_[56], or_[56], not_[56], nor_[56], t_comp[56], xnor_[56], out[56]);
    MUX_8X1 mux58(sel, and_[57], xor_[57], nand_[57], or_[57], not_[57], nor_[57], t_comp[57], xnor_[57], out[57]);
    MUX_8X1 mux59(sel, and_[58], xor_[58], nand_[58], or_[58], not_[58], nor_[58], t_comp[58], xnor_[58], out[58]);
    MUX_8X1 mux60(sel, and_[59], xor_[59], nand_[59], or_[59], not_[59], nor_[59], t_comp[59], xnor_[59], out[59]);
    MUX_8X1 mux61(sel, and_[60], xor_[60], nand_[60], or_[60], not_[60], nor_[60], t_comp[60], xnor_[60], out[60]);
    MUX_8X1 mux62(sel, and_[61], xor_[61], nand_[61], or_[61], not_[61], nor_[61], t_comp[61], xnor_[61], out[61]);
    MUX_8X1 mux63(sel, and_[62], xor_[62], nand_[62], or_[62], not_[62], nor_[62], t_comp[62], xnor_[62], out[62]);
    MUX_8X1 mux64(sel, and_[63], xor_[63], nand_[63], or_[63], not_[63], nor_[63], t_comp[63], xnor_[63], out[63]);
    // assign out[62:1] = 0;
    
endmodule
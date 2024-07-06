// MUX 8X1 to select 1st bit in kgp[0]
module MUX_8X1_1_BIT (s, s1, out);
    input[1:0] s;
    input s1;
    output out;

    wire[7:0] c;
    wire tmp, tmp2;
    wire [1:0] neg_s;
    wire neg_s1;
    
    not(neg_s[0], s[0]);
    not(neg_s[1], s[1]);
    not(neg_s1, s1);

    and(c[0], 0, neg_s[0], neg_s[1], neg_s1);
    and(c[1], 0, neg_s[0], neg_s[1], s1);
    and(c[2], 0, neg_s[0], s[1], neg_s1);
    and(c[3], 1, neg_s[0], s[1], s1);
    and(c[4], 0, s[0], neg_s[1], neg_s1);
    and(c[5], 1, s[0], neg_s[1], s1);
    and(c[6], 1, s[0], s[1], neg_s1);
    and(c[7], 1, s[0], s[1], s1);

    or(tmp, c[0], c[1], c[2], c[3]);
    or(tmp2, c[4], c[5], c[6], c[7]);
    or(out, tmp, tmp2);
endmodule

// MUX 8X1 to select 0th bit in kgp[0]
module MUX_8X1_0_BIT (s, s1, out);
    input[1:0] s;
    input s1;
    output out;

    wire[7:0] c;
    wire tmp, tmp2;
    wire [1:0] neg_s;
    wire neg_s1;
    
    not(neg_s[0], s[0]);
    not(neg_s[1], s[1]);
    not(neg_s1, s1);

    and(c[0], 0, neg_s[0], neg_s[1], neg_s1);
    and(c[1], 0, neg_s[0], neg_s[1], s1);
    and(c[2], 0, neg_s[0], s[1], neg_s1);
    and(c[3], 0, neg_s[0], s[1], s1);
    and(c[4], 0, s[0], neg_s[1], neg_s1);
    and(c[5], 0, s[0], neg_s[1], s1);
    and(c[6], 0, s[0], s[1], neg_s1);
    and(c[7], 0, s[0], s[1], s1);

    or(tmp, c[0], c[1], c[2], c[3]);
    or(tmp2, c[4], c[5], c[6], c[7]);
    or(out, tmp, tmp2);
endmodule

// MUX 4X1 to select 0th bit in kgp[1:63]
module MUX_4X1_0_BIT (s, out);
    input[1:0] s;
    output out;

    wire[3:0] c;
    wire[1:0] neg_s;

    not(neg_s[1], s[1]);
    not(neg_s[0], s[0]);

    and(c[0], 0, neg_s[0], neg_s[1]);
    and(c[1], 1, neg_s[1], s[0]);
    and(c[2], 1, s[1], neg_s[0]);
    and(c[3], 0, s[1], s[0]);

    or(out, c[0], c[1], c[2], c[3]);
endmodule


// MUX 4X1 to select 1st bit in kgp[1:63]
module MUX_4X1_1_BIT (s, out);
    input[1:0] s;
    output out;

    wire[3:0] c;
    wire[1:0] neg_s;

    not(neg_s[1], s[1]);
    not(neg_s[0], s[0]);

    and(c[0], 0, neg_s[0], neg_s[1]);
    and(c[1], 0, neg_s[1], s[0]);
    and(c[2], 0, s[1], neg_s[0]);
    and(c[3], 1, s[1], s[0]);

    or(out, c[0], c[1], c[2], c[3]);
endmodule

module MUX_4X1_KGP (bit2, kgp);
    input[1:0] bit2;
    output[1:0] kgp;

    MUX_4X1_0_BIT mux00(bit2, kgp[0]);
    MUX_4X1_1_BIT mux01(bit2, kgp[1]);
endmodule
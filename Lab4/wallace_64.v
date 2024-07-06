`include "rdca.v"

// Module for carry save adder
module FA1 (input [127:0] x,input [127:0] y,input [127:0] z,output [127:0] u,output [127:0] v);
    assign u = x^y^z;
    // u[0] = x[0]^y[0]^z[0];
    assign v[0] = 0;
    assign v[127:1] = (x&y) | (y&z) | (z&x);
endmodule


// Wallace main module
module WALLACE (a, b, pro, carry);
    input[63:0] a, b;
    output[127:0] pro;
    output carry;

    wire c;

    reg[127:0] pp[0:63];

    integer i;
    always @(*) begin
        for (i = 0; i<64; i++) begin
            if(b[i]==1) begin
                pp[i] <= a << i;
            end
            else begin
                pp[i] = 128'h0000000000000000;
                // pp[i] = 128'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
            end
        end
    end

    // Level 1
    wire[127:0] u11, v11, u12, v12, u13, v13, u14, v14, u15, v15, u16, v16, u17, v17, u18, v18, u19, v19, u110, v110, u111, v111, u112, v112, u113, v113, u114, v114, u115, v115, u116, v116, u117, v117, u118, v118, u119, v119, u120, v120, u121, v121;

    FA1 fa11(pp[0], pp[1], pp[2], u11, v11);
    FA1 fa12(pp[3], pp[4], pp[5], u12, v12);
    FA1 fa13(pp[6], pp[7], pp[8], u13, v13);
    FA1 fa14(pp[9], pp[10], pp[11], u14, v14);
    FA1 fa15(pp[12], pp[13], pp[14], u15, v15);
    FA1 fa16(pp[15], pp[16], pp[17], u16, v16);
    FA1 fa17(pp[18], pp[19], pp[20], u17, v17);
    FA1 fa18(pp[21], pp[22], pp[23], u18, v18);
    FA1 fa19(pp[24], pp[25], pp[26], u19, v19);
    FA1 fa110(pp[27], pp[28], pp[29], u110, v110);
    FA1 fa111(pp[30], pp[31], pp[32], u111, v111);
    FA1 fa112(pp[33], pp[34], pp[35], u112, v112);
    FA1 fa113(pp[36], pp[37], pp[38], u113, v113);
    FA1 fa114(pp[39], pp[40], pp[41], u114, v114);
    FA1 fa115(pp[42], pp[43], pp[44], u115, v115);
    FA1 fa116(pp[45], pp[46], pp[47], u116, v116);
    FA1 fa117(pp[48], pp[49], pp[50], u117, v117);
    FA1 fa118(pp[51], pp[52], pp[53], u118, v118);
    FA1 fa119(pp[54], pp[55], pp[56], u119, v119);
    FA1 fa120(pp[57], pp[58], pp[59], u120, v120);
    FA1 fa121(pp[60], pp[61], pp[62], u121, v121);

    // Level 2
    wire[127:0] u21, v21, u22, v22, u23, v23, u24, v24, u25, v25, u26, v26, u27, v27, u28, v28, u29, v29, u210, v210, u211, v211, u212, v212, u213, v213, u214, v214;

    FA1 fa21(u11, v11, u12, u21, v21);
    FA1 fa22(v12, u13, v13, u22, v22);
    FA1 fa23(u14, v14, u15, u23, v23);
    FA1 fa24(v15, u16, v16, u24, v24);
    FA1 fa25(u17, v17, u18, u25, v25);
    FA1 fa26(v18, u19, v19, u26, v26);
    FA1 fa27(u110, v110, u111, u27, v27);
    FA1 fa28(v111, u112, v112, u28, v28);
    FA1 fa29(u113, v113, u114, u29, v29);
    FA1 fa210(v114, u115, v115, u210, v210);
    FA1 fa211(u116, v116, u117, u211, v211);
    FA1 fa212(v117, u118, v118, u212, v212);
    FA1 fa213(u119, v119, u120, u213, v213);
    FA1 fa214(v120, u121, v121, u214, v214);

    // Level 3
    wire[127:0] u31, v31, u32, v32, u33, v33, u34, v34, u35, v35, u36, v36, u37, v37, u38, v38, u39, v39;
    
    FA1 fa31(u21, v21, u22, u31, v31);
    FA1 fa32(v22, u23, v23, u32, v32);
    FA1 fa33(u24, v24, u25, u33, v33);
    FA1 fa34(v25, u26, v26, u34, v34);
    FA1 fa35(u27, v27, u28, u35, v35);
    FA1 fa36(v28, u29, v29, u36, v36);
    FA1 fa37(u210, v210, u211, u37, v37);
    FA1 fa38(v211, u212, v212, u38, v38);
    FA1 fa39(u213, v213, u214, u39, v39);

    // Level 4
    wire[127:0] u41, v41, u42, v42, u43, v43, u44, v44, u45, v45, u46, v46;

    FA1 fa41(u31, v31, u32, u41, v41);
    FA1 fa42(v32, u33, v33, u42, v42);
    FA1 fa43(u34, v34, u35, u43, v43);
    FA1 fa44(v35, u36, v36, u44, v44);
    FA1 fa45(u37, v37, u38, u45, v45);
    FA1 fa46(v38, u39, v39, u46, v46);

    // Level 5
    wire[127:0] u51, v51, u52, v52, u53, v53, u54, v54;

    FA1 fa51(u41, v41, u42, u51, v51);
    FA1 fa52(v42, u43, v43, u52, v52);
    FA1 fa53(u44, v44, u45, u53, v53);
    FA1 fa54(v45, u46, v46, u54, v54);

    // Level 6
    wire[127:0] u61, v61, u62, v62, u63, v63;

    FA1 fa61(u51, v51, u52, u61, v61);
    FA1 fa62(v52, u53, v53, u62, v62);
    FA1 fa63(u54, v54, v214, u63, v63);

    // Level 7
    wire[127:0] u71, v71, u72, v72;

    FA1 fa71(u61, v61, u62, u71, v71);
    FA1 fa72(v62, u63, v63, u72, v72);

    // Level 8
    wire[127:0] u81, v81;

    FA1 fa81(u71, v71, u72, u81, v81);

    // Level 9
    wire[127:0] u91, v91;

    FA1 fa91(u81, v81, v72, u91, v91);

    // Level 10
    wire[127:0] u101, v101;

    FA1 fa101(u91, v91, pp[63], u101, v101);

    // RDCA twice each time 64 bits i.e.,u101[63:0], v[63:0], 1'b0, out, c
    //                                   u101[127:64], v[127:64], c, out1, c1
    RCDA rcda1(u101[63:0], v101[63:0], 1'b0, pro[63:0], c);
    RCDA rcda2(u101[127:64], v101[127:64], c, pro[127:64], carry);
    // assign pro = u62;
    
endmodule



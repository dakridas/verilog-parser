
module counter_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  adhalf_1 U1_1_6 ( .a(A[6]), .b(carry[6]), .co(carry[7]), .s(SUM[6]) );
  adhalf_1 U1_1_1 ( .a(A[1]), .b(A[0]), .co(carry[2]), .s(SUM[1]) );
  adhalf_1 U1_1_2 ( .a(A[2]), .b(carry[2]), .co(carry[3]), .s(SUM[2]) );
  adhalf_1 U1_1_3 ( .a(A[3]), .b(carry[3]), .co(carry[4]), .s(SUM[3]) );
  adhalf_1 U1_1_4 ( .a(A[4]), .b(carry[4]), .co(carry[5]), .s(SUM[4]) );
  adhalf_1 U1_1_5 ( .a(A[5]), .b(carry[5]), .co(carry[6]), .s(SUM[5]) );
  inv_2 U1 ( .a(A[0]), .x(SUM[0]) );
  exor2_1 U2 ( .a(carry[7]), .b(A[7]), .x(SUM[7]) );
endmodule

module counter_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  adhalf_1 U1_1_6 ( .a(A[6]), .b(carry[6]), .co(carry[7]), .s(SUM[6]) );
  adhalf_1 U1_1_1 ( .a(A[1]), .b(A[0]), .co(carry[2]), .s(SUM[1]) );
  adhalf_1 U1_1_2 ( .a(A[2]), .b(carry[2]), .co(carry[3]), .s(SUM[2]) );
  adhalf_1 U1_1_3 ( .a(A[3]), .b(carry[3]), .co(carry[4]), .s(SUM[3]) );
  adhalf_1 U1_1_4 ( .a(A[4]), .b(carry[4]), .co(carry[5]), .s(SUM[4]) );
  adhalf_1 U1_1_5 ( .a(A[5]), .b(carry[5]), .co(carry[6]), .s(SUM[5]) );
  inv_2 U1 ( .a(A[0]), .x(SUM[0]) );
  exor2_1 U2 ( .a(carry[7]), .b(A[7]), .x(SUM[7]) );
endmodule

module counter_DW01_inc_2 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  adhalf_1 U1_1_6 ( .a(A[6]), .b(carry[6]), .co(carry[7]), .s(SUM[6]) );
  adhalf_1 U1_1_1 ( .a(A[1]), .b(A[0]), .co(carry[2]), .s(SUM[1]) );
  adhalf_1 U1_1_2 ( .a(A[2]), .b(carry[2]), .co(carry[3]), .s(SUM[2]) );
  adhalf_1 U1_1_3 ( .a(A[3]), .b(carry[3]), .co(carry[4]), .s(SUM[3]) );
  adhalf_1 U1_1_4 ( .a(A[4]), .b(carry[4]), .co(carry[5]), .s(SUM[4]) );
  adhalf_1 U1_1_5 ( .a(A[5]), .b(carry[5]), .co(carry[6]), .s(SUM[5]) );
  inv_2 U1 ( .a(A[0]), .x(SUM[0]) );
  exor2_1 U2 ( .a(carry[7]), .b(A[7]), .x(SUM[7]) );
endmodule

module counter_DW01_inc_3 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  adhalf_1 U1_1_6 ( .a(A[6]), .b(carry[6]), .co(carry[7]), .s(SUM[6]) );
  adhalf_1 U1_1_1 ( .a(A[1]), .b(A[0]), .co(carry[2]), .s(SUM[1]) );
  adhalf_1 U1_1_2 ( .a(A[2]), .b(carry[2]), .co(carry[3]), .s(SUM[2]) );
  adhalf_1 U1_1_3 ( .a(A[3]), .b(carry[3]), .co(carry[4]), .s(SUM[3]) );
  adhalf_1 U1_1_4 ( .a(A[4]), .b(carry[4]), .co(carry[5]), .s(SUM[4]) );
  adhalf_1 U1_1_5 ( .a(A[5]), .b(carry[5]), .co(carry[6]), .s(SUM[5]) );
  inv_2 U1 ( .a(A[0]), .x(SUM[0]) );
  exor2_1 U2 ( .a(carry[7]), .b(A[7]), .x(SUM[7]) );
endmodule 

module counter ( clk, reset, count );
  output [7:0] count;   
  input clk, reset;
  wire   N1, N2, N3, N4, N5, N6, N7, N8, n18;
   wire [7:0] Ncount;
   wire NN1, NN2, NN3, NN4, NN5, NN6, NN7, NN8;
   
  counter_DW01_inc_0 add_13 ( .A(count), .SUM({N8, N7, N6, N5, N4, N3, N2, N1}) );
  counter_DW01_inc_3 add_14 ( .A(Ncount), .SUM({NN8, NN7, NN6, NN5, NN4, NN3, NN2, NN1}) );
  dffpr_2 \count_reg[7]  ( .d(N8), .ck(clk), .rb(n18), .q(count[7]) );
  dffpr_2 \count_reg[4]  ( .d(N5), .ck(clk), .rb(n18), .q(count[4]) );
  dffpr_2 \count_reg[5]  ( .d(N6), .ck(clk), .rb(n18), .q(count[5]) );
  dffpr_2 \count_reg[6]  ( .d(N7), .ck(clk), .rb(n18), .q(count[6]) );
  dffpr_2 \count_reg[2]  ( .d(N3), .ck(clk), .rb(n18), .q(count[2]) );
  dffpr_2 \count_reg[3]  ( .d(N4), .ck(clk), .rb(n18), .q(count[3]) );
  dffpr_2 \count_reg[1]  ( .d(N2), .ck(clk), .rb(n18), .q(count[1]) );
  dffpr_2 \count_reg[0]  ( .d(N1), .ck(clk), .rb(n18), .q(count[0]) );
  inv_2 U4 ( .a(reset), .x(n18) );
endmodule

module counter2 ( clk, reset, count );
  output [7:0] count;
  input clk, reset;
  wire   N1, N2, N3, N4, N5, N6, N7, N8, n18, n19, n20;

  counter_DW01_inc_1 add_13 ( .A(count), .SUM({N8, N7, N6, N5, N4, N3, N2, N1}) );
  dffpr_2 \count_reg[7]  ( .d(N8), .ck(clk), .rb(n20), .q(count[7]) );
  dffpr_2 \count_reg[4]  ( .d(N5), .ck(clk), .rb(n20), .q(count[4]) );
  dffpr_2 \count_reg[5]  ( .d(N6), .ck(clk), .rb(n20), .q(count[5]) );
  dffpr_2 \count_reg[6]  ( .d(N7), .ck(clk), .rb(n20), .q(count[6]) );
  dffpr_2 \count_reg[2]  ( .d(N3), .ck(clk), .rb(n20), .q(count[2]) );
  dffpr_2 \count_reg[3]  ( .d(N4), .ck(clk), .rb(n20), .q(count[3]) );
  dffpr_2 \count_reg[1]  ( .d(N2), .ck(clk), .rb(n20), .q(count[1]) );
  dffpr_2 \count_reg[0]  ( .d(N1), .ck(clk), .rb(n20), .q(count[0]) );
   inv_2 U4 ( .a(reset), .x(n18) );
   inv_2 U5 ( .a(n18), .x(n19) );
   inv_2 U6 ( .a(n19), .x(n20) );
endmodule

module counter3 ( clk, reset, count );
  output [7:0] count;
  input clk, reset;
  wire   N1, N2, N3, N4, N5, N6, N7, N8, n18, n19, n20, n21, n22;

  counter_DW01_inc_2 add_13 ( .A(count), .SUM({N8, N7, N6, N5, N4, N3, N2, N1}) );
  dffpr_2 \count_reg[7]  ( .d(N8), .ck(clk), .rb(n22), .q(count[7]) );
  dffpr_2 \count_reg[4]  ( .d(N5), .ck(clk), .rb(n22), .q(count[4]) );
  dffpr_2 \count_reg[5]  ( .d(N6), .ck(clk), .rb(n22), .q(count[5]) );
  dffpr_2 \count_reg[6]  ( .d(N7), .ck(clk), .rb(n22), .q(count[6]) );
  dffpr_2 \count_reg[2]  ( .d(N3), .ck(clk), .rb(n22), .q(count[2]) );
  dffpr_2 \count_reg[3]  ( .d(N4), .ck(clk), .rb(n22), .q(count[3]) );
  dffpr_2 \count_reg[1]  ( .d(N2), .ck(clk), .rb(n22), .q(count[1]) );
  dffpr_2 \count_reg[0]  ( .d(N1), .ck(clk), .rb(n22), .q(count[0]) );
   inv_2 U4 ( .a(reset), .x(n18) );
   inv_2 U5 ( .a(n18), .x(n19) );
   inv_2 U6 ( .a(n19), .x(n20) );
   inv_2 U7 ( .a(n20), .x(n21) );
   inv_2 U8 ( .a(n21), .x(n22) );
   
endmodule

module ALU (clk, reset, alucount, alucount2, alucount3);
   output [7:0] alucount;
   output [7:0] alucount2;
   output [7:0] alucount3;
   input 	clk, reset;
   wire 	nreset, bufreset;

   counter3 mycounter3 (.clk(clk), .reset(bufreset), .count(alucount3));
   counter2 mycounter2 (.clk(clk), .reset(bufreset), .count(alucount2));
   counter mycounter (.clk(clk), .reset(bufreset), .count(alucount));
   inv_2 alu_u1 (.a(reset),.x(nreset));
   inv_2 alu_u2 (.a(nreset),.x(bufreset));
   
endmodule
module abc (id3, id4);
input signed [2:WORD] id3;
output  signed id4;

id3 = id4 + 5;
id3 = id4;
id3 = 5;
id4 = 5 + 5;
id4 = id4 + id4;
id3 = idg[word + 4] + 8 + tdf[aef + 2];
id3 = idg[word : 7] + 8 + tdf[aef + 2];

endmodule

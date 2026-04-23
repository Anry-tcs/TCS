module fir_filter (
    input clk, rst,
    input signed [15:0] in,
    output signed [15:0] out
);

    reg signed [15:0] r [32:0];
    wire signed [15:0] coeff [32:0];
    assign coeff[0] = -452;
    assign coeff[1] = 1;
    assign coeff[2] = 1133;
    assign coeff[3] = 0;
    assign coeff[4] = 1634;
    assign coeff[5] = 0;
    assign coeff[6] = 1526;
    assign coeff[7] = 0;
    assign coeff[8] = 25;
    assign coeff[9] = 0;
    assign coeff[10] = -2958;
    assign coeff[11] = 0;
    assign coeff[12] = -6664;
    assign coeff[13] = 0;
    assign coeff[14] = -9750;
    assign coeff[15] = 1;
    assign coeff[16] = 32767;
    assign coeff[17] = 1;
    assign coeff[18] = -9750;
    assign coeff[19] = 0;
    assign coeff[20] = -6664;
    assign coeff[21] = 0;
    assign coeff[22] = -2958;
    assign coeff[23] = 0;
    assign coeff[24] = 25;
    assign coeff[25] = 0;
    assign coeff[26] = 1526;
    assign coeff[27] = 0;
    assign coeff[28] = 1634;
    assign coeff[29] = 0;
    assign coeff[30] = 1133;
    assign coeff[31] = 1;
    assign coeff[32] = -452;

    always @(posedge clk) begin
        if (rst) begin
            for (integer j=0; j<33; j=j+1) r[j] <= 0;
        end else begin
            r[0] <= in;
            r[1] <= r[0];
            r[2] <= r[1];
            r[3] <= r[2];
            r[4] <= r[3];
            r[5] <= r[4];
            r[6] <= r[5];
            r[7] <= r[6];
            r[8] <= r[7];
            r[9] <= r[8];
            r[10] <= r[9];
            r[11] <= r[10];
            r[12] <= r[11];
            r[13] <= r[12];
            r[14] <= r[13];
            r[15] <= r[14];
            r[16] <= r[15];
            r[17] <= r[16];
            r[18] <= r[17];
            r[19] <= r[18];
            r[20] <= r[19];
            r[21] <= r[20];
            r[22] <= r[21];
            r[23] <= r[22];
            r[24] <= r[23];
            r[25] <= r[24];
            r[26] <= r[25];
            r[27] <= r[26];
            r[28] <= r[27];
            r[29] <= r[28];
            r[30] <= r[29];
            r[31] <= r[30];
            r[32] <= r[31];
        end
    end

    wire signed [31:0] mult [32:0];
    assign mult[0] = r[0] * coeff[0];
    assign mult[1] = r[1] * coeff[1];
    assign mult[2] = r[2] * coeff[2];
    assign mult[3] = r[3] * coeff[3];
    assign mult[4] = r[4] * coeff[4];
    assign mult[5] = r[5] * coeff[5];
    assign mult[6] = r[6] * coeff[6];
    assign mult[7] = r[7] * coeff[7];
    assign mult[8] = r[8] * coeff[8];
    assign mult[9] = r[9] * coeff[9];
    assign mult[10] = r[10] * coeff[10];
    assign mult[11] = r[11] * coeff[11];
    assign mult[12] = r[12] * coeff[12];
    assign mult[13] = r[13] * coeff[13];
    assign mult[14] = r[14] * coeff[14];
    assign mult[15] = r[15] * coeff[15];
    assign mult[16] = r[16] * coeff[16];
    assign mult[17] = r[17] * coeff[17];
    assign mult[18] = r[18] * coeff[18];
    assign mult[19] = r[19] * coeff[19];
    assign mult[20] = r[20] * coeff[20];
    assign mult[21] = r[21] * coeff[21];
    assign mult[22] = r[22] * coeff[22];
    assign mult[23] = r[23] * coeff[23];
    assign mult[24] = r[24] * coeff[24];
    assign mult[25] = r[25] * coeff[25];
    assign mult[26] = r[26] * coeff[26];
    assign mult[27] = r[27] * coeff[27];
    assign mult[28] = r[28] * coeff[28];
    assign mult[29] = r[29] * coeff[29];
    assign mult[30] = r[30] * coeff[30];
    assign mult[31] = r[31] * coeff[31];
    assign mult[32] = r[32] * coeff[32];

    // Layer 0: 33 inputs -> 17 outputs
    wire signed [32:0] L0 [16:0];
    assign L0[0] = mult[0] + mult[1];
    assign L0[1] = mult[2] + mult[3];
    assign L0[2] = mult[4] + mult[5];
    assign L0[3] = mult[6] + mult[7];
    assign L0[4] = mult[8] + mult[9];
    assign L0[5] = mult[10] + mult[11];
    assign L0[6] = mult[12] + mult[13];
    assign L0[7] = mult[14] + mult[15];
    assign L0[8] = mult[16] + mult[17];
    assign L0[9] = mult[18] + mult[19];
    assign L0[10] = mult[20] + mult[21];
    assign L0[11] = mult[22] + mult[23];
    assign L0[12] = mult[24] + mult[25];
    assign L0[13] = mult[26] + mult[27];
    assign L0[14] = mult[28] + mult[29];
    assign L0[15] = mult[30] + mult[31];
    assign L0[16] = mult[32];

    // Layer 1: 17 inputs -> 9 outputs
    wire signed [33:0] L1 [8:0];
    assign L1[0] = L0[0] + L0[1];
    assign L1[1] = L0[2] + L0[3];
    assign L1[2] = L0[4] + L0[5];
    assign L1[3] = L0[6] + L0[7];
    assign L1[4] = L0[8] + L0[9];
    assign L1[5] = L0[10] + L0[11];
    assign L1[6] = L0[12] + L0[13];
    assign L1[7] = L0[14] + L0[15];
    assign L1[8] = L0[16];

    // Layer 2: 9 inputs -> 5 outputs
    wire signed [34:0] L2 [4:0];
    assign L2[0] = L1[0] + L1[1];
    assign L2[1] = L1[2] + L1[3];
    assign L2[2] = L1[4] + L1[5];
    assign L2[3] = L1[6] + L1[7];
    assign L2[4] = L1[8];

    // Layer 3: 5 inputs -> 3 outputs
    wire signed [35:0] L3 [2:0];
    assign L3[0] = L2[0] + L2[1];
    assign L3[1] = L2[2] + L2[3];
    assign L3[2] = L2[4];

    // Layer 4: 3 inputs -> 2 outputs
    wire signed [36:0] L4 [1:0];
    assign L4[0] = L3[0] + L3[1];
    assign L4[1] = L3[2];

    // Layer 5: 2 inputs -> 1 outputs
    wire signed [37:0] L5 [0:0];
    assign L5[0] = L4[0] + L4[1];

    assign out = L5[0][30:15]; // Нормализация

endmodule
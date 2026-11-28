module imm_gen (
    input logic [31:0] inst,
    output logic [31:0] imm_out
);

localparam logic [31:0] zero = 32'b0;

always_comb begin
    case (inst[6:0])
        7'b0000011, 7'b0010011, 7'b1100111: imm_out = {{21{inst[31]}}, inst[30:20]}; // I-immediate
        7'b0100011: imm_out = {{21{inst[31]}}, inst[30:25], inst[11:7]}; // S-immediate
        7'b1100011: imm_out = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0}; // B-immediate
        7'b0010111, 7'b0110111: imm_out = {inst[31], inst[30:12], 12'b0}; // U-immediate
        7'b1101111: imm_out = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0}; // J-immediate
        default: imm_out = 32'b0;
    endcase
end

endmodule

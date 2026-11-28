module alu (
    input logic [31:0] input_1,
    input logic [31:0] input_2,
    input logic [3:0] alu_op,
    output logic [31:0] rd,
    output logic zero
);
    
    localparam logic [3:0] ALU_ADD = 4'b0000;
    localparam logic [3:0] ALU_SUB = 4'b0001;
    localparam logic [3:0] ALU_SLL  = 4'b0010; // Shift Left Logical
    localparam logic [3:0] ALU_SLT  = 4'b0011; // Set Less Than (signed)
    localparam logic [3:0] ALU_SLTU = 4'b0100; // Set Less Than (unsigned)
    localparam logic [3:0] ALU_XOR  = 4'b0101;
    localparam logic [3:0] ALU_SRL  = 4'b0110; // Shift Right Logical
    localparam logic [3:0] ALU_SRA  = 4'b0111; // Shift Right Arithmetic
    localparam logic [3:0] ALU_OR   = 4'b1000;
    localparam logic [3:0] ALU_AND  = 4'b1001;

    always_comb begin
        case (alu_op)
            ALU_ADD: rd = input_1 + input_2;
            ALU_SUB:  rd = input_1 - input_2;
            ALU_SLL:  rd = input_1 << input_2[4:0];
            ALU_SLT:  rd = {31'd0, $signed(input_1) < $signed(input_2)};
            ALU_SLTU: rd = {31'd0, input_1 < input_2};
            ALU_XOR:  rd = input_1 ^ input_2;
            ALU_SRL:  rd = input_1 >> input_2[4:0];
            ALU_SRA:  rd = $unsigned($signed(input_1) >>> input_2[4:0]);
            ALU_OR:   rd = input_1 | input_2;
            ALU_AND:  rd = input_1 & input_2;
            default:  rd = 32'd0;
        endcase
    end

    assign zero = (rd == 32'd0);

endmodule

module regfile (
    input logic clk,
    input logic [4:0] rs1_addr,
    input logic [4:0] rs2_addr,
    output logic [31:0] rs1_data,
    output logic [31:0] rs2_data,
    input logic [4:0] rd_addr,
    input logic [31:0] rd_data,
    input logic we
);
    
    logic [31:0] registers[31:0];

    always_ff @(posedge clk) begin
        if (we && (rd_addr != 5'd0)) begin
            registers[rd_addr] <= rd_data;
        end
    end

    always_comb begin
        if (rs1_addr == 5'd0) begin
            rs1_data = 32'd0;
        end else begin
            rs1_data = registers[rs1_addr];
        end

        if (rs2_addr == 5'd0) begin
            rs2_data = 32'd0;
        end else begin
            rs2_data = registers[rs2_addr];
        end
    end

endmodule

module alu (
    input logic A[31:0],
    input logic B[31:0],
    input logic Status_In[2:0],
    input logic Opcode[3:0],
    output logic Status_Out[2:0],
    output logic Integer_Result[31:0]
);
    
endmodule
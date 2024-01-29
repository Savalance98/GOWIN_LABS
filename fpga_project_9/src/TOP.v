module dff_async_rst_n_param
#(
    parameter WIDTH = 8,
              RESET = 8'b0
)
(
    input                      clk,
    input                      rst_n,
    input      [WIDTH - 1 : 0] d,
    output reg [WIDTH - 1 : 0] q
);

    always @ (posedge clk or negedge rst_n)
        if (!rst_n)
            q <= RESET;
        else
            q <= d;
 
endmodule


module TOP
(
    
    input  [ 4:0] btn,     // Замените на соответствующие входные сигналы кнопок на вашей плате
    output [ 4:0] LED     // Замените на соответствующие выходные сигналы светодиодов на вашей плате
);

    assign LED[1:0] = 2'b0;

    dff_async_rst_n_param 
    #(
        .WIDTH ( 3     ), 
        .RESET ( 3'hf0 )
    ) 
    dff_async_rst_n_param
    (
        .clk   ( ~btn[0]   ),
        .rst_n (  btn[1]   ),
        .d     (  ~btn[4:2] ),
        .q     (  LED[4:2] )
    );
endmodule

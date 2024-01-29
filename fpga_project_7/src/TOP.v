module dff_async_rst_n
(
    input       clk,
    input       rst_n,
    input       d,
    output reg  q
);

    always @ (posedge clk or negedge rst_n)
        if (!rst_n)
            q <= 0;
        else
            q <= d;
 
endmodule


module TOP
(
    
    input  [ 2:0] btn,     // Замените на соответствующие входные сигналы кнопок на вашей плате
    output [ 4:0] LED     // Замените на соответствующие выходные сигналы светодиодов на вашей плате
);

    assign LED[4:1] = 4'b0;

    dff_async_rst_n dff_async_rst_n
    (
        .clk   ( ~btn[0] ),
        .rst_n   ( btn[2] ),
        .d   (  ~btn[1] ),
        .q   (  LED[0] )
    );
endmodule

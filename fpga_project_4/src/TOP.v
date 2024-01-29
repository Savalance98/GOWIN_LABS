module d_latch
(
    input       clk,
    input       d,
    output reg  q
);

    always @ (clk or d)
        if(clk)
            q <= d;

endmodule


module TOP
(
    
    input  [ 1:0] btn,     // Замените на соответствующие входные сигналы кнопок на вашей плате
    output [ 4:0] LED     // Замените на соответствующие выходные сигналы светодиодов на вашей плате
);

    assign LED[4:1] = 4'b0;

    d_latch d_latch
    (
        .clk   ( ~btn[0] ),
        .d   ( ~btn[1] ),
        .q   (  LED[0] )
    );
endmodule

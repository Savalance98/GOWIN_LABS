module sr_latch
(
    input   s,
    input   r,
    output  q,
    output  q_n
);
    assign q   = ~ ( r | q_n );
    assign q_n = ~ ( s | q   );

endmodule


module TOP
(
    input  [ 1:0] btn,     // Замените на соответствующие входные сигналы кнопок на вашей плате
    output [ 4:0] LED     // Замените на соответствующие выходные сигналы светодиодов на вашей плате
);

    assign LED[4:2] = 3'b0;

    sr_latch sr_latch
    (
        .s   ( ~btn[0] ),
        .r   ( ~btn[1] ),
        .q   (  LED[0] ),
        .q_n (  LED[1] )
    );
endmodule

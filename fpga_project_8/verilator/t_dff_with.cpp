#include "Vdff_with_en.h"
#include "verilated.h"

using namespace std;

int main(int argc, char **argv)
{
    Verilated::commandArgs(argc, argv);

    Vdff_with_en *top = new Vdff_with_en;

    int clk = 0;
    int en = 0;
    top->en = en;
    int d = 0;
    top->d = d;

    for (int i = 0; i < 10; i++)
    {
        clk = ~clk;
        en = ~en;
        d = d + 1;
        top->eval();
        top->clk = clk;
        top->en = en;
        top->d = d;

        // cout << "q = " << top -> q << "q_n = " << top -> q_n;
        printf("q = %d \n", top->q);
    }

    // Clean up
    delete top;
    exit(0);
}
#include "Vd_flip_flop.h"
#include "verilated.h"

using namespace std;

int main(int argc, char** argv) {
  Verilated::commandArgs(argc, argv);

  Vd_flip_flop* top = new Vd_flip_flop;

  int clk = 0;
  int d = 0;
  top -> d = d;

  for (int i = 0; i < 10; i ++) {
    top->eval();
    clk = ~clk;
    top -> clk = clk;
    top -> d = ~(top -> d);

    // cout << "q = " << top -> q << "q_n = " << top -> q_n;
    printf("q = %d, q_n = %d \n", top -> q, top -> q_n);

  }

  // Clean up
  delete top;
  exit(0);
}

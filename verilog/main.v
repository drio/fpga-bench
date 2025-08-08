`default_nettype none `timescale 1 ns / 1ns

module main
# (
  parameter int unsigned BENCHMARKSECONDS = 10
)
(
  `ifdef SIMULATION_RUN
  input logic clk,
  `endif
  input logic [7:0] input_buffer [64] // 64 byte contiguous
);

`ifdef FPGA_ICE40UP5K_RUN
logic clk;
// inst 12 mhz clock on ice40up5k, can be between:- 0b11 = 6 MHz to 0b00 = 48MHz
SB_HFOSC #(.CLKHF_DIV("0b10")) hfosc_inst (
    .CLKHFEN(1'b1),
    .CLKHFPU(1'b1),
    .CLKHF(clk)
);
`endif

initial begin
  if ((BENCHMARKSECONDS > 600) || (BENCHMARKSECONDS < 0)) begin
    $fatal("benchmark seconds should be between 0 and 600");
  end
end


sha256 sha256_inst(
  .clk(clk)
);

endmodule

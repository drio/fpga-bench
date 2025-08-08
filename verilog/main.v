`default_nettype none `timescale 1 ns / 1ns

module main
# (
  parameter int unsigned BENCHMARKSECONDS = 10
)
(
  input logic clk,
  input logic [7:0] input_buffer [64] // 64 byte contiguous
);

initial begin
  if ((BENCHMARKSECONDS > 600) || (BENCHMARKSECONDS < 0)) begin
    $fatal("benchmark seconds should be between 0 and 600");
  end
end


sha256 sha256_inst(
  .clk(clk)
);

endmodule

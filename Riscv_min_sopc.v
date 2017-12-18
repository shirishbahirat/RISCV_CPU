`ifndef _RESICV_MIN_SOPC
`define _RESICV_MIN_SOPC
`include "Defines.vh"
`include "IDInstDef.vh"
`include "cpu.v"
`include "Inst_rom.v"

module Riscv_min_sopc(
	input wire clk,
	input wire rst
);

	wire[`InstAddrBus]	inst_addr;
	wire[`InstBus]		inst;
	wire				rom_ce;

	cpu cpu0(
		.clk(clk),
		.rst(rst),

		.rom_data_i(inst),
		.rom_ce_o(rom_ce),
		.rom_addr_o(inst_addr)
	);

	Inst_rom inst_rom0 (
		.ce(rom_ce),
		.addr(inst_addr),
		.inst(inst)
	);


endmodule

`endif
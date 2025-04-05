return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.operators").setup()
		require("mini.pairs").setup()
		require("mini.git").setup()
		require("mini.cursorword").setup()
	end,
}

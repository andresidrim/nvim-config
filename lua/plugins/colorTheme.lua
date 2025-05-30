return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			variant = "auto",
			dark_variant = "main",
			dim_inactive_windows = false,
			extend_background_behind_borders = true,

			enable = {
				terminal = true,
				legacy_highlights = true,
				migrations = true,
			},

			styles = {
				bold = false,
				italic = false,
				transparency = true,
			},
		})
		vim.cmd("colorscheme rose-pine")
	end,
}

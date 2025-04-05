return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			shell = "powershell",
			direction = "horizontal", -- Options: 'horizontal', 'vertical', 'float'
			open_mapping = [[<C-\>]], -- Ctrl + \ to toggle
			size = 15, -- Size of the terminal in horizontal mode
			persist_size = true,
			shade_terminals = true,
			start_in_insert = true,
		})
	end,
}

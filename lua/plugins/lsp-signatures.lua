return {
	"ray-x/lsp_signature.nvim",
	event = "LspAttach",
	config = function()
		require("lsp_signature").setup({
			bind = true,
			doc_lines = 10, -- você pode trocar pra 10 se quiser mostrar a doc completa
			floating_window = true,
			floating_window_above_cur_line = true,
			hint_enable = true,
			hint_prefix = " ",
			handler_opts = {
				border = "rounded",
			},
			always_trigger = true,
			fix_pos = false,
			toggle_key = "<C-k>", -- opcional: tecla pra ligar/desligar
		})
	end,
}

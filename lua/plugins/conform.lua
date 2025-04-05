return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = { typescript = true, javascript = true, typescriptreact = true }
			local lsp_format_opt = disable_filetypes[vim.bo[bufnr].filetype] and "never" or "fallback"
			return {
				timeout_ms = 1500,
				lsp_format = lsp_format_opt,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			python = { "black", "isort" },
			go = { "gofmt" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			typescript = { "prettierd" },
			javascript = { "prettierd" },
			typescriptreact = { "prettierd" },
		},
		config = function(_, opts)
			local conform = require("conform")

			conform.setup(opts)

			conform.formatters.prettierd = {
				prepend_args = { "--print-width", "80" },
			}
		end,
	},
}

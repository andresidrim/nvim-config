return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		lint.linters.eslint.args = {
			"--format",
			"json",
			"--stdin",
			"--stdin-filename",
			function()
				local path = vim.fn.expand("%:p")
				path = path:gsub("%(", "^(")
				path = path:gsub("%)", "^)")
				return path
			end,
		}

		lint.linters_by_ft = {
			python = { "flake8" }, -- Python diagnostics
			sh = { "shellcheck" }, -- Shell diagnostics
			markdown = { "markdownlint" },
			json = { "jsonlint" },
			javascript = { "eslint" },
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}

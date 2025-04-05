return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		signs_staged = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		current_line_blame = true, -- ✅ Start with inline Git blame enabled
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- Show at end of line
			delay = 500, -- Delay before showing blame (ms)
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			-- Toggle Inline Git Blame
			local function toggle_inline_blame()
				local config = require("gitsigns.config").config
				config.current_line_blame = not config.current_line_blame
				require("gitsigns").refresh()
			end

			-- Compact Floating Window for Git Blame
			local function show_compact_floating_blame()
				local blame_info = gs.blame_line({ full = false }) -- Get blame info
				if not blame_info then
					return
				end -- No blame info available

				-- Extract commit info
				local text = string.format("%s - %s", blame_info.author, blame_info.summary)

				-- Create floating window
				local buf = vim.api.nvim_create_buf(false, true)
				vim.api.nvim_buf_set_lines(buf, 0, -1, false, { text })
				local opts = {
					relative = "cursor",
					width = #text + 2, -- Auto-size width
					height = 1,
					row = 1,
					col = 0,
					style = "minimal",
					border = "rounded",
				}
				local win = vim.api.nvim_open_win(buf, false, opts)

				-- Close window automatically on movement
				vim.api.nvim_create_autocmd("CursorMoved", {
					buffer = bufnr,
					once = true,
					callback = function()
						if vim.api.nvim_win_is_valid(win) then
							vim.api.nvim_win_close(win, true)
						end
					end,
				})
			end

			-- Keybindings
			vim.keymap.set("n", "<leader>gb", toggle_inline_blame, { buffer = bufnr, desc = "Toggle Inline Git Blame" })
			vim.keymap.set(
				"n",
				"<leader>gB",
				show_compact_floating_blame,
				{ buffer = bufnr, desc = "Show Compact Floating Git Blame" }
			)
		end,
	},
}

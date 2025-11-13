return {
	---- ✓ Deep buffer integration for Git
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				-- Actions
				map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset hunk" })

				map("v", "<leader>ghs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage selected hunk" })

				map("v", "<leader>ghr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset selected hunkg" })

				map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "Reset bufffer" })
				map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "Preview hunk" })
				map("n", "<leader>ghi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

				map("n", "<leader>ghb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame line" })

				map("n", "<leader>ghd", gitsigns.diffthis, { desc = "Diff this" })

				map("n", "<leader>ghD", function()
					gitsigns.diffthis("~")
				end, { desc = "Diff this with previous" })

				map("n", "<leader>ghQ", function()
					gitsigns.setqflist("all")
				end, { desc = "Quiklist hunks" })
				map("n", "<leader>ghq", gitsigns.setqflist, { desc = "Quicklist hunks" })

				-- Toggles
				map("n", "<leader>ghtb", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
				map("n", "<leader>ghtw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })
				map("n", "<leader>ghtd", gitsigns.toggle_deleted, { desc = "Toggle deleted" })

				-- Text object
				map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Hunk" })
			end,
		},
	},
}

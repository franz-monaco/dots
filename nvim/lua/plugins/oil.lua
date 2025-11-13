return {
	{
		"stevearc/oil.nvim",
		commit = "3b7c74798e699633d602823aefd9a4e4e36c02a8", -- 🔐
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = { "icon" },
				delete_to_trash = true,
				keymaps = {
					["<C-h>"] = false,
					["<M-h>"] = "actions.select_split",
					["-"] = false,
				},
				view_options = {
					show_hidden = true,
				},
			})

			-- Open parent directory in current window
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

			-- Open parent directory in floating window
			-- vim.keymap.set("n", "<space>-", require("oil").toggle_float)
		end,
	},
}

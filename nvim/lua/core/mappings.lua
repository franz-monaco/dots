--------------------------------------------------------------------
-- My mappings
--------------------------------------------------------------------

local map = vim.keymap.set
local opts = { noremap = true, silent = true, nowait = true }

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.cmd([[
  cmap <C-k> <C-p>
    ]])

vim.cmd([[
  cmap <C-j> <C-n>
    ]])

-- Create box and figlet
map("v", "<F2>", "<cmd>.!boxes -d stone<cr>", opts)
map("v", "<F3>", "<cmd>.!toilet<cr>", opts)

-- Keep the cursor in place while joining lines
map("n", "J", function()
	vim.cmd([[
      normal! mzJ`z
      delmarks z
    ]])
end, opts)

-- Make Y behave like other capitals
map("n", "Y", "y$", opts)

-- Quit visual mode
map("v", "v", "<Esc>", opts)
-- Move to the start of line
map("n", "H", "^", opts)
-- Move to the end of line
map("n", "L", "$", opts)
-- Redo
map("n", "U", "<C-r>", opts)

-- qq to record, Q to replay
--   nnoremap Q @q
map("n", "Q", "@q", opts)

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
-- ----------------------------------------------------------------------------
-- Add Accent
-- ----------------------------------------------------------------------------
map("i", "<M-u>", "<c-k>:", opts)
-- ----------------------------------------------------------------------------
-- More molecular undo of text
-- ----------------------------------------------------------------------------
map("i", ".", ".<c-g>u", opts)
map("i", "!", "!<c-g>u", opts)
map("i", "?", "?<c-g>u", opts)
map("i", ";", ";<c-g>u", opts)
map("i", ":", ":<c-g>u", opts)
-- ----------------------------------------------------------------------------
-- Moving lines
-- ----------------------------------------------------------------------------
-- Using Meta Key in iTerm and MacOS
-- ----------------------------------------------------------------------------
map("n", "<C-M-j>", ":move+<cr>", opts)
map("n", "<C-M-k>", ":move-2<cr>", opts)
map("n", "<C-M-h>", "<<", opts)
map("n", "<C-M-l>", ">>", opts)

map("x", "<C-M-j>", ":move'>+<cr>gv", opts)
map("x", "<C-M-k>", ":move-2<cr>gv", opts)
map("x", "<C-M-h>", "<gv", opts)
map("x", "<C-M-l>", ">gv", opts)

-- Movement in insert mode
map("i", "<C-M-j>", "<C-o>j", opts)
map("i", "<C-M-k>", "<C-o>k", opts)
map("i", "<C-M-h>", "<C-o>h", opts)
map("i", "<C-M-l>", "<C-o>a", opts)
map("i", "<C-M-^>", "<C-o><C-^>", opts)

-- Stop polluting clipboard with deleted characters
map("n", "dd", '"xdd', opts)
map("n", "d", '"xd', opts)
map("v", "d", '"xd', opts)
map("n", "x", '"xx', opts)
map("v", "x", '"xx', opts)
map("n", "c", '"xc', opts)
map("v", "C", '"xC', opts)

-- Replace visual selection with text in register, but not contaminate the register,
-- see also https://stackoverflow.com/q/10723700/6064933.
map("x", "p", '"_c<Esc>p', opts)
map("n", "gp", '"xp', opts)
map("n", "gP", '"xP', opts)

-- Leave cursor
map("v", "y", "ygv<Esc>", opts)
--
-- Move between windows
-- Replaced with TmuxNavigation
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
map("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
map("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
map("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)
map("n", "<C-;>", ":TmuxNavigatePrevious<CR>", opts)

-- Use Jumplist
-- map('n', xk '<C-S-o>', wrap(fn.jumplist_jump_buf, -1), 'Jumplist: Go to last buffer')
-- map('n', xk '<C-S-i>', wrap(fn.jumplist_jump_buf, 1), 'Jumplist: Go to next buffer')
-- New Line without auto comment
-- map('n', 'go', 'o<C-u>', 'Insert on new line without autocomment')
-- map('n', 'gO', 'O<C-u>', 'Insert on new line above without autocomment')

--
-- Move windows
map("n", "<C-M-S-j>", "<C-W>J", opts)
map("n", "<C-M-S-k>", "<C-W>K", opts)
map("n", "<C-M-S-h>", "<C-W>H", opts)
map("n", "<C-M-S-l>", "<C-W>L", opts)
--
-- Remap movement for wrapped lines being the same as for non-wrapped lines
map("n", "k", "gk", opts)
map("n", "gk", "k", opts)
map("n", "j", "gj", opts)
map("n", "gj", "j", opts)
--
-- Set middle of screen for  searches
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)
--
-- Use gt to open definition in new tab
map("n", "gt", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
--
-- Stops using arrow keys in vim
-- map({ "i", "n", "v" }, "<Down>", "<Nop>", opts)
-- map({ "i", "n", "v" }, "<Left>", "<Nop>", opts)
-- map({ "i", "n", "v" }, "<Right>", "<Nop>", opts)
-- map({ "i", "n", "v" }, "<Up>", "<Nop>", opts)

-- CTRL-s save

function saveFile()
	local value = vim.api.nvim_exec("update", true)
	if value ~= nil and value ~= "" then
		require("notify")(value, "info", { title = "File saved", timeout = 500 })
	else
		require("notify")("No changes", "warn", { title = "File not saved", timeout = 1000 })
	end
end

map({ "n", "i", "v" }, "<C-s>", saveFile, opts)
--
-- ----------------------------------------------------------------------------
-- Additional bindings
-- ----------------------------------------------------------------------------
-- Using Meta Key in iTerm and MacOS
-- ----------------------------------------------------------------------------
-- Add Empty space above and below
--   Unimpaired
--  [<space>
--  ]<space>
-- includes newline

-- Definition for lines
map({ "x" }, "al", "$o0", opts)
map({ "o" }, "al", "<cmd>normal val<CR>", opts)
map({ "x" }, "il", "<Esc>^vg_", opts)
map({ "o" }, "il", "<cmd>normal! ^vg_<CR>", opts)

--------------------------------------------------------------------
-- Barbar mappings
--------------------------------------------------------------------

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
map("n", "<A-q>", "<Cmd>BufferWipeout<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

--------------------------------------------------------------------
-- WhichKey mappings
--------------------------------------------------------------------
local wk = require("which-key")

--------------------------------------------------------------------
-- Basic
wk.add({
	-- { "<leader>1", "1<C-W>w", desc = "Move to Window 1" },
	-- { "<leader>2", "2<C-W>w", desc = "Move to Window 2" },
	-- { "<leader>3", "3<C-W>w", desc = "Move to Window 3" },
	-- { "<leader>4", "4<C-W>w", desc = "Move to Window 4" },
	-- { "<leader>5", "5<C-W>w", desc = "Move to Window 5" },
	-- { "<leader>6", "6<C-W>w", desc = "Move to Window 6" },
	--
	{ "<leader>*", "ggVG<c-$>", desc = "Select all", icon = "󰓎" },
	{ "<leader>p", '"xp', desc = "Paste deleted after", icon = "" },
	{ "<leader>P", '"xP', desc = "Paste deleted before", icon = "" },
	-- { "<leader>Q", "<cmd>:qa<CR>", desc = "[q]uit" },
	-- { "<leader>!", "<cmd>:qa<CR>", desc = "Quit neovim" },
	{ "<leader>/h", "<cmd>:noh<CR>", desc = "No highlight", icon = "" },
	{
		"<leader><Space>",
		function()
			if vim.fn.system("git rev-parse --is-inside-work-tree") == true then
				require("telescope.builtin").git_files()
			else
				require("telescope.builtin").find_files()
			end
		end,
		desc = "Find [git]",
	},
	{
		"<leader>.",
		function()
			saveFile()
		end,
		desc = "Save file",
		icon = "",
	},
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- New
wk.add({
	{ "<leader>n", group = "New", icon = "󰎔" },
	{ "<leader>nf", ":enew<CR>", desc = "New file" },
	{ "<leader>nb", ":lcd %:p:h <CR>:e <CR>", desc = "New file within same directory as current buffer" },
	{ "<leader>ns", ":lcd %:p:h <CR>:vsp <CR>", desc = "New split within same directory as current buffer" },
	{
		"<leader>nc",
		function()
			require("scripts.saveas").input()
		end,
		desc = "New file through copy",
	},
})

--------------------------------------------------------------------
-- Tabs
wk.add({
	{ "<leader>t", group = "Tabs" },
	{ "<leader>tk", ":tabfirst<CR>", desc = "tabfirst" },
	{ "<leader>tl", ":tabnext<CR>", desc = "tabnext" },
	{ "<leader>th", ":tabprev<CR>", desc = "tabprev" },
	{ "<leader>tj", ":tablast<CR>", desc = "tablast" },
	{ "<leader>tn", ":tabnew<CR>", desc = "tabnew" },
	{ "<leader>tc", ":tabclose<CR>", desc = "tabclose" },
})

--------------------------------------------------------------------

--------------------------------------------------------------------
-- Window
wk.add({
	{ "<leader>w", group = "Window" },
	{ "<leader>ww", "<C-W>w", desc = "Window next" },
	{
		"<leader>wr",
		function()
			require("persistence").select()
		end,
		desc = "Window restore",
	},
	{ "<leader>wc", "<C-W>c", desc = "Window close" },
	{ "<leader>wq", "<C-W>q", desc = "Window quit" },
	{ "<leader>wj", "<C-W>j", desc = "Window up" },
	{ "<leader>wk", "<C-W>k", desc = "Window down" },
	{ "<leader>wh", "<C-W>h", desc = "Window left" },
	{ "<leader>wl", "<C-W>l", desc = "Window right" },
	-- { "<leader>wz", "<cmd>MaximizerToggle<CR>", desc = "Window maximize or minimize" },
	{
		"<leader>wm",
		function()
			Snacks.zen.zoom()
		end,
		desc = "Window maximize or minimize",
	},

	{ "<leader>w-", "<C-W>10<", desc = "Decrease width" },
	{ "<leader>w+", "<C-W>10>", desc = "Increase width" },
	{ "<leader>w.", ":resize -10<CR>", desc = "Decrease height" },
	{ "<leader>w:", ":resize +10<CR>", desc = "Increase height" },
	{ "<leader>w=", "<C-W>=", desc = "Window equal" },
	{ "<leader>w_", "<C-W>s", desc = "Window split horizontal" },
	{ "<leader>ws", "<C-W>v", desc = "Window split vertical" },
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Quickfix
wk.add({
	{ "<leader>q", group = "Quickfix" },
	{ "<leader>qo", ":copen<CR>", desc = "[o]pen" },
	{ "<leader>qc", ":cclose<CR>", desc = "[c]lose" },
	{ "<leader>qgg", ":cfirst<CR>", desc = "first" },
	{ "<leader>qn", ":cnext<CR>", desc = "next" },
	{ "<leader>qp", ":cprev<CR>", desc = "previous" },
	{ "<leader>qG", ":clast<CR>", desc = "last" },
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- General
wk.add({
	{ "<leader>/", group = "General", icon = "󰋜" },
	-- {
	-- 	"<leader>/-",
	-- 	function()
	-- 		require("oil").toggle_float()
	-- 	end,
	-- 	desc = "Oil",
	-- 	icon = "",
	-- },
	{ "<leader>/c", "<cmd>ColorizerToggle<CR>", desc = "Colorizer" },
	{
		"<leader>/n",
		function()
			vim.cmd([[ source $MYVIMRC ]])
			vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
		end,
		desc = "Configuration reload",
	},

	{ "<leader>/s", "<cmd>SymbolsOutline<CR>", desc = "Symbols" },
	{ "<leader>/m", "<cmd>MinimapToggle<CR>", desc = "Minimap" },
	{ "<leader>/u", "<cmd>UndotreeToggle<CR>", desc = "Undotree" },
	{ "<leader>/p", "<cmd>TroubleToggle<CR>", desc = "Trouble" },
	{ "<leader>/l", "<cmd>Lazy<CR>", desc = "Lazy" },
	{ "<leader>/f", desc = "Format" },
	{ "<leader>/s", desc = "Session" },
	{
		"<leader>/ff",
		function()
			vim.lsp.buf.format()
		end,
		desc = "Format",
	},
	{
		"<leader>/fn",
		function()
			vim.g.autoFormat = false
		end,
		desc = "No auto format",
	},

	{
		"<leader>/fa",
		function()
			vim.g.autoFormat = true
		end,
		desc = "Activate auto format",
	},
	{
		"<leader>/sl",
		function()
			require("persistence").load()
		end,
		desc = "Session: Load for the current directory",
	},
	{
		"<leader>/sL",
		function()
			require("persistence").load({ last = true })
		end,
		desc = "Session: Load last one",
	},
	{
		"<leader>/t",
		function()
			Snacks.explorer()
		end,
		desc = "Tree",
	},
	{
		"<leader>/x",
		function()
			require("persistence").stop()
		end,
		desc = "Session: Stop recording",
	},
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Helpers
-- Open application
local open = function(application)
	local open = "open -a '" .. application .. "'"
	vim.fn.jobstart(open, { detach = true })
end

map("n", "<C-M-s>", function()
	open("Safari")
end, opts)

wk.add({
	{ "<leader>j", group = "Jump to", icon = "" },
	{
		"<leader>jc",
		function()
			open("Google Chrome")
		end,
		desc = "Google Chrome",
	},
	{
		"<leader>js",
		function()
			open("Safari")
		end,
		desc = "Apple Safari",
	},

	{
		"<leader>jo",
		function()
			open("Obsidian")
		end,
		desc = "Obsidian",
	},

	{
		"<leader>jf",
		function()
			open("Figma")
		end,
		desc = "Figma",
	},

	{
		"<leader>jt",
		function()
			open("TailwindCSS")
		end,
		desc = "Tailwind",
	},

	{
		"<leader>jg",
		function()
			open("ChatGPT")
		end,
		desc = "ChatGPT",
	},
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- -- LSP
wk.add({
	{ "<leader>l", group = "[ LSP ]" },
	{
		"<leader>lf",
		desc = "Format",
	},
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Harpoon
-- wk.register({
-- 	h = {
-- 		name = "Harpoon",
--
-- 		a = {
-- 			function()
-- 				require("harpoon.mark").add_file()
-- 			end,
-- 			"Add file",
-- 		},
-- 		h = {
-- 			function()
-- 				require("harpoon.ui").toggle_quick_menu()
-- 			end,
-- 			"Quick menu",
-- 		},
-- 		n = {
-- 			function()
-- 				require("harpoon.ui").nav_next()
-- 			end,
-- 			"Next file",
-- 		},
--
-- 		p = {
-- 			function()
-- 				require("harpoon.ui").nav_prev()
-- 			end,
-- 			"Previous file",
-- 		},
-- 		-- s = {
-- 		-- 	name = "Surround does not work", -- TODO
-- 		-- 	["'"] = { "ysiw", "Surround word" },
-- 		-- 	[";"] = { "yss", "Surround line" },
-- 		-- },
-- 	},
-- }, { prefix = "<leader>" })

--------------------------------------------------------------------

--------------------------------------------------------------------
-- Code
wk.add({
	{ "<leader>c", group = "Code" },
})

wk.add({
	{ "<leader>d", group = "Diagnostics", icon = "" },
	{ "<leader>dx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
	{ "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
	{ "<leader>dd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
	{ "<leader>dq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
	{ "<leader>dl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
	{ "<leader>dt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- GIT
wk.add({
	{ "<leader>g", group = "Git" },
	{ "<leader>gf", group = "Fugitive" },
	{ "<leader>gh", group = "Hunk" },
	{ "<leader>g/", "<cmd>:!git rev-parse --show-toplevel<CR>", desc = "Show toplevel", icon = "" },
	{ "<leader>gf#", "<cmd>:Git blame<CR>", desc = "Blame list" },
	{ "<leader>gf?", "<cmd>:Git<CR>", desc = "Status" },
	{ "<leader>gfS", "<cmd>:Git add .", desc = "Stage all" },
	{ "<leader>gfx", "<cmd>:GBrowse<CR>", desc = "Github" },
	{ "<leader>gfc", "<cmd>:Git commit<CR>", desc = "Commit" },
	{ "<leader>gfl", "<cmd>:Git log<CR>", desc = "Log" },
	{ "<leader>gfp", "<cmd>:Git push<CR>", desc = "Push" },
	{ "<leader>gfP", "<cmd>:Git pull<CR>", desc = "pull" },
	{ "<leader>gfr", "<cmd>:GRemove<CR>", desc = "Remove" },
})

--------------------------------------------------------------------

--------------------------------------------------------------------
-- Find
wk.add({
	{ "<leader>f", group = "Find" },

	{
		"<leader>fa",
		function()
			require("telescope.builtin").find_files()
		end,
		desc = "Find [all]",
	},

	{
		"<leader>fA",
		"<cmd>AdvancedGitSearch<CR>",
		desc = "Advanced Git Search",
	},
	{
		"<leader>fb",
		function()
			require("telescope.builtin").buffers()
		end,
		desc = "Buffers",
	},

	{
		"<leader>f*",
		function()
			require("telescope").extensions.neoclip.default()
		end,
		desc = "Clipboard",
	},
	{
		"<leader>f#",
		function()
			require("telescope").extensions.file_browser.file_browser()
		end,
		desc = "File browser",
	},
	{
		"<leader>f-",
		function()
			require("telescope.builtin").find_files({ cwd = "~/.dotfiles" })
		end,
		desc = "Dotfiles",
	},
	{
		"<leader>f_",
		function()
			require("telescope.builtin").find_files({ cwd = "~/.scripts" })
		end,
		desc = "Scripts",
	},
	{
		"<leader>f?",
		function()
			require("telescope.builtin").find_files({ cwd = "~/Documents/Dokumentation/Knowledge/" })
		end,
		desc = "Obsidian",
	},
	{
		"<leader>f=",
		function()
			require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({}))
		end,
		desc = "Spell suggest",
	},
	{
		"<leader>fd",
		function()
			require("telescope.builtin").diagnostics()
		end,
		desc = "Diagnostics",
	},
	{
		"<leader>f,",
		function()
			require("telescope").commands()
		end,
		desc = "Commands",
	},
	{
		"<leader>fp",
		function()
			require("telescope").extensions.repo.list({})
		end,
		desc = "Projects",
	},
	{
		"<leader>ff",
		function()
			if vim.fn.system("git rev-parse --is-inside-work-tree") == true then
				require("telescope.builtin").git_files()
			else
				require("telescope.builtin").find_files()
			end
		end,
		desc = "Find [git]",
	},
	{
		"<leader>fc",
		function()
			require("telescope.builtin").git_bcommits()
		end,
		desc = "Commits [buffer]",
	},
	{
		"<leader>fG",
		function()
			require("telescope.builtin").git_commits()
		end,
		desc = "Commits",
	},
	{
		"<leader>fg",
		function()
			require("telescope.builtin").live_grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>fw",
		function()
			local word = vim.fn.expand("<cword>")
			require("telescope.builtin").find_files({ default_text = word })
		end,
		desc = "Grep word",
	},
	{
		"<leader>fW",
		function()
			-- local word = vim.fn.expand("<cWORD>")
			local word = vim.fn.expand("<cword>")
			require("telescope.builtin").grep_string({ default_text = word })
		end,
		desc = "Grep WORD",
	},
	{
		"<leader>f.",
		function()
			require("telescope.builtin").live_grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>fh",
		function()
			require("telescope.builtin").help_tags()
		end,
		desc = "Help",
	},
	{
		"<leader>fl",
		function()
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end,
		desc = "Lines",
	},
	{
		"<leader>fk",
		function()
			require("telescope.builtin").keymaps()
		end,
		desc = "Mappings",
	},
	{
		"<leader>fm",
		function()
			require("telescope.builtin").marks()
		end,
		desc = "Marks",
	},

	{
		"<leader>fr",
		function()
			require("telescope.builtin").oldfiles()
		end,
		desc = "Recent files",
	},
	{
		"<leader>fs",
		function()
			require("telescope.builtin").git_status()
		end,
		desc = "Status [git]",
	},
	{
		"<leader>fq",
		function()
			require("telescope.builtin").quickfix()
		end,
		desc = "Quickfix",
	},
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Obsidian
wk.add({
	{ "<leader>o", group = "Obsidian", icon = "" },
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Quick replace
-- Normal mode
wk.add({
	{ "<leader>r", group = "Replace", icon = "" },
	{
		mode = { "n" },
		{ "<leader>rb", ":%s/<C-r><C-w>/", desc = "Replace current word" },
		{ "<leader>rl", ":s/<C-r><C-w>/", desc = "Replace current word in line" },
	},
	{
		mode = { "v" },
		{ "<leader>rb", '""y:%s/<C-r>"/', desc = "Replace current selection" },
	},
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Search
-- Open browser
local browser = function(application, parameter)
	local target = vim.fn.trim(application) .. vim.fn.trim(parameter)
	local open_command = vim.fn.extend({ "open" }, { target })

	vim.fn.jobstart(open_command, { detach = true })
end

local function get_visual()
	vim.api.nvim_exec([[ normal "vygv ]], true)
	return vim.api.nvim_exec([[echo getreg('v')]], true):gsub("[\n\r]", "^J")
end

wk.add({
	{ "<leader>s", group = "Search" },
	{
		-- Normal mode
		mode = { "n" },

		{
			"<leader>sd",
			function()
				browser("https://devdocs.io/#q=", vim.bo.filetype .. "%20" .. vim.fn.expand("<cword>"))
			end,
			desc = "DevDocs",
		},
		{
			"<leader>sg",
			function()
				browser("https://google.de/search?q=", vim.fn.expand("<cword>"))
			end,
			desc = "Google with selected word",
		},
		{
			"<leader>si",
			function()
				require("browse").input_search()
			end,
			desc = "Google with input",
		},
	},
	{
		-- Visual mode
		mode = { "v" },
		{
			"<leader>sg",
			function()
				browser("https://google.de/search?q=", get_visual())
			end,
			desc = "Google with selected text",
		},
		{
			"<leader>ss",
			function()
				browser(get_visual(), "")
			end,
			desc = "Open browser with selected text",
		},
	},
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Buffer
wk.add({
	{ "<leader>b", group = "Buffer" },
	{
		"<leader>bb",
		function()
			require("telescope.builtin").buffers()
		end,
		desc = "List buffers",
	},
	{ "<leader>bn", desc = "Order by number" },
	{ "<leader>bp", desc = "Order by directory tree" },
	{ "<leader>bl", desc = "Order by language" },
	{ "<leader>bw", desc = "Order by window number" },
	{ "<leader>bs", "<cmd>w<CR>", desc = "Save buffer" },
	{ "<leader>bd", "<Cmd>close<CR>", desc = "Close file" },
	{ "<leader>bc", "<Cmd>bd<CR>", desc = "Close buffer view" },
	{ "<leader>bx", "<cmd>bd!<CR>", desc = "DELETE buffer" },
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- KI
wk.add({
	{ "<leader>a", group = "AI" },
	{ "<leader>ac", "<cmd>ChatGPT<CR>", desc = "ChatGPT", mode = { "n" } },
	{ "<leader>ae", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", mode = { "n", "v" } },
	{ "<leader>ag", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
	{ "<leader>at", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
	{ "<leader>ak", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
	{ "<leader>ad", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
	{ "<leader>aa", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
	{ "<leader>ao", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
	{ "<leader>as", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
	{ "<leader>af", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
	{ "<leader>ax", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
	{ "<leader>ar", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", mode = { "n", "v" } },
	{
		"<leader>al",
		"<cmd>ChatGPTRun code_readability_analysis<CR>",
		desc = "Code Readability Analysis",
		mode = { "n", "v" },
	},
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Location
wk.add({
	{ "<leader>l", group = "Location", icon = "" },
	{ "<leader>l-", desc = "Order by number" },
	{ "<leader>l-", "<cmd>cd ~/.dotfiles<CR>", desc = ".dotfiles" },
	{ "<leader>l_", "<cmd>cd ~/.scripts<CR>", desc = ".scripts" },
	{ "<leader>lp", "<cmd>cd ~/Documents/Projects<CR>", desc = "Projects" },
	{ "<leader>ld", "<cmd>cd ~/Documents<CR>", desc = "Documents" },
})
--------------------------------------------------------------------

--------------------------------------------------------------------
-- Time Date
wk.add({
	{ "<leader>+", group = "Time and Date", icon = "" },
	{ "<leader>+t", "<cmd>Time<CR>", desc = "Time" },
	{ "<leader>+d", "<cmd>Date<CR>", desc = "Date" },
	{ "<leader>+u", "<cmd>USDate<CR>", desc = "US Date" },
	{ "<leader>+c", "<cmd>TimeDiff<CR>", desc = "Time Diff" },
})
--------------------------------------------------------------------

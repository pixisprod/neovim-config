vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["q"] = "actions.close",
	},
})

local map = vim.keymap.set
map("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

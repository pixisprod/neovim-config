vim.pack.add({
	"https://github.com/nvim-tree/nvim-tree.lua",
})

require("nvim-tree").setup({
	view = { width = 30 },
	update_focused_file = { enable = true },
	hijack_directories = { enable = false },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File tree" })

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "l", api.node.open.edit, { buffer = bufnr, desc = "Open" })
	vim.keymap.set("n", "h", api.node.navigate.parent_close, { buffer = bufnr, desc = "Close parent folder" })
end

require("nvim-tree").setup({
	on_attach = on_attach,
	view = { width = 30 },
	update_focused_file = { enable = true },
	hijack_directories = { enable = false },
  	diagnostics = {
    	enable = true,
    	show_on_dirs = true,
  	},
	renderer = {
		icons = {
      		git_placement = "after", -- значок справа от имени, а не перед иконкой файла
      		glyphs = {
        		git = {
          			unstaged  = "•",
          			staged    = "•",
          			untracked = "•",
          			renamed   = "≫",
          			deleted   = "✗",
          			ignored   = "",
        },
      },
    },
  },
})

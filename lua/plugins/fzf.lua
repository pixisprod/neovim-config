vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
})

require("fzf-lua").setup({})

local map = vim.keymap.set

map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Grep project" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fr", "<cmd>FzfLua resume<cr>", { desc = "Resume last search" })

map("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Symbols in file" })
map("n", "<leader>fS", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", { desc = "Symbols in project" })
map("n", "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", { desc = "Diagnostics" })

local map = vim.keymap.set

map({ "n", "v" }, "<Space>", "<Nop>")
map("n", "<C-s>", "<cmd>write<cr>", { desc = "Save file" })
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

map("n", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("n", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to bottom window" })
map("n", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to up window" })

map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

map("n", "H", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "L", "<cmd>bnext<cr>", { desc = "Next buffer" })

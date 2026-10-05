vim.pack.add({
	"https://github.com/akinsho/toggleterm.nvim",
})

require("toggleterm").setup({
	open_mapping = { [[<c-/>]], [[<c-_>]] },
	direction = "horizontal",
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return math.floor(vim.o.columns * 0.35)
		end
	end,
})

local group = vim.api.nvim_create_augroup("MyTerminal", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
	group = group,
	pattern = "term://*toggleterm#*",
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", opts)
		vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", opts)
		vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", opts)
		vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", opts)
	end,
})

local Terminal = require("toggleterm.terminal").Terminal

local claude = Terminal:new({
  cmd = "claude",
  count = 99,
  direction = "vertical",
  hidden = true,
  close_on_exit = false,
})

vim.keymap.set("n", "<leader>ac", function()
  claude:toggle()
end, { desc = "Claude" })

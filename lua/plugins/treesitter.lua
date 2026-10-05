vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
})

require("nvim-treesitter").install({
	"go",
	"gomod",
	"gowork",
	"sql",
	"lua",
	"json",
	"yaml",
	"markdown",
	"dockerfile",
	"make",
})

local group = vim.api.nvim_create_augroup("MyTreesitter", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = group,
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

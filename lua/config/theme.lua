local file = vim.fn.stdpath("data") .. "/theme.txt"

if vim.fn.filereadable(file) == 1 then
	local lines = vim.fn.readfile(file)
	vim.cmd.colorscheme(lines[1])
else
	vim.cmd.colorscheme("vim")
end

local group = vim.api.nvim_create_augroup("MyTheme", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  callback = function(args)
	vim.fn.writefile({args.match}, file)
  end,
})

vim.keymap.set("n", "<leader>ut", "<cmd>FzfLua colorschemes<cr>", { desc = "Colorscheme" })

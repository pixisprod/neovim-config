vim.g.mapleader = " "
vim.g.maplocalleader = " "

if not vim.env.XDG_RUNTIME_DIR then
	local run = vim.fn.stdpath("cache") .. "/run"
	vim.fn.mkdir(run, "p", tonumber("700", 8))
	vim.env.XDG_RUNTIME_DIR = run
end

require("config.options")
require("config.keymaps")
require("config.colorscheme")
require("config.filetypes")
require("config.statusline")

require("plugins.neoscroll")
require("plugins.blink")
require("plugins.lsp")
require("plugins.pairs")
require("plugins.treesitter")
require("plugins.textobjects")
require("plugins.fzf")
require("plugins.whichkey")
require("plugins.oil")
require("plugins.tree")
require("plugins.toggleterm")
require("plugins.tabline")
require("plugins.bufremove")
require("plugins.icons")
require("plugins.starter")
require("plugins.hotreload")

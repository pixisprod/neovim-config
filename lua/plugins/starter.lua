vim.pack.add({
  "https://github.com/nvim-mini/mini.starter",
})

local starter = require("mini.starter")

local art = table.concat(vim.fn.readfile(vim.fn.stdpath("config") .. "/art.txt"), "\n")

local header = [[
    ____  _      _    
   / __ \(_)  __(_)__ 
  / /_/ / / |/_/ / _ \
 / ____/ />  </ /  __/
/_/   /_/_/|_/_/\___/ 
]]

starter.setup({
  header = art,
  items = {
    starter.sections.recent_files(5, false),
    { name = "Find file", action = "FzfLua files", section = "Actions" },
    { name = "Grep",      action = "FzfLua live_grep", section = "Actions" },
    { name = "Config",    action = "edit ~/.config/nv/init.lua", section = "Actions" },
    { name = "Quit",      action = "qall", section = "Actions" },
  },
  footer = "",
})

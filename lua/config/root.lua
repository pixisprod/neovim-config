local group = vim.api.nvim_create_augroup("MyProjectRoot", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  group = group,
  callback = function()
    local root = vim.fs.root(0, { ".git", "go.mod", "project.godot" })
    if root and root ~= vim.fn.getcwd() then
      vim.cmd.cd(root)
    end
  end,
})

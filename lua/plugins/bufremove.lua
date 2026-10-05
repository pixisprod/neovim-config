vim.pack.add({
	"https://github.com/nvim-mini/mini.bufremove",
})

require("mini.bufremove").setup({})

vim.keymap.set("n", "<leader>bd", function()
	require("mini.bufremove").delete()
end, { desc = "Delete buffer" })

vim.keymap.set("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
      require("mini.bufremove").delete(buf)
    end
  end
end, { desc = "Delete other buffers" })

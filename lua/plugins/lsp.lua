vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})

vim.lsp.enable({ "gopls", "docker_language_server", "gdscript", "lua_ls" })

local group = vim.api.nvim_create_augroup("MyGoFormat", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	group = group,
	pattern = "*.go",
	callback = function(args)
		local client = vim.lsp.get_clients({ bufnr = args.buf, name = "gopls" })[1]
		if not client then
			return
		end

		local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
		params.context = { only = { "source.organizeImports" } }

		local res = client:request_sync("textDocument/codeAction", params, 1000, args.buf)
		for _, action in ipairs(res and res.result or {}) do
			if action.edit then
				vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
			end
		end

		vim.lsp.buf.format({ bufnr = args.buf, async = false })
	end,
})

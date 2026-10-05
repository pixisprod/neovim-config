vim.filetype.add({
	filename = {
		["compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-bake.hcl"] = "hcl.docker-bake",
	},
})

vim.treesitter.language.register("yaml", "yaml.docker-compose")

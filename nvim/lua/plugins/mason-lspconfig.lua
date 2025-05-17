local opts = {
	ensure_installed = {
		"efm",
		"lua_ls",
		"clangd",
		"gopls",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	lazy = false,
	dependencies = "williamboman/mason.nvim",
}

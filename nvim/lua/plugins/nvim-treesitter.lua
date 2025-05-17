local config = function()
	require("nvim-treesitter.configs").setup({
		indent = {
			enable = false,
		},
		autotag = {
			enable = true,
		},
		ensure_installed = {
			"c",
			"cpp",
			"markdown",
			"json",
			"javascript",
			"yaml",
			"html",
			"css",
			"bash",
			"lua",
			"dockerfile",
			"gitignore",
			"python",
			"go",
			"qmldir",
			"qmljs",
		},
		auto_install = true,
		highlight = {
			enable = true,
			disable = { "cpp", "go" },
			additional_vim_regex_highlighting = true,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = config,
}

local keymap = vim.keymap

return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		keymap.set("n", "<leader>ft", ":TodoTelescope<CR>"),
	},
}

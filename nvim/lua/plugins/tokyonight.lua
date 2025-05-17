return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
        -- tokyonight-moon, tokyonight-storm, tokyonight-day, tokyonight-night
		vim.cmd("colorscheme tokyonight-moon")
	end,
}

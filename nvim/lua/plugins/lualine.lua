local config = function()
	-- local theme = require("lualine.themes.iceberg")
	local theme = require("lualine.themes.papercolor_light")

	-- set bg transparency in all mode
	-- theme.normal.bg = nil
	-- theme.insert.bg = nil
	-- theme.visual.bg = nil
	-- theme.replace.bg = nil
	-- theme.command.bg = nil

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = true,
		},
		tabline = {
			lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = { "buffers" },
			lualine_x = { "filetype", "encoding" },
			lualine_y = { "lsp_status" },
			lualine_z = { "location" },
		},
        sections = {
            lualine_a = { "progress" },
            lualine_b = { "diff", "diagnostics" , "file_status" },
            lualine_c = {
                {
                    'filename',
                    path = 1,
                }
            },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}

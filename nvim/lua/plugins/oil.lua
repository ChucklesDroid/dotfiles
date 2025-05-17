local config = function()
	local oil = require('oil')

    oil.setup({
        default_file_explorer = true,
        view_options = {
            show_hidden = true,
            is_hidden_file = function(name, bufnr)
                return vim.startswith(name, ".")
            end,
        },
        delete_to_trash = false,
        preview_win = {
            update_on_cursor_moved = true,
            preview_method = "fast_scratch",
            disable_preview = function(filename)
              return false
            end,
            win_options = {},
        },
    })
end

return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = {
        { "echasnovski/mini.icons", opts = {} }
    },
    config = config,
    lazy = false,
}

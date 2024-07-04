local nvim = vim.o
nvim.foldcolumn = "1"
nvim.foldlevel = 99
nvim.foldlevelstart = 99
nvim.foldenable = true

return {
	"kevinhwang91/nvim-ufo",
  lazy = false,
	dependencies = "kevinhwang91/promise-async",
  config = function()
  require("ufo").setup({
    provider_selector = function(bufnr, filetype, buftype)
      return { "lsp", "indent" }
    end,
  })
  end,
}

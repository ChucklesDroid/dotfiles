local config = function()
	-- require("neoconf").setup({})
	local lspconfig = require("lspconfig")
	local util = require("lspconfig/util")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	local signs = { Error = "", Warn = "", Hint = "", Info = "" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- enable keybindings for only when lsp server available
	local on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- set keybindings
		vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
		vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
		vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
		vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
		vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
		vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to prev diagnostic in buffer
		vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
		vim.keymap.set("n", "<leader>lo", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

		if client.name == "pyright" then
			vim.keymap.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
		end
	end

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	-- c++
	lspconfig.clangd.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"cpp",
			"hpp",
			"c",
			"h",
		},
		cmd = {
			"clangd",
			"--background-index",
			"--offset-encoding=utf-16",
			"--clang-tidy",
			"--header-insertion=iwyu",
		},
		init_options = {
			clangdFileStatus = true, -- provides information about activity on clangd’s per-file worker thread
			usePlaceholders = true, -- enables use of placeholders in in code completions provided by clangd
			completeUnimported = true, -- code completions for symbols that are defined in headers not included
			semanticHighlighting = true, -- enables symantic highlighting powered by clangd
		},
	})

	-- golang
	lspconfig.gopls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = { "gopls" },
		filetypes = {
			"go",
			"gomod",
			"gowork",
			"gotmpl",
		},
		root_dir = util.root_pattern("go.work", "go.mod", "gotmpl"),
	})

	-- qml
	lspconfig.qmlls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "qml" },
		cmd = { "qmlls" },
		single_file_support = true,
		root_dir = function(fname)
			return lspconfig.util.find_git_ancestor(fname)
		end,
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")
	local clang_format = require("efmls-configs.formatters.clang_format")
	local golangci_lint = require("efmls-configs.linters.golangci_lint")
	local gofumpt = require("efmls-configs.formatters.gofumpt")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
			"cpp",
			"go",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
				cpp = { clang_format },
				go = { golangci_lint, gofumpt },
			},
		},
	})

	-- format on save
	local lsp_fmt_grp = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_grp,
		callback = function()
			local efm = vim.lsp.get_active_clients({ name = "efm" })

			if vim.tbl_isempty(efm) then
				return
			end

			vim.lsp.buf.format({ name = "efm" })
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}

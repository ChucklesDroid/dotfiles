-- Only store keymaps for plugins for which `lazy = false`

keymap = vim.keymap

-- Directory Navigation
keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Window and Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) --navigate left
keymap.set("n", "<C-j>", "<C-w>j", opts) --navigate down
keymap.set("n", "<C-k>", "<C-w>k", opts) --navigate up
keymap.set("n", "<C-l>", "<C-w>l", opts) --navigate right
keymap.set("t", "<C-h>", "wincmd h", opts) -- Navigate Left
keymap.set("t", "<C-j>", "wincmd j", opts) -- Navigate Down
keymap.set("t", "<C-k>", "wincmd k", opts) -- Navigate Up
keymap.set("t", "<C-l>", "wincmd l", opts) -- Navigate Right
keymap.set("n", "<C-h>", "TmuxNavigateLeft", opts) -- Navigate Left
keymap.set("n", "<C-j>", "TmuxNavigateDown", opts) -- Navigate Down
keymap.set("n", "<C-k>", "TmuxNavigateUp", opts) -- Navigate Up
keymap.set("n", "<C-l>", "TmuxNavigateRight", opts) -- Navigate Right

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- split vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- split horizontally
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- toggle minimize

-- Comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Indentation
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

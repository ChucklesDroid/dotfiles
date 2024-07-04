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

-- Change buffers
keymap.set("n", "<C-n>", ":bnext<CR>")
keymap.set("n", "<C-p>", ":bprevious<CR>")
keymap.set("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>") -- close the buffer

-- TODO jumping
keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- TODO jumping: You can also specify a list of valid jump keywords
-- keymap.set("n", "]t", function()
-- 	require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
-- end, { desc = "Next error/warning todo comment" })

-- Neogit
keymap.set('n', "<C-s>", ":Neogit<CR>", opts) --open default neogit window

-- Diffview
keymap.set('n', "<C-d>", ":DiffviewOpen<CR>", opts)

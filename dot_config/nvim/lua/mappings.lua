require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
local nomap = vim.keymap.del
nomap("n", "<C-n>")

map('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>',
  { desc = 'LSP: Document symbols' })
map('n', '<leader>lS', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
  { desc = 'LSP: Workspace symbols' })

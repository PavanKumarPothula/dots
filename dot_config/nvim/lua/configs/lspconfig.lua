require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)
vim.lsp.inlay_hint.enable()
vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
-- read :h vim.lsp.config for changing options of lsp servers 

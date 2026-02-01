require('options')
require('keymaps')

vim.opt.confirm = true
vim.opt.signcolumn = "yes:1"

vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')

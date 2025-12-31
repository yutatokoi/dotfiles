-- Continuously press '<'/'>' in visual mode for indent
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

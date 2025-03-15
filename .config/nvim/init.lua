require 'core.keymaps'
require 'core.options'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
    -- require 'plugins.colortheme',
    require 'plugins.neotree',
    require 'plugins.bufferline',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    require 'plugins.gitsigns',
    require 'plugins.alpha',
    require 'plugins.indent-blanklines',
    require 'plugins.misc'
})

-- Function to set indent size based on file extension
_G.set_indent_size = function()
  local filetype = vim.bo.filetype
  if filetype == 'yaml' or filetype == 'yml' or filetype == 'nix' then
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  else
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
end

-- Auto command to call set_indent_size function on file read or buffer enter
vim.api.nvim_exec([[
  augroup IndentSize
    autocmd!
    autocmd BufRead,BufNewFile * lua _G.set_indent_size()
  augroup END
]], false)

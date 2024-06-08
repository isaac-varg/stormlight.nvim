-- [[
-- trying to understand neovim configuratin
-- by following typecraft's video
-- https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=1&t=910s
-- ]]

-- neovim settings

vim.g.mapleader = " "


-- lazy == our plugin manager
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- this is where we declare our plugins for lazy
require("lazy").setup({
	-- catppuccin theme
	-- https://github.com/catppuccin/nvim?tab=readme-ov-file
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {} },
	-- telescope
	-- https://github.com/nvim-telescope/telescope.nvim
 	{ 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' }
    }

})



-- set the color scheme to catppucine
vim.cmd.colorscheme "catppuccin-macchiato"


-- telescope , this was in the usage section of the docs
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- [[
-- trying to understand neovim configuratin
-- by following typecraft's video
-- https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=1&t=910s
-- ]]



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

require("lazy").setup({
	-- catppuccin theme
	-- https://github.com/catppuccin/nvim?tab=readme-ov-file
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {} }
})



-- set the color scheme to catppucine
vim.cmd.colorscheme "catppuccin-macchiato"

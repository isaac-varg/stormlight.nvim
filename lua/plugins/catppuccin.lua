-- catppuccin theme
-- https://github.com/catppuccin/nvim?tab=readme-ov-file

return { 
	"catppuccin/nvim",
	name = "catppuccin", 
	priority = 1000, 
	-- set the color scheme to catppuccin
	config = function()	
		vim.cmd.colorscheme "catppuccin-macchiato"
	end
 }


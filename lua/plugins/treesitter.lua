-- treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
return { "nvim-treesitter/nvim-treesitter", 
	build = ":TSUpdate",
	config = function () 
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			--[[ changing to auto install but this was my config before
			ensure_installed = { 
				"lua", "vim", "vimdoc",  "javascript", "html", 
				"typescript", "arduino", "bash", "go", "json", 
				"prisma", "css", "dart",
			},
			]]
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },  
		})
	end
}

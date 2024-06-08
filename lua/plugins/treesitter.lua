-- treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
return { "nvim-treesitter/nvim-treesitter", 
	build = ":TSUpdate",
	config = function () 
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { 
				"lua", "vim", "vimdoc",  "javascript", "html", 
				"typescript", "arduino", "bash", "go", "json", 
				"prisma", "css", "dart",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },  
		})
	end
}

-- neo tree
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return { "nvim-neo-tree/neo-tree.nvim",
    	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
    	},
	config = function()
		-- keymaps for neotree
		-- Sets Ctrl + n to open neotree
		-- The <CR> is 'carriage return' which presses enter i think?
		-- without it it I had to hit enter so probably
		vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>')
	end
}


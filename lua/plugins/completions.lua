--[[
-- nvim-cmp, https://github.com/hrsh7th/nvim-cmp
-- this plugins basically handles the ui dialog that pops up for
-- completions and snippets and accepts sources for those snipets
--
-- the other pluguns, LuaSnip and cmp_lausnip are used by the above plugin
-- and luasnip uses cmp_luasnip for the completions.
-- this was found in ther ecommended configuration for nvim-cmp plugin
-- https://github.com/L3MON4D3/LuaSnip
--
-- friendly snippets, https://github.com/rafamadriz/friendly-snippets
-- gives us the cool vscode like snippets..
--
-- cmp-nvim-lsp, https://gnonameplusithub.com/hrsh7th/cmp-nvim-lsp
-- the last thing reaches out to any lsps in current buffer
-- and ask it for completion recommends then cmp will use thoses completions
--
]]

return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		-- completion engine for luasnip
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			-- form lausnip plugin, loads vscode like snippets?
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					-- i believe this is the piece of code that runs when you select a snippet
					expand = function(args)
						--vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				-- how the window looks
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				-- these are the keybinds
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "buffer" },
					{ name = "go" },
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				})
				--[[, {
					{ name = "buffer" },
				}),]]
			})
		end,
	},
}

--[[ contains server plugins that enable lsp to work

-- first is mason, https://github.com/williamboman/mason.nvim
-- i believe mason is the plugin that allows neovim to communicate with
-- language server protocol serversl (which is what gives us language features
-- similar to installing a plugin with vscode)
--
-- next is mason-lspconfig.nvim, https://github.com/williamboman/mason-lspconfig.nvim
-- this does a bunch of things, but what i want it for is to be able to
-- require certain apis, rather than using the mason commands and ui manually
--
-- nvim-lspconfig, https://github.com/neovim/nvim-lspconfig
-- the last plugin in what allows neovim to send and accept information
-- from a language server
--
-- can use :help vim.lsp.buf to see available actions with lsp
--
--
]]

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- ensuring that certain lsps are installed
				-- see line 8
				ensure_installed = {
					"lua_ls",
					"tsserver",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- this is for lsp completions in completions.lua
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- then in every lsp below, must pass the capabilities
			-- to every langauge server in the buffer
			--
			-- sets lspconfig to this variabel so we can call and configure
			local lspconfig = require("lspconfig")
			-- configure lua_ls
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			-- configure tsserver
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			-- sets Shift K to provide us with hover documentation
			-- what it actually calls was learned from ":help vim.lsp.buf"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

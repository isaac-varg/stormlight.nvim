-- https://github.com/nvimtools/none-ls.nvim
-- none-ls is a community fork of null-ls plugin
-- which was archived by the author for personal reason
-- it was immensely popular so there is a actively maintained fork
-- this is basically a wrapper for formatters that creates a general
-- language server (or a pseuco lsp) that allows us to use command line formatters such as prettier, etc.

-- firstly, we set stylua as a source, however, we do not have stylua installed on our
-- system, so we used mason tui to install it
-- however, in @typecraft's video i saw a comment by
-- @yeurch mentioning jay-babu/mason-null-ls.nvim plugin
-- which works similar to mason in that you require the stylua instead of manually installing it

return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.completion.spell,
				require("none-ls.diagnostics.eslint"),
			},
		})
		-- keymap to format using anything (lsp/formatter) that is
		-- attached to this buffer
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			integrations = {
				mason = true,
				lsp_trouble = true,
			}
		})
		vim.cmd [[colorscheme catppuccin-macchiato]] -- " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
	end
}

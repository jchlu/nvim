vim.keymap.set('n', '<leader>gg', '<Esc><cmd>LazyGit<cr>')
return {
	"kdheepak/lazygit.nvim",
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

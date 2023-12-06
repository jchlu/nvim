return {
	'nvim-lualine/lualine.nvim', -- Fancier statusline
	-- Set lualine as statusline
	-- See `:help lualine.txt`
	config = function()
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'tokyonight',
				component_separators = '|',
				section_separators = '',
			},
			sections = {
				lualine_z = { 'location', 'ctime' }
			}
		}
	end
}

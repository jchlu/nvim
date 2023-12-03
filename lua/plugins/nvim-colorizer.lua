return {
	'norcalli/nvim-colorizer.lua',
	config = function()
		-- Use the `default_options` as the second parameter, which uses
		-- `foreground` for every mode. This is the inverse of the previous
		-- setup configuration.
		require 'colorizer'.setup({
			'*',
		}, {
			hsl_fn = true,
			rgb_fn = true,
		})
	end
}

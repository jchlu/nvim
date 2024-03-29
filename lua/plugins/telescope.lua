return {

	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		"nvim-telescope/telescope-live-grep-args.nvim"
	},
	config = function()
		require("telescope").load_extension("live_grep_args")
		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		require('telescope').setup {
			defaults = {
				layout_strategy = 'vertical',
				layout_config = {
					vertical = {
						height = 0.99,
						width = 0.99,
						preview_cutoff = 1,
					}
					-- other layout configuration here
				},
				mappings = {
					n = {
						['<c-d>'] = require('telescope.actions').delete_buffer
					},
					i = {
						['<C-u>'] = false,
						['<c-d>'] = require('telescope.actions').delete_buffer,
					},
				},
			},
		}

		-- Enable telescope fzf native, if installed
		pcall(require('telescope').load_extension, 'fzf')

		-- See `:help telescope.builtin`
		vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
			{ desc = '[?] Find recently opened files' })
		vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
			{ desc = '[ ] Find existing buffers' })
		vim.keymap.set('n', '<leader>sb', function()
			require("buffer_manager.ui").toggle_quick_menu()
		end, { desc = '[ ] Find existing buffers' })
		vim.keymap.set('n', '<leader>/', function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = '[/] Fuzzily search in current buffer]' })
		vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
		vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
			{ desc = '[S]earch current [W]ord' })
		-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
		vim.keymap.set('n', '<leader>sg',
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = '[S]earch by [G]rep' })
		vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics,
			{ desc = '[S]earch [D]iagnostics' })
		vim.keymap.set('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>',
			{ noremap = true, silent = true })
		vim.keymap.set('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>zz',
			{ noremap = true, silent = true })
		vim.keymap.set('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>zz',
			{ noremap = true, silent = true })
	end,
}

return {
	{
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup({
				integrations = {
					mason = true,
					lsp_trouble = true,
				}
			})
			vim.cmd [[colorscheme catppuccin-macchiato]] -- " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
		end
	},
	'christoomey/vim-tmux-navigator',
	{
		'folke/neodev.nvim',
		config = function() require("neodev").setup() end
	},
	-- 'mattn/emmet-vim',
	-- 'christoomey/vim-tmux-navigator',
	{
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
	},
	'amadeus/vim-convert-color-to',
	'mbbill/undotree',
	--[[ use { 'folke/tokyonight.nvim',
    config = function()
      require("tokyonight").setup({
	style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	-- transparent = true, -- Enable this to disable setting the background color
      })
    end
  } ]]
	'tpope/vim-commentary',
	'tpope/vim-surround',
	'jchlu/lualine-time',
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		-- tag = 'nightly' -- optional, updated every week. (see issue #1193)
		{
			'notjedi/nvim-rooter.lua',
			config = function() require 'nvim-rooter'.setup() end
		},
	},

	{ 'mg979/vim-visual-multi' },

	{ -- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			'j-hui/fidget.nvim',
		},
	},
	-- 'prettier/vim-prettier', -- Add Prettier
	{ -- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	},
	-- Git related plugins
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	'j-morano/buffer_manager.nvim',
	-- 'tpope/vim-fugitive',
	-- 'tpope/vim-rhubarb',
	'lewis6991/gitsigns.nvim',

	{
		'nvim-lualine/lualine.nvim', -- Fancier statusline
		-- Set lualine as statusline
		-- See `:help lualine.txt`
		config = function()
			require('lualine').setup {
				options = {
					icons_enabled = true,
					theme = 'catppuccin',
					component_separators = '|',
					section_separators = '',
				},
				sections = {
					lualine_z = { 'location', 'ctime' }
				}
			}
		end
	},
	-- 'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
	'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
	'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

	-- Fuzzy Finder (files, lsp, etc)
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			"nvim-telescope/telescope-live-grep-args.nvim"
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end
	},
	-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	},
	-- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make',                             cond = vim.fn.executable 'make' == 1 },
	{ 'kevinhwang91/nvim-ufo',                    dependencies = 'kevinhwang91/promise-async' },
	'akinsho/toggleterm.nvim',
	'wuelnerdotexe/vim-astro',
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			conform.setup({
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					-- lua = { "stylua" },
					-- Conform will build multiple formatters sequentially
					-- python = { "isort", "black" },
					-- Use a sub-list to build only the first available formatter
					javascript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescriptreact = { "prettierd" },
				},
			})
			-- stopinsert
			vim.keymap.set("i", "<C-s>", function()
				vim.cmd "stopinsert"
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
				vim.cmd "update"
			end, { desc = "Format file or range (in visual mode) and save file" })
			vim.keymap.set({ "n", "v" }, "<C-s>", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
				vim.cmd "update"
			end, { desc = "Format file or range (in visual mode) and save file" })
			vim.keymap.set({ "n", "v" }, "<leader>ff", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format file or range (in visual mode)" })
		end,
	}
}

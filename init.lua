-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
vim.g.loaded_python3_provider = 0
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
  use { "catppuccin/nvim", as = "catppuccin",
    config = function()
      require("catppuccin").setup({
        integrations = {
          mason = true,
          lsp_trouble = true,
        }
      })
      vim.cmd [[colorscheme catppuccin-mocha]] -- " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    end
  }
  use 'christoomey/vim-tmux-navigator'
  use { 'folke/neodev.nvim',
    config = function() require("neodev").setup() end
  }
  -- use 'mattn/emmet-vim'
  -- use 'christoomey/vim-tmux-navigator'
  use { 'norcalli/nvim-colorizer.lua',
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
  use 'amadeus/vim-convert-color-to'
  use 'mbbill/undotree'
  --[[ use { 'folke/tokyonight.nvim',
    config = function()
      require("tokyonight").setup({
        style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        -- transparent = true, -- Enable this to disable setting the background color
      })
    end
  } ]]
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'jchlu/lualine-time'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
    use {
      'notjedi/nvim-rooter.lua',
      config = function() require 'nvim-rooter'.setup() end
    }
  }

  use { 'mg979/vim-visual-multi' }

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }
  -- use 'prettier/vim-prettier' -- Add Prettier
  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }
  use 'j-morano/buffer_manager.nvim'
  -- use 'tpope/vim-fugitive'
  -- use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  use { 'nvim-lualine/lualine.nvim', -- Fancier statusline
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
  }
  -- use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth'      -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-live-grep-args.nvim"
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }
  -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  use "akinsho/toggleterm.nvim"
  use "wuelnerdotexe/vim-astro"
  use({
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
          -- Conform will run multiple formatters sequentially
          -- python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
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
  })
  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
-- require('indent_blankline').setup {
-- char = '┊',
-- show_trailing_blankline_indent = false,
-- }

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.cursorline = true
vim.opt.tabstop = 2

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })
end

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = { 'tailwindcss', 'tsserver', 'cssls', 'lua_ls', 'emmet_ls' }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

-- Filter out the CommonJS module message
require('lspconfig').tsserver.setup({
  on_attach = function(client, bufnr)
    require('nvim-lsp-ts-utils').setup({
      filter_out_diagnostics_by_code = { 80001 },
    })
    require('nvim-lsp-ts-utils').setup_client(client)
  end,
})

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Turn on lsp status information
require('fidget').setup()

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}

require('global.options')
require('global/keymaps')

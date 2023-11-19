-- Global keymaps not relying on any plugin

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.user_emmet_leader_key = '<C-m>'

--[[ vim.keymap.set('n', '<C-s>', '<cmd>update<cr>')
vim.keymap.set('i', '<C-s>', '<Esc><cmd>update<cr>') ]]

vim.keymap.set('n', '<leader>o', '<cmd>call append(line("."),   repeat([""], v:count1))<cr>')
vim.keymap.set('n', '<leader>O', '<cmd>call append(line(".")-1,   repeat([""], v:count1))<cr>')
vim.keymap.set('n', '<leader>tb', function()
  if vim.opt['bg']:get() == 'dark' then
    vim.opt['bg'] = 'light'
  else
    vim.opt['bg'] = 'dark'
  end
end)
vim.keymap.set('n', '<leader>tw', function()
  if vim.opt['wrap']:get() == true then
    vim.opt['wrap'] = false
  else
    vim.opt['wrap'] = true
  end
end)
vim.keymap.set('n', '<C-h>', '<C-W>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-W>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-W>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-W>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })




-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
-- vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })
-- vim.keymap.set('n', 'n', 'nzz', { silent = true })
-- vim.keymap.set('n', 'zc', 'zczz', { silent = true })
-- vim.keymap.set('n', 'zo', 'zozz', { silent = true })
-- vim.keymap.set('n', 'zR', 'zRgg', { silent = true })
-- vim.keymap.set('n', 'zM', 'zMgg', { silent = true })
-- vim.keymap.set('n', '<C-e>', '<cmd>NvimTreeToggle<cr>')
-- vim.keymap.set('n', '<C-s>', '<cmd>update<cr>')
-- vim.keymap.set('i', '<C-s>', '<Esc><cmd>update<cr>')
-- vim.keymap.set('n', '<leader>ia', 'mzgg=G`zzz')
-- vim.keymap.set('n', '<leader>cz', '<cmd>UndotreeToggle<cr>', { silent = true })
--
-- -- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--
-- -- remaps for Trouble
-- vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
--   {silent = true, noremap = true}
-- )
-- vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
--   {silent = true, noremap = true}
-- )
--

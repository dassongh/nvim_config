local keymap = vim.keymap.set
local vscode = require 'vscode'
local default_opts = { noremap = true, silent = true }

vim.notify = vscode.notify

keymap('n', '<Space>', '', default_opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ignore case on search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- WhichKey
keymap({ 'n', 'x' }, '<leader>', [[<Cmd>call VSCodeNotify('whichkey.show')<CR>]], default_opts)

-- Navigation
-- keymap({ "n", "x" }, "<C-j>", function()
--   vim.fn.VSCodeNotify("workbench.action.navigateDown")
-- end, default_opts)
-- keymap({ "n", "x" }, "<C-k>", function()
--   vim.fn.VSCodeNotify("workbench.action.navigateUp")
-- end, default_opts)
-- keymap({ "n", "x" }, "<C-h>", function()
--   vim.fn.VSCodeNotify("workbench.action.navigateLeft")
-- end, default_opts)
-- keymap({ "n", "x" }, "<C-l>", function()
--   vim.fn.VSCodeNotify("workbench.action.navigateRight")
-- end, default_opts)

-- Tab navigation
keymap('n', '<S-h>', function()
  vim.fn.VSCodeNotify 'workbench.action.previousEditor'
end, default_opts)
keymap('n', '<S-l>', function()
  vim.fn.VSCodeNotify 'workbench.action.nextEditor'
end, default_opts)

-- Code navigation and actions
keymap('n', 'gr', function()
  vim.fn.VSCodeNotify 'editor.action.goToReferences'
end, default_opts)
keymap('n', 'gI', function()
  vim.fn.VSCodeNotify 'editor.action.goToImplementation'
end, default_opts)
keymap('n', 'gs', function()
  vim.fn.VSCodeNotify 'editor.action.triggerSuggest'
end, default_opts)

-- Diagnostic
keymap('n', ']d', function()
  vim.fn.VSCodeNotify 'editor.action.marker.next'
end, default_opts)
keymap('n', '[d', function()
  vim.fn.VSCodeNotify 'editor.action.marker.prev'
end, default_opts)

-- better indent handling
keymap('v', '<', '<gv', default_opts)
keymap('v', '>', '>gv', default_opts)

-- paste preserves primal yanked piece
keymap('v', 'p', '"_dP', default_opts)

-- removes highlighting after escaping vim search
keymap('n', '<Esc><Esc>', '<Esc>:nohl<CR>', default_opts)

-- Set by default
-- vim.keymap.set("n", "gD", function() vim.fn.VSCodeNotify('editor.action.peekDefinition') end, default_opts)
-- vim.keymap.set('n', 'gd', function() vim.fn.VSCodeNotify('editor.action.revealDefinition') end, default_opts)
-- vim.keymap.set('n', 'K', function() vim.fn.VSCodeNotify('editor.action.showHover') end, default_opts)

vim.api.nvim_set_hl(0, 'YankHighlight', { bg = '#9b02be', fg = '#101116' })

-- Create autocmd for yank highlighting
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank {
      higroup = 'YankHighlight',
    }
  end,
})

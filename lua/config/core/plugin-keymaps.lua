-- NeoTree
vim.keymap.set('n', '<C-;>', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
vim.keymap.set('n', '<leader>r', ':Neotree reveal<CR>', { desc = 'Reveal current file in Neo-tree' })

-- Yazi
vim.keymap.set('n', '<leader>E', ':Yazi<CR>', { desc = 'Open Yazi at current dir' })
vim.keymap.set('n', '<leader>;e', ':Yazi cwd<CR>', { desc = 'Open Yazi at current working dir' })
vim.keymap.set('n', '<leader>;E', ':Yazi toggle<CR>', { desc = 'Open Yazi at last position' })

-- Centralized Layout
vim.keymap.set('n', '<leader>z', ':NoNeckPain<CR>', { desc = 'Zen mode' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Open Ex file view
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = 'Open vim file tree' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["*y]], { desc = 'Yank to system clipboard' })

-- Split window
vim.keymap.set('n', '<leader>-', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>|', '<C-w>v', { desc = 'Split window vertically' })

-- Write buffer
vim.keymap.set({ 'i', 'v', 'n', 's' }, '<C-s>', function()
  vim.cmd.write()
end)

vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<leader>q', ':bdelete<CR>', { desc = 'Delete current buffer' })
-- Delete buffers to left/right of current buffer
vim.keymap.set('n', '<leader>br', function()
  local current = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()
  local current_index = nil

  -- Find current buffer index
  for i, buf in ipairs(buffers) do
    if buf == current then
      current_index = i
      break
    end
  end

  -- Delete all buffers after current
  if current_index then
    for i = current_index + 1, #buffers do
      if vim.api.nvim_buf_is_loaded(buffers[i]) then
        vim.api.nvim_buf_delete(buffers[i], { force = false })
      end
    end
  end
end, { desc = 'Delete all buffers to the right' })

vim.keymap.set('n', '<leader>bl', function()
  local current = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()
  local current_index = nil

  -- Find current buffer index
  for i, buf in ipairs(buffers) do
    if buf == current then
      current_index = i
      break
    end
  end

  -- Delete all buffers before current
  if current_index then
    for i = 1, current_index - 1 do
      if vim.api.nvim_buf_is_loaded(buffers[i]) then
        vim.api.nvim_buf_delete(buffers[i], { force = false })
      end
    end
  end
end, { desc = 'Delete all buffers to the left' })

-- Delete all buffers except current
vim.keymap.set('n', '<leader>bo', function()
  local current = vim.api.nvimYazi_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
  end
end, { desc = 'Delete all buffers except current' })

-- Toggle function
vim.keymap.set('n', '<leader>tf', function()
  if vim.b.disable_autoformat or vim.g.disable_autoformat then
    vim.cmd 'FormatEnable'
    vim.notify('Autoformat enabled', vim.log.levels.INFO)
  else
    vim.cmd 'FormatDisable'
    vim.notify('Autoformat disabled', vim.log.levels.INFO)
  end
end, { desc = 'Toggle format on save' })

if vim.g.vscode then
  require 'config.vscode'
  require 'config.lazy'
else
  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })

  require 'config.core'
  require 'config.lazy'
end

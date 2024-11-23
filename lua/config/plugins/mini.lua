return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()
    require('mini.tabline').setup()

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v/%L'
    end

    require('mini.files').setup()
    vim.keymap.set('n', '<leader>e', function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end, { desc = 'Open file explorer' })
  end,
}

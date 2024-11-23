return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon add buffer' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon UI' })

    for i = 1, 5 do
      vim.keymap.set('n', string.format('<Leader>%d', i), function()
        harpoon:list():select(i)
      end, { desc = string.format('Harpoon %d', i) })
    end
  end,
}

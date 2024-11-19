return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add {
      { '<leader>c', group = 'Code' },
      -- { '<leader>d', group = '[D]ocument' },
      { '<leader>f', group = 'Find' },
      { '<leader>s', group = 'Search' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
      { '<leader>u', group = 'UI', mode = { 'n', 'v' } },
    }
  end,
}

return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require('kanagawa').setup {
        -- Add options here if you want to customize
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        theme = 'wave', -- can be "wave" (default), "dragon", "lotus"
      }
      -- Setup must be called before loading
      vim.cmd 'colorscheme kanagawa'
    end,
  },
  {
    'sainnhe/sonokai',
    lazy = false, -- Load during startup
    priority = 1000, -- Load this before other plugins
    config = function()
      -- vim.cmd 'colorscheme sonokai'
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd 'colorscheme tokyonight'
    end,
  },
}

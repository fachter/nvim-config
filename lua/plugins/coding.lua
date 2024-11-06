return {
  {
    -- https://github.com/LunarVim/bigfile.nvim
    'LunarVim/bigfile.nvim',
    event = 'BufReadPre',
    opts = {
      filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
    },
    config = function (_, opts)
      require('bigfile').setup(opts)
    end
  },
  {
    -- https://github.com/kylechui/nvim-surround
    'kylechui/nvim-surround',
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("nvim-surround").setup(opts)
    end
  },
  {
    -- https://github.com/tpope/vim-commentary
    "tpope/vim-commentary",
    event = "VeryLazy"
  }
}

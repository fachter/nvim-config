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
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = false
    }
  }
})
    end
  }
}

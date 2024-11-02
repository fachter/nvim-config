-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-tree/nvim-web-devicons",
--     "MunifTanjim/nui.nvim",
--   },
--   config = function()
--     vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')
--   end
-- }
--
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    actions = {
      open_file = {
        window_picker = {
          enable = true,
        },
      },
    },
  },
  config = function(_, opts)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.keymap.set("n", "<C-f>", ":NvimTreeOpen <CR>")
    require("nvim-tree").setup(opts)
  end,
}

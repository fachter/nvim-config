return {
  { 
    'echasnovski/mini.pairs',
    version = '*',
    config = function()
      require('mini.pairs').setup()
    end
  },
  {
    'echasnovski/mini.icons',
    version = '*',
    config = function()
      require("mini.icons").setup()
    end
  }
}

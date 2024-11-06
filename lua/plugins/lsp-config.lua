return {
  -- LSP support
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim'
    },
    'williamboman/mason-lspconfig.nvim',
    "WhoIsSethDaniel/mason-tool-installer.nvim",

  },
  config = function()
    require("mason").setup({
      ui = { border = 'rounded' }
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "cssls",
        "html",
        "lua_ls",
        "jsonls",
        "lemminx",
        -- "marksman",
        "quick_lint_js",
        "yamlls",
        "pyright",
      }
    })

    --   require("mason-tool-installer").setup({
    --     -- Install these linters, formatters, debuggers automatically
    --     ensure_installed = {
    --       "black",
    --       "debugpy",
    --       "flake8",
    --       "isort",
    --       "ruff",
    --       "mypy",
    --       "pylint",
    --     },
    --   })

    --    -- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
    --   -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
    vim.api.nvim_command("MasonToolsInstall")

    local lspconfig = require("lspconfig")
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
    end

    --   -- Call setup on each LSP server
    --   require("mason-lspconfig").setup_handlers({
    --     function(server_name)
    --       lspconfig[server_name].setup({
    --         on_attach = lsp_attach,
    --         capabilities = lsp_capabilities,
    --       })
    --     end,
    --   })

    lspconfig.pyright.setup({
      on_init = function(client)
        client.settings.python.pythonPath = require("whichpy.lsp").find_python_path(client.config.root_dir)
      end,
      -- on_attach = function(client, _bufnr)
      --   local interpreter = vim.g.python3_host_prog or "python"
      --   client.config.settings.python.pythonPath = interpreter
      --   client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
      -- end
    })

    -- Lua LSP settings
    lspconfig.lua_ls.setup({
      -- settings = {
      --   Lua = {
      --     diagnostics = {
      --       -- Get the language server to recognize the `vim` global
      --       globals = { "vim" },
      --     },
      --   },
      -- },
    })

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      return open_floating_preview(contents, syntax, opts, ...)
    end
  end
}

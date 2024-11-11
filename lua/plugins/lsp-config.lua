return {
	-- LSP support
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
		},
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = { border = "rounded" },
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
			},
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
		-- local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- local lsp_attach = function(client, bufnr)
		-- 	-- Create your keybindings here...
		-- end

		--   -- Call setup on each LSP server
		--   require("mason-lspconfig").setup_handlers({
		--     function(server_name)
		--       lspconfig[server_name].setup({
		--         on_attach = lsp_attach,
		--         capabilities = lsp_capabilities,
		--       })
		--     end,
		--   })

		-- lspconfig.pyright.setup({
		-- 	on_init = function(client)
		-- 		-- client.settings.python.pythonPath = require("whichpy.lsp").find_python_path(client.config.root_dir)
		-- 		-- client.settings.python.pythonPath = require("venv-selector").get_active_venv()
		-- 	end,
		-- 	-- on_attach = function(client, _bufnr)
		-- 	--   local interpreter = vim.g.python3_host_prog or "python"
		-- 	--   client.config.settings.python.pythonPath = interpreter
		-- 	--   client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		-- 	-- end
		-- })

		-- Lua LSP settings
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

		-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
		local open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or "rounded" -- Set border to rounded
			return open_floating_preview(contents, syntax, opts, ...)
		end
		-- ~/.config/nvim/after/plugin/pyright.lua

		require("notify")("Setup starts", "info", {
			title = "Pyright!",
		})
		local util = require("lspconfig.util")

		local root_files = {
			"pyproject.toml",
			"setup.py",
			"setup.cfg",
			"requirements.txt",
			"Pipfile",
			"pyrightconfig.json",
			".git",
		}

		local function organize_imports()
			local params = {
				command = "pyright.organizeimports",
				arguments = { vim.uri_from_bufnr(0) },
			}

			local clients = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })
			for _, client in ipairs(clients) do
				if client.name == "pyright" then
					client.request("workspace/executeCommand", params, nil, 0)
				end
			end
		end

		local function set_python_path(path)
			local clients = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })
			for _, client in ipairs(clients) do
				if client.name == "pyright" then
					if client.config.settings then
						client.config.settings.python =
							vim.tbl_deep_extend("force", client.config.settings.python, { pythonPath = path })
					else
						client.config.settings = {
							python = { pythonPath = path },
						}
					end
					client.notify("workspace/didChangeConfiguration", { settings = nil })
				end
			end
		end

		require("lspconfig").pyright.setup({
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			root_dir = function(fname)
				return util.root_pattern(unpack(root_files))(fname)
			end,
			single_file_support = true,
			settings = {
				pyright = { autoImportCompletion = true },
				python = {
					analysis = {
						autoImportCompletion = true,
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace",
					},
				},
			},
			commands = {
				PyrightOrganizeImports = {
					organize_imports,
					description = "Organize Imports",
				},
				PyrightSetPythonPath = {
					function(params)
						set_python_path(params.args[1])
					end,
					description = "Reconfigure pyright with the provided python path",
					nargs = 1,
					complete = "file",
				},
			},
		})
	end,
}

return {
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = false,
		branch = "regexp", -- This is the regexp branch, use this for the new version
		config = function()
			local venv_selector = require("venv-selector")
			local function on_venv_activate()
				require("notify")(require("venv-selector").python(), "info", {
					title = "Python Environment selected",
				})
			end
			venv_selector.setup({
				pyenv_path = "/Users/felixachter/.pyenv/versions",
				settings = {
					options = {
						on_venv_activate_callback = on_venv_activate,
					},
				},
			})
			local lspconfig = require("lspconfig")
			-- local lsp_capabilities = require("cmp_nvim_lsp")
			lspconfig.pyright.setup({
				on_init = function(client)
					client.settings.python.pythonPath = require("venv-selector").python()
				end,
			})
		end,
		keys = {
			-- Keymap to open VenvSelector to pick a venv.
			{ "<leader>vs", "<cmd>VenvSelect<cr>" },
			-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
			{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		main = "dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-python").setup()
		end,
	},
}

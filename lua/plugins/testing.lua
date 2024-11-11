local testing = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}

local python_testing = {
	"nvim-neotest/neotest-python",
	dependencies = {
		"nvim-neotest/neotest",
		"mfussenegger/nvim-dap",
	},
	ft = { "python" },
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					args = { "--log-level", "DEBUG" },
					runner = "pytest",
				}),
			},
		})
	end,
	keys = function()
		local dap_python = require("dap-python")
		return {
			{ "<leader>dm", dap_python.test_method, desc = "[NeoTest][Python] debug method", ft = "python" },
			{ "<leader>dc", dap_python.test_class, desc = "[NeoTest][Python] debug class", ft = "python" },
		}
	end,
}

return {
	testing,
	python_testing,
}

return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("dap-python").setup("python3")
		-- require("dap-python").resolve_python = function()
		--   return "python"
		--   -- local handle = io.popen("basename $(pwd)")
		--   -- if handle == nil then
		--   --   return "python"
		--   -- end
		--   -- local folder_name = handle:read("*a"):gsub("%s+", "")
		--   -- handle:close()

		--   -- local pyenv_path = "~/.pyenv/versions/" .. folder_name .. "/bin/python"

		--   -- local file = io.open(pyenv_path, "r")
		--   -- if file then
		--   --   file:close()
		--   --   return pyenv_path
		--   -- else
		--   --   return "python"
		--   -- end
		-- end
	end,
}

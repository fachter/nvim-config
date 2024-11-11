local keymap = vim.keymap
-- Telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- NeoTree
keymap.set("n", "<leader>ee", ":Neotree toggle<CR>")
keymap.set("n", "<leader>ef", ":Neotree filesystem reveal left<CR>")
keymap.set("n", "<leader>eg", ":Neotree float git_status<CR>")

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)
keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end)
keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
keymap.set("n", "<leader>h1", function()
	harpoon:list().select(1)
end)
keymap.set("n", "<leader>h2", function()
	harpoon:list().select(2)
end)
keymap.set("n", "<leader>h3", function()
	harpoon:list().select(3)
end)
keymap.set("n", "<leader>h4", function()
	harpoon:list().select(4)
end)
keymap.set("n", "<leader>h5", function()
	harpoon:list().select(5)
end)
keymap.set("n", "<leader>h6", function()
	harpoon:list().select(6)
end)
keymap.set("n", "<leader>h7", function()
	harpoon:list().select(7)
end)
keymap.set("n", "<leader>h8", function()
	harpoon:list().select(8)
end)
keymap.set("n", "<leader>h9", function()
	harpoon:list().select(9)
end)

-- Persistence
-- load the session for the current directory
keymap.set("n", "<leader>qs", function()
	require("persistence").load()
end)
-- select a session to load
keymap.set("n", "<leader>qS", function()
	require("persistence").select()
end)
-- load the last session
keymap.set("n", "<leader>ql", function()
	require("persistence").load({ last = true })
end)
-- stop Persistence => session won't be saved on exit
keymap.set("n", "<leader>qd", function()
	require("persistence").stop()
end)

-- Save File
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
keymap.set({ "n", "v" }, "<leader>y", "+y")

-- LSP
keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
keymap.set("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")

-- Refactoring
keymap.set("x", "<leader>re", ":Refactor extract ")
keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
keymap.set("x", "<leader>rv", ":Refactor extract_var ")
keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
keymap.set("n", "<leader>rI", ":Refactor inline_func")
keymap.set("n", "<leader>rb", ":Refactor extract_block")
keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

-- Testing
keymap.set("n", "<leader>to", ":Neotest output<CR>")
keymap.set("n", "<leader>ts", ":Neotest summary<CR>")
keymap.set("n", "<leader>tf", ":Neotest run file<CR>")
keymap.set("n", "<leader>tl", ":Neotest run last<CR>")
keymap.set("n", "<leader>tp", ":Neotest output-panel<CR>")
-- keymap.set("n", "<leader>ta", ":Neotest summary<CR><C-W>lggjr:Neotest output-panel<CR>")

-- Copy / Paste

keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+yg_')
keymap.set("n", "<leader>y", '"+y')
keymap.set("n", "<leader>yy", '"+yy')

-- Paste
keymap.set("n", "<leader>p", '"+p')
keymap.set("n", "<leader>P", '"+P')
keymap.set("v", "<leader>p", '"+p')
keymap.set("v", "<leader>P", '"+P')

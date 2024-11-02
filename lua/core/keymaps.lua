local keymap = vim.keymap

-- General Keymaps
keymap.set("n", "<leader>wq", ":wq<CR>")
keymap.set("n", "<leader>qq", ":q!<CR>")
keymap.set("n", "<leader>ww", ":w<CR>")
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") --open URL under cursor

-- Window Management
keymap.set("n", "<leader>sv", "<C-w>v")     -- split split vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split split horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close split windows
keymap.set("n", "<leader>sj", "<C-w>-")     -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+")     -- make split window height taller
keymap.set("n", "<leader>sl", "<C-w>>5")    -- make split window width bigger
keymap.set("n", "<leader>sh", "<C-w><5")    -- make split window width smaller

-- Tab Management
keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     -- previous tab

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")   -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>")    -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- -- Telescope
local telescope_builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})
keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})
keymap.set("n", "<leader>fs", telescope_builtin.current_buffer_fuzzy_find, {})
keymap.set("n", "<leader>fo", telescope_builtin.lsp_document_symbols, {})
keymap.set("n", "<leader>fi", telescope_builtin.lsp_incoming_calls, {})
keymap.set("n", "<leader>fm", function()
  telescope_builtin.treesitter({ default_text = ":method:" })
end)

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
keymap.set("n", "<leader>h1", function()
  require("harpoon.ui").nav_file(1)
end)
keymap.set("n", "<leader>h2", function()
  require("harpoon.ui").nav_file(2)
end)
keymap.set("n", "<leader>h3", function()
  require("harpoon.ui").nav_file(3)
end)
keymap.set("n", "<leader>h4", function()
  require("harpoon.ui").nav_file(4)
end)
keymap.set("n", "<leader>h5", function()
  require("harpoon.ui").nav_file(5)
end)
keymap.set("n", "<leader>h6", function()
  require("harpoon.ui").nav_file(6)
end)
keymap.set("n", "<leader>h7", function()
  require("harpoon.ui").nav_file(7)
end)
keymap.set("n", "<leader>h8", function()
  require("harpoon.ui").nav_file(8)
end)
keymap.set("n", "<leader>h9", function()
  require("harpoon.ui").nav_file(9)
end)

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

-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
keymap.set("n", "<leader>go", function()
  if vim.bo.filetype == "python" then
    vim.api.nvim_command("PyrightOrganizeImports")
  end
end)

keymap.set("n", "<leader>tc", function()
  if vim.bo.filetype == "python" then
    require("dap-python").test_class()
  end
end)

keymap.set("n", "<leader>tm", function()
  if vim.bo.filetype == "python" then
    require("dap-python").test_method()
  end
end)

-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", "<leader>dd", function()
  require("dap").disconnect()
  require("dapui").close()
end)
keymap.set("n", "<leader>dt", function()
  require("dap").terminate()
  require("dapui").close()
end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", "<leader>di", function()
  require("dap.ui.widgets").hover()
end)
keymap.set("n", "<leader>d?", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
keymap.set("n", "<leader>de", function()
  require("telescope.builtin").diagnostics({ default_text = ":E:" })
end)

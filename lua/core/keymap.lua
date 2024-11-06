local keymap = vim.keymap
-- Telescope
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- NeoTree
keymap.set("n", "<leader>ee", ":Neotree toggle<CR>")
keymap.set("n", "<leader>ef", ":Neotree filesystem reveal left<CR>")
keymap.set("n", "<leader>eg", ":Neotree float git_status<CR>")

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
keymap.set("n", "<leader>h1", function() harpoon:list().select(1) end)
keymap.set("n", "<leader>h2", function() harpoon:list().select(2) end)
keymap.set("n", "<leader>h3", function() harpoon:list().select(3) end)
keymap.set("n", "<leader>h4", function() harpoon:list().select(4) end)
keymap.set("n", "<leader>h5", function() harpoon:list().select(5) end)
keymap.set("n", "<leader>h6", function() harpoon:list().select(6) end)
keymap.set("n", "<leader>h7", function() harpoon:list().select(7) end)
keymap.set("n", "<leader>h8", function() harpoon:list().select(8) end)
keymap.set("n", "<leader>h9", function() harpoon:list().select(9) end)

-- Persistence
-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)
-- select a session to load
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)
-- load the last session
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)
-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)


--


-- Markdown specific settings
vim.opt.wrap = true        -- Wrap text
vim.opt.breakindent = true -- Match indent on line breakindent
vim.opt.linebreak = true   -- Line break on whole words

-- Allow j/k when navigation wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Spell check
vim.opt.spelllang = "en_uk"
vim.opt.spell = true

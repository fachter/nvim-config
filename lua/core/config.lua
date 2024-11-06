vim.g.mapleader = " "

local opt = vim.opt

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.expandtab = true
vim.bo.softtabstop = 2

-- Search Settings
opt.ignorecase = true
opt.smartcase = true


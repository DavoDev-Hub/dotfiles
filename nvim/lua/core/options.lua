-- lua/core/options.lua

local opt = vim.opt
local g = vim.g

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Disable swapfile
opt.swapfile = false

-- Faster scrolling
opt.updatetime = 300

-- Better completion menu
opt.completeopt = { "menuone", "noselect" }

-- Set leader key
g.mapleader = " "




-- lua/core/keymaps.lua

vim.g.mapleader = " "
local keymap = vim.keymap

-- Shorten function name
local opts = { noremap = true, silent = true }


-- General keymaps
keymap.set("i", "jk", "<Esc>", opts)             -- Exit insert mode with jk
keymap.set("n", "<leader>w", ":w<CR>", opts)     -- Save file
keymap.set("n", "<leader>q", ":q<CR>", opts)     -- Quit
keymap.set("n", "<leader>nh", ":nohl<CR>", opts) -- Clear highlights
keymap.set("n", "x", '"_x', opts)                -- Do not copy deleted character to register
keymap.set("n", "<leader>+", "<C-a>", opts)      -- Increment number
keymap.set("n", "<leader>-", "<C-x>", opts)      -- Decrement number

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", opts)     -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts)     -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", opts)     -- Make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>", opts) -- Close current split window

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", opts)   -- Open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- Close current tab
-- keymap.set("n", "<leader>pv", ":tabn<CR>", opts)     -- Go to next tab
-- keymap.set("n", "<leader>nv", ":tabp<CR>", opts)     -- Go to previous tab
keymap.set("n", "<leader>pv", ":bn<CR>", opts) -- Ir al siguiente buffer
keymap.set("n", "<leader>nv", ":bp<CR>", opts) -- Ir al buffer anterior

--
--
-- Plugin-related mappings (we’ll activate them later)
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)


-- Flash jump atajo intuitivo
keymap.set("n", "<leader>j", function()
    require("flash").jump()
end, { desc = "Flash jump", noremap = true, silent = true })

-- Abrir LazyGit desde Neovim

keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", opts)



-- Copy to system clipboard using visual mode
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })

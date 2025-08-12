-- lua/core/plugins.lua

-- Bootstrap lazy.nvim if it's not installed (redundant with manual install, but safe)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
    -- UI
    "nvim-lualine/lualine.nvim",   -- Statusline
    "nvim-tree/nvim-web-devicons", -- Icons

    -- THEME
    { "RRethy/nvim-base16" },


    -- Fuzzy finder
    { "nvim-telescope/telescope.nvim",   dependencies = { "nvim-lua/plenary.nvim" } },

    -- Syntax highlight
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- LSP
    "neovim/nvim-lspconfig",

    -- Comments
    "numToStr/Comment.nvim",

    -- Git
    "lewis6991/gitsigns.nvim",

    -- LSP support
    { "mason.org/mason.nvim" },
    { "mason.org/mason-lspconfig.nvim" },
    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },

    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.alpha")
        end,
    },

    {
        "stevearc/conform.nvim",
        config = function()
            require("plugins.conform")
        end,
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash jump",
            },
            {
                "S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "HiPhish/nvim-ts-rainbow2",
    },

    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        cmd = "LazyGit",
    },
    {
        "ojroques/nvim-osc52",
        config = function()
            require("osc52").setup()
            vim.api.nvim_set_option("clipboard", "unnamed")
            vim.keymap.set("v", "<leader>c", require("osc52").copy_visual, { desc = "Copy with OSC52" })
        end,
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "olrtg/nvim-emmet",
        config = function()
            vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
        end,
    },
})


-- Load plugin configs
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.comment")
require("plugins.theme")
require("plugins.harpoon")

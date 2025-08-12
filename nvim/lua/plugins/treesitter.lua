-- Treesitter configuration with rainbow parentheses
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua", "javascript", "typescript", "html", "css",
        "python", "bash", "json", "yaml", "markdown"
    },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
    },

    -- rainbow = {
    --     enable = true,
    --     query = "rainbow-parens",
    --     strategy = require("ts-rainbow").strategy.global,
    --     extended_mode = true,
    --     max_file_lines = nil,
    -- },
})

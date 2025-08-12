-- lua/plugins/conform.lua

require("conform").setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true, -- Use LSP formatting if no formatter is available
  },
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    sh = { "shfmt" },
  },
})


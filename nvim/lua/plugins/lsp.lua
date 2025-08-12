-- lua/plugins/lsp.lua

-- Setup Mason
require("mason").setup()

-- Setup Mason-LSPConfig
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "html",
        "cssls",
        "bashls",
        "tsp_server",
        "tailwindcss"
    },
})

-- Setup LSP servers
local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
    local bufmap = function(mode, lhs, rhs)
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
    end

    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
end

-- Manually configure servers
local servers = { "lua_ls", "pyright", "ts_ls", "html", "cssls", "bashls", "ts_ls" }

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
    })
end

-- Automatically show diagnostics in a floating window on CursorHold
vim.diagnostic.config({
    virtual_text = false, -- disable inline text
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.o.updatetime = 250

vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])


local signs = { Error = "✘", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

# 2025 - Neovim
Made by DavoDev

# General Setup
- Operating System: Debian 12 (Bookworm) with GNOME
- Terminal: Kitty
- Terminal Theme: base16-black-metal-gorgoroth
- Font: Iosevka
- Editor: Neovim with a fully modular Lua configuration
- Plugin Manager: lazy.nvim (used to manage all plugins efficiently)

# **Configuration Structure:**
- ~/.config/nvim/
    - init.lua → The entry point of your config
    - lua/core/ → Contains editor settings (options, keymaps, etc.)
    - lua/plugins/ → Contains plugin configurations, one file per plugin or group

# LSP Setup (Language Server Protocol)
Language Server Protocol is configured to provide real-time feedback like:

- Syntax errors
- Warnings
- Type checks
- Code actions
- Hover documentation
- Autocompletion (via `nvim-cmp`)
# **Main components used:**
- `mason.nvim`: Installs and manages LSP servers.
- `mason-lspconfig.nvim`: Automatically bridges Mason with `nvim-lspconfig`.
- `nvim-lspconfig`: Configures and attaches LSP servers to relevant filetypes.

# **Installed LSP servers:**
- `pyright` for Python
- Others like `tsserver`, `lua_ls` can be added as needed.

# Plugins List
- **lazy.nvim**  
    Handles plugin management and lazy-loading. Central to your setup.
- **alpha.nvim**  
    Displays a custom ASCII welcome screen on startup.
- **nvim-treesitter**  
    Provides better syntax highlighting, indentation, and language-aware features.
- **nvim-ts-rainbow2**  
    Adds rainbow-colored parentheses and brackets for better code readability.
- **mason.nvim**  
    Manages LSP servers, formatters, and linters in a user-friendly interface.
- **mason-lspconfig.nvim**  
    Bridges Mason with nvim-lspconfig to auto-install language servers.
- **nvim-lspconfig**  
    Configures built-in LSP client for different languages (e.g., Pyright for Python).
- **nvim-cmp**  
    Autocompletion engine, integrates with LSP and other sources (configured later).
- **conform.nvim**  
    Automatically formats your code based on filetype. Works with tools like `black`.
- **which-key.nvim**  
    Displays available keybindings in a popup. Helps learn custom shortcuts.
- **Comment.nvim**  
    Enables fast line/block commenting using keybindings.
- **gitsigns.nvim**  
    Shows Git changes (additions, deletions, modifications) in the gutter.



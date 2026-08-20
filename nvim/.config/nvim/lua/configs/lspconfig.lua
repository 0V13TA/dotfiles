-- Load NvChad default LSP settings/diagnostics/capabilities
require("nvchad.configs.lspconfig").defaults()

-- 1. Standard web/JS servers
local servers = { "html", "cssls", "jsonls", "ts_ls", "gopls" }
vim.lsp.enable(servers)

-- 2. Clangd (C / C++)
vim.lsp.config("clangd", {
  cmd = { "/usr/bin/clangd" },
})
vim.lsp.enable("clangd")

-- 3. Rust Analyzer
vim.lsp.config("rust_analyzer", {})
vim.lsp.enable("rust_analyzer")

-- 4. Lua Language Server (Hyprland stubs integration)
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = {
          "/usr/share/hypr/stubs",
        },
      },
    },
  },
})
vim.lsp.enable("lua_ls")

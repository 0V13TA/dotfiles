-- Load NvChad default LSP settings/diagnostics/capabilities
require("nvchad.configs.lspconfig").defaults()

-- Standard web/JS servers
local servers = { "html", "cssls", "jsonls", "ts_ls", "gopls", "svelte" }
vim.lsp.enable(servers)

-- Clangd (C / C++)
vim.lsp.config("clangd", {
  cmd = { "/usr/bin/clangd" },
})
vim.lsp.enable("clangd")

-- Rust Analyzer
vim.lsp.config("rust_analyzer", {})
vim.lsp.enable("rust_analyzer")

-- Odin Language Server
vim.lsp.config("ols", {})
vim.lsp.enable("ols")

-- GLSLLS
vim.lsp.config("glslls", {})
vim.lsp.enable("glslls")
vim.filetype.add({
  extension = {
    vert = 'glsl',
    frag = 'glsl',
    comp = 'glsl',
    vs   = 'glsl', -- Raylib vertex shader
    fs   = 'glsl', -- Raylib fragment shader
    geom = 'glsl',
    tesc = 'glsl',
    tese = 'glsl',
  }
})

-- Lua Language Server (Hyprland stubs integration)
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

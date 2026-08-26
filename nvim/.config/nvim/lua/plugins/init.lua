return {
  -- Corrected repository name:
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local colors_path = vim.fn.expand("~/.cache/wallust/base16.lua")
      
      -- Only apply if Wallust has generated the palette
      if vim.uv.fs_stat(colors_path) then
        local ok, colors = pcall(dofile, colors_path)
        if ok and type(colors) == "table" then
          require("base16-colorscheme").setup(colors)

          -- Optional: Restore transparency if desired
          vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
          
          -- Remove the solid background from the top buffer/tab line
          vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "TbLineFill", { bg = "NONE" })
          
        end
      end
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
}

---@type ChadrcConfig
local M = {}

-- Safely attempt to load Wallust colors
local colors_path = vim.fn.expand "~/.cache/wallust/colors.lua"
local wallust = {}

if vim.uv.fs_stat(colors_path) then
  local ok, colors = pcall(dofile, colors_path)
  if ok and type(colors) == "table" then
    wallust = colors
  end
end

M.base46 = {
  theme = "bearded-arc",
  transparency = true,
  hl_override = {
    -- Use Wallust foreground/accent colors where desired
    Comment = {
      fg = wallust.base03 or "#8da3c0",
      italic = true,
    },
    ["@comment"] = {
      fg = wallust.base03 or "#8da3c0",
      italic = true,
    },
    Normal = {
      fg = wallust.base05,
      bg = "NONE", -- Retain transparency
    },
    Function = {
      fg = wallust.base0D,
    },
    Keyword = {
      fg = wallust.base0E,
    },
    String = {
      fg = wallust.base0B,
    },
    Variable = {
      fg = wallust.base08,
    },
  },
}

M.ui = {
  tabufline = {
    lazyload = false,
  },
}

return M

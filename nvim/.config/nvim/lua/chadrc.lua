---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "bearded-arc",
  transparency = true,
  hl_override = {
    Comment = {
      fg = "#8da3c0", -- Bright slate / high-contrast muted blue
      italic = true,
    },
    ["@comment"] = {
      fg = "#8da3c0",
      italic = true,
    },
  },
}

M.ui = {
  tabufline = {
    lazyload = false,
  },
}

return M

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_light",
  theme_toggle = { "ayu_light", "onedark" },

  hl_override = {
    Comment = { italic = true },
  },

  statusline = {
    theme = "vscode_colored",
  },
}

return M

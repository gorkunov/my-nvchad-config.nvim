require "nvchad.options"

local opt = vim.opt
local g = vim.g
local env = vim.env

env.PATH = env.HOME .. "/.local/share/mise/shims:" .. env.PATH

g.neovide_floating_shadow = false
g.experimental_layer_grouping = true

opt.guifont = "JetBrainsMono Nerd Font:h11"
opt.linespace = 6

opt.eol = false
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.wrap = false
opt.colorcolumn = "120"

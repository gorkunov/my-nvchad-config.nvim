---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<ScrollWheelLeft>"] = { "<nop>", "disable scroll left" },
    ["<ScrollWheelRight>"] = { "<nop>", "disable scroll right" },
    ["qq"] = { "$a,<ESC>", "add comma end of line" },
    ["<D-s>"] = { ":w <CR>", "save file" },
    ["<D-a>"] = { "ggVG", "select all" },
    ["<D-v>"] = { "i<c-r>*", "paste" },
    ["\\p"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<S-h>"] = {
      function()
        require("treesj").toggle()
      end,
      "split-join node",
    },
    ["<D-t>"] = {
      function()
        require("trouble").toggle()
      end,
    },
    ["<D-r>"] = {
      function()
        require("trouble").refresh()
      end,
    },
  },
  v = {
    ["<D-v>"] = { "p", "paste" },
    ["<D-c>"] = { "y", "copy" },
    [">"] = { ">gv", "indent" },
    ["<S-Up>"] = {
      function()
        require("mini.move").move_selection "up"
      end,
      "move selection up",
    },
    ["<S-Down>"] = {
      function()
        require("mini.move").move_selection "down"
      end,
      "move selection down",
    },
    ["<S-Left>"] = {
      function()
        require("mini.move").move_selection "left"
      end,
      "move selection left",
    },
    ["<S-Right>"] = {
      function()
        require("mini.move").move_selection "right"
      end,
      "move selection right",
    },
  },
  i = {
    ["<D-s>"] = { "<ESC>:w <CR>", "save file" },
    ["<D-v>"] = { "<C-r>*", "paste" },
  },
}

M.tabufline = {
  plugin = true,

  n = {

    -- close buffer + hide terminal buffer
    ["<D-w>"] = {
      function()
        vim.api.nvim_command "write"
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["§"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>§"] = { "<cmd> Telescope find_files search_dirs=~/Documents/shorts <CR>", "Find in shorts" },
    ["±"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<C-§>"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["/"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["gf"] = { "<cmd> Telescope grep_string <CR>", "Finc cword" },
  },
}

-- more keybinds!

return M

---@type MappingsTable
local M = {}

local H = {}

H.select_buf = function(idx)
  local bufs = require("nvchad.tabufline").bufilter() or {}

  if idx > #bufs then
    H.select_buf(idx - 1)
    return
  end
  vim.cmd("b" .. bufs[idx])
end

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
    ["<leader>w"] = {
      function()
        require("hop").hint_words {
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
        }
      end,
    },
    ["f"] = {
      function()
        require("hop").hint_words {
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
        }
      end,
    },
    ["F"] = {
      function()
        require("hop").hint_words {
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
        }
      end,
    },
    ["-"] = {
      function()
        local r, c = unpack(vim.api.nvim_win_get_cursor(0))
        local r1, c1 = unpack(vim.fn.searchpos("'", "bn"))
        local r2, c2 = unpack(vim.fn.searchpos('"', "bn"))

        if r == r1 and (r ~= r2 or c1 > c2) then
          vim.cmd 'normal macsq"'
        elseif r == r2 and (r ~= r1 or c2 > c1) then
          vim.cmd "normal csq'"
        else
          print "No matching quotes"
        end
        vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { r, c })
      end,
    },
  },
  v = {
    ["<ScrollWheelLeft>"] = { "<nop>", "disable scroll left" },
    ["<ScrollWheelRight>"] = { "<nop>", "disable scroll right" },
    ["<D-v>"] = { "P", "paste" },
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
  c = {
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

for i = 1, 9 do
  M.tabufline.n["<D-" .. i .. ">"] = {
    function()
      H.select_buf(i)
    end,
    "select buf " .. i,
  }
end

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

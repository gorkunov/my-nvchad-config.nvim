require "nvchad.mappings"

local H = {}

H.select_buf = function(idx)
  local bufs = vim.t.bufs

  if idx > #bufs then
    H.select_buf(idx - 1)
    return
  end
  vim.cmd("b" .. bufs[idx])
end

local map = vim.keymap.set
map("n", "<ScrollWheelLeft>", "<nop>")
map("n", "<ScrollWheelRight>", "<nop>")
map("v", "<ScrollWheelLeft>", "<nop>")
map("v", "<ScrollWheelRight>", "<nop>")

-- normal
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "qq", ":$a,<ESC>", { desc = "Add comma end of line" })
map("n", "<D-s>", ":w <CR>", { desc = "Save file" })
map("n", "<D-a>", "ggVG", { desc = "Select all" })
map("n", "<D-v>", "i<c-r>*", { desc = "Paste" })
map("n", "\\p", ":NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })

map("n", "<D-w>", function()
  vim.api.nvim_command "write"
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })

for i = 1, 9 do
  map("n", "<D-" .. i .. ">",
    function()
      H.select_buf(i)
    end, 
    { desc = "Select buf " .. i })
end

map("n", "<D-t>", function()
  require("trouble").toggle()
end)

map("n", "<D-r>", function()
  require("trouble").refresh()
end)

map("n", "<leader>w", function()
  require("hop").hint_words {
    direction = require("hop.hint").HintDirection.AFTER_CURSOR,
 }
end)

map("n", "f", function()
  require("hop").hint_words {
    direction = require("hop.hint").HintDirection.AFTER_CURSOR,
  }
end)

map("n", "F", function()
  require("hop").hint_words {
    direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
  }
end)

map("n", "-", function()
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
end, { desc = "Toggle nearest quotes" })

-- telescope
map("n", "§", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>§", "<cmd>Telescope find_files search_dirs=~/Documents/shorts<CR>", { desc = "Find in shorts" })
map("n", "<D-§>", "<cmd>Telescope oldfiles<CR>", { desc = "Find in recent files" })
map("n", "<D-/>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in current buffer" })
map("n", "gf", "<cmd>Telescope grep_string<CR>", { desc = "Find cword" })

-- visual
map("v", "<D-s>", "<ESC>:w <CR>", { desc = "Save file" })
map("v", "<D-v>", "P", { desc = "Paste" })
map("v", "<D-c>", "y", { desc = "Copy" })
map("v", ">", ">gv", { desc = "Indent" })

map("v", "<S-Up>", function()
  require("mini.move").move_selection "up"
end, { desc = "Move selection up" })

map("v", "<S-Down>", function()
  require("mini.move").move_selection "down"
end, { desc = "Move selection down" })

map("v", "<S-Left>", function()
  require("mini.move").move_selection "left"
end, { desc = "Move selection left" })

map("v", "<S-Right>", function()
  require("mini.move").move_selection "right"
end, { desc = "Move selection right" })

-- insert
map("i", "<D-s>", "<ESC>:w <CR>", { desc = "Save file" })
map("i", "<D-v>", "<C-r>*", { desc = "Paste" })

-- command
map("c", "<D-v>", "<C-r>*", { desc = "Paste" })

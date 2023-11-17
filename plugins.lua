local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    dir = "~/Projects/smartpairs.vim",
    event = "BufEnter",
  },

  {
    dir = "~/Projects/nvim-treesitter-expand-region",
    event = "BufEnter",
  },

  {
    "kylechui/nvim-surround",
    event = "BufEnter",
    opts = {},
  },

  {
    "smoka7/hop.nvim",
    event = "BufEnter",
    opts = {},
  },

  {
    "f-person/git-blame.nvim",
    event = "BufEnter",
  },

  {
    "yamatsum/nvim-cursorline",
    event = "BufEnter",
    opts = {
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
    },
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {},
  },

  {
    "echasnovski/mini.align",
    event = "BufEnter",
    opts = {},
  },

  {
    "echasnovski/mini.move",
    event = "BufEnter",
    opts = {},
  },

  -- Override plugin definition options
  --
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "folke/trouble.nvim" },
    opts = function()
      local default = require "plugins.configs.telescope"
      local custom = require "custom.configs.telescope"
      return vim.tbl_deep_extend("force", default, custom)
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- cmp sources plugins
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = overrides.cmp,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

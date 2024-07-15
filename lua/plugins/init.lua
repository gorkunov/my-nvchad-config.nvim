return {
  {
    dir = "~/Projects/smartpairs.vim",
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
    "supermaven-inc/supermaven-nvim",
    event = "BufEnter",
    opts = {
      ignore_filetypes = { gitcommit = true, gitrebase = true, gitstatus = true },
    },
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

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    cmd = { "ConformInfo" },
    config = function()
      require "configs.conform"
    end,
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },

  -- Override plugin definition options
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "folke/trouble.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
    },
    opts = function()
      local config = require "nvchad.configs.telescope"
      local custom = require "configs.telescope"
      return vim.tbl_deep_extend("force", config, custom)
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- cmp sources plugins
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function()
      return require "configs.cmp"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "elixir",
      },
      indent = {
        enable = true,
      },
      expand_region = {
        enable = true,
        keymaps = {
          expand_region = "z",
          collapse_region = "Z",
        },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = { char = "┆" },
      scope = { show_start = false, show_end = false },
    },
  },
}

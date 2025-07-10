local slow_format_filetypes = {}
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    graphql = { "typos", "prettier" },
    typescript = { "typos", "prettier" },
    typescriptreact = { "typos", "prettier" },
    javascript = { "typos", "prettier" },
    elixir = { "typos", "mix" },
    sql = { "pg_format" },
    php = { "php_cs_fixer" },
    toml = { "taplo" },
    markdown = { "typos", "mdformat" },
    json = { "jq" },
    python = { "ruff_format" },
    ["_"] = { "trim_whitespace", "trim_newlines" },
  },

  format_on_save = function(bufnr)
    if slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    local function on_format(err)
      if err and err:match "timeout$" then
        slow_format_filetypes[vim.bo[bufnr].filetype] = true
      end
    end

    return { timeout_ms = 200, lsp_fallback = true }, on_format
  end,

  format_after_save = function(bufnr)
    if not slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    return { lsp_fallback = true }
  end,
}

require("conform").setup(options)

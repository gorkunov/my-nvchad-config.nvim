local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    elixir = { "mix" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    sql = { "pg_format" },
    php = { "php_cs_fixer" },
    yaml = { "yamlfix" },
  },

  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)

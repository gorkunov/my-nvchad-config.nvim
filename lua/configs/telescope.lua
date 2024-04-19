local trouble = require "trouble.providers.telescope"

return {
  mappings = {
    i = { ["<D-t>"] = trouble.open_with_trouble },
    n = { ["<D-t>"] = trouble.open_with_trouble },
  },
  extensions_list = { "themes", "fzy_native" },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

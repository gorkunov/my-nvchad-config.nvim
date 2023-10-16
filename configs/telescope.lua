local trouble = require "trouble.providers.telescope"

return {
  defaults = {
    mappings = {
      i = { ["<D-t>"] = trouble.open_with_trouble },
      n = { ["<D-t>"] = trouble.open_with_trouble },
    },
  },
}

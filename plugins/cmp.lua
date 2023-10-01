return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  },
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, config)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    config.mapping["<CR>"] = cmp.mapping.confirm({ select = false })
    config.mapping["<C-y>"] = cmp.mapping.confirm { select = true, behavior = cmp.ConfirmBehavior.Insert }
    config.mapping["<Tab>"] = nil
    config.mapping["<C-f>"] = cmp.mapping(function(fallback)
      if luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" })
    config.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })


    -- formatting
    local format_kinds = config.formatting.format
    config.formatting.format = function(entry, item)
      format_kinds(entry, item)
      return require("tailwindcss-colorizer-cmp").formatter(entry, item)
    end

    -- return the new table to be used
    return config
  end
}

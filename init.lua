local config = {

  -- colorscheme = "tokyonight",

  -- Configure plugins
  plugins = {
    -- Add plugins, the parcker syntax without the "use"
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },
      -- You can also add new plugins here as well:
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
        -- {
        --   "folke/tokyonight.nvim",
        -- },
      -- {
      --   "navarasu/onedark.nvim",
      --   config = require("onedark").load()
      -- }

    },
    -- All other entries override the setup() call for default plugins
    -- treesitter = {
    --   ensure_installed = { "lua", "elixir" },
    -- },
    -- ["nvim-lsp-installer"] = {
    --   ensure_installed = { "sumneko_lua", "elixirls" },
    -- },
  },

  -- options = {
  --   g = {
  --     tokyonight_style = "night",
  --   }
  -- },
}

-- vim.g.tokyonight_style = "night"
vim.api.nvim_command("set clipboard+=unnamedplus")
return config

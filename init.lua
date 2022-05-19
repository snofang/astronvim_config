local config = {

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
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

    },
    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = { "lua", "elixir" },
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua", "elixirls" },
    },
  },
}

return config

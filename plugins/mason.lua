-- use mason-lspconfig to configure LSP installations
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "lua_ls",
        -- "elixirls",
        "jsonls",
        -- "ltex", --Latex/Markdown
        "yamlls",
        "sqlls",
        "erlangls",
        "html",
        "bashls",
        "tsserver",
        "ansiblels",
        -- "quick_lint_js"
        "tailwindcss"
      },
    },
  },
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "stylua",
  --       "black",
  --       "prettierd",
  --     },
  --   },
  --   config = function(_, opts)
  --     local mason_null_ls = require "mason-null-ls"
  --     local null_ls = require "null-ls"
  --     mason_null_ls.setup(opts)
  --     mason_null_ls.setup_handlers {
  --       prettierd = function()
  --         null_ls.register(null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "json", "markdown" } })
  --       end,
  --     }
  --   end,
  -- },
}

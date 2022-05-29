local config = {

  plugins = {
    -- installing plugins
    init = {
      {"folke/tokyonight.nvim"}, -- theme
      {
        "windwp/nvim-spectre",
        requires = {"nvim-lua/plenary.nvim"}, -- search & replace
        -- config = function ()
        --   local map = vim.api.nvim_set_keymap
        --   map("n", "<leader>fr", "<cmd>lua require('spectre').open()<CR>", { desc = "open find & replace" })
        -- end,
      },
    },

    -- overriding setup() of existing plugins
    cmp = function (config)
      local cmp_ok, cmp = pcall(require, "cmp")
      local luasnip_ok, luasnip = pcall(require, "luasnip")
      if cmp_ok and luasnip_ok then
        config.mapping["<CR>"] = cmp.mapping.confirm ({ select = false })
        config.mapping["<C-y>"] = cmp.mapping.confirm { select = true, behavior = cmp.ConfirmBehavior.Insert }
        config.mapping["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
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
      end
      return config
    end,

    ["neo-tree"] = {
      close_if_last_window = true,
      enable_diagnostics = true,
      window = {
        position = "left",
        width = 35,
      },
    },

    treesitter = {
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "dockerfile",
        "html",
        "http",
        "javascript",
        "json",
        "latex",
        "lua",
        "markdown",
        "regex",
        "vim",
        "yaml",
        "elixir",
      },
    },

    ["nvim-lsp-installer"] = {
      automatic_installation = true,
      ensure_installed = {
        "sumneko_lua",
        "elixirls",
        "jsonls",
        "ltex", --Latex/Markdown
        "yamlls",
        "sqlls",
      },
    },

    -- to change the default configuration of the elixirls; all of these failed to work :~
    -- lsp = {
    --   -- override the lsp installer server-registration function
    --   server_registration = function(server, opts)
    --     if server == "elixirls" then
    --       require("lspconfig")[server].setup({
    --         cmd = {"~/.elixir-ls/release/language_server.sh"}
    --       })
    --     end
    --   end,
    --
    --   ["server-settings"] = {
    --     elixirls = {
    --       settings = {
    --         cmd = {"~/.elixir-ls/release/language_server.sh"},
    --       },
    --       setup = {
    --         cmd = {"~/.elixir-ls/release/language_server.sh"},
    --       }
    --     }
    --   }
    -- },
  },

  polish = function ()
    -- theme
    vim.g.tokyonight_style = "storm" --"night"
    vim.api.nvim_command(("colorscheme %s"):format("tokyonight"))

    --clipboard
    vim.api.nvim_command("set clipboard+=unnamedplus")

    local map = vim.api.nvim_set_keymap
    map("n", "<leader>fr", "<cmd>lua require('spectre').open()<CR>", { desc = "open find & replace" })
    map("n", "<leader>fa", ":Telescope find_files hidden=true no_ignore=true<cr>", { desc = "Search hidden files" })
  end
}
return config

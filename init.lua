local util = require 'lspconfig/util'

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
      {"mhinz/vim-mix-format"},
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
        "eex",
        "heex",
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



    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      config.sources = {
        null_ls.builtins.diagnostics.credo,
        null_ls.builtins.formatting.mix,
        null_ls.builtins.formatting.surface,
      }
      -- set up null-ls's on_attach function
      -- config.on_attach = function(client)
      --   -- NOTE: You can remove this on attach function to disable format on save
      --   if client.resolved_capabilities.document_formatting then
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       desc = "Auto format before save",
      --       pattern = "<buffer>",
      --       callback = vim.lsp.buf.formatting_sync,
      --     })
      --   end
      -- end
      return config -- return final config table
    end,

  },

  -- to change the default configuration of the elixirls; all of these failed to work :~
  lsp = {
    -- servers = {
    --   "elixirls",
    -- },
    ["server-settings"] = {
      elixirls = {
          -- cmd = {"~/.elixir-ls/release/language_server.sh"},
          root_dir = function(fname)
              return os.getenv("PWD")--util.root_pattern(".git")(fname)
          end,
          suggestSpecs = false,
          dialyzerEnabled = true,
          signatureAfterComplete = false,
          fetchDeps = false,
          capabilities = {
            document_formatting = true
          }
          -- on_attach = function(client)
          --   client.server_capabilities.document_formatting = true
          --   on_attach(client)
          -- end,
      }
    }
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

-- Note: to write to system clipboard  
-- sudo apt install wl-clipboard

-- local path_to_elixirls_server = vim.fn.expand("~/.elixir_ls/release/language_server.sh")

local config = {
  colorscheme = "tokyonight",
  plugins = {
    -- installing plugins
    { "windwp/nvim-autopairs", enabled = false },
    {
      "windwp/nvim-spectre",
      requires = { "nvim-lua/plenary.nvim" }, -- search & replace
      -- config = function ()
      --   local map = vim.api.nvim_set_keymap
      --   map("n", "<leader>fr", "<cmd>lua require('spectre').open()<CR>", { desc = "open find & replace" })
      -- end,
    },
    { "mhinz/vim-mix-format" },
    ["neo-tree"] = {
      close_if_last_window = true,
      enable_diagnostics = true,
      window = {
        position = "left",
        width = 35,
      },
    },
    -- ["null-ls"] = function(config)
    --   local null_ls = require "null-ls"
    --   config.sources = {
    --     -- null_ls.builtins.diagnostics.credo,
    --     null_ls.builtins.formatting.mix,
    --     null_ls.builtins.formatting.surface,
    --   }
    --   -- set up null-ls's on_attach function
    --   -- config.on_attach = function(client)
    --   --   -- NOTE: You can remove this on attach function to disable format on save
    --   --   if client.resolved_capabilities.document_formatting then
    --   --     vim.api.nvim_create_autocmd("BufWritePre", {
    --   --       desc = "Auto format before save",
    --   --       pattern = "<buffer>",
    --   --       callback = vim.lsp.buf.formatting_sync,
    --   --     })
    --   --   end
    --   -- end
    --   return config -- return final config table
    -- end,

  },
  polish = function()

    --clipboard
    vim.api.nvim_command("set clipboard+=unnamedplus")

    local map = vim.api.nvim_set_keymap
    map("n", "<leader>fr", "<cmd>lua require('spectre').open()<CR>", { desc = "open find & replace" })
    map("n", "<leader>fa", ":Telescope find_files hidden=true no_ignore=true<cr>", { desc = "Search hidden files" })
  end
}
return config

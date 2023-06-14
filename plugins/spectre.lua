return {
  "windwp/nvim-spectre",
  requires = { "nvim-lua/plenary.nvim" }, -- search & replace
  -- config = function()
  --   require("astronvim.utils").set_mappings {
  --     n = {
  --       ["<leader>fR"] = { "<cmd>lua require('spectre').open()<CR>", desc = "open find & replace" }
  --     },
  --   }
  --   -- local map = vim.api.nvim_set_keymap
  --   -- map("n", "<leader>fR", "<cmd>lua require('spectre').open()<CR>", { desc = "open find & replace" })
  -- end
}

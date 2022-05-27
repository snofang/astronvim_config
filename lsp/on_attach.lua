return function(client, bufnr)
  if client.name == "sqlls" then
    require("sqlls").on_attach(client, bufnr)
  end
  -- if client.name == "elixirls" then
  --   require'lspconfig'.elixirls.setup{
  --     cmd = {"~/.elixir-ls/release/language_server.sh"};
  --   }
  -- end
end

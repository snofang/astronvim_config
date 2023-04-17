-- local path_to_elixirls_server = vim.fn.expand("~/.elixir_ls/release/language_server.sh")

return {
  cmd = {
    vim.fn.expand("~/.elixir_ls/release/language_server.sh")
  },
  root_dir = function()
    return os.getenv("PWD") --util.root_pattern(".git")(fname)
  end,
  suggestSpecs = true,
  dialyzerEnabled = true,
  signatureAfterComplete = false,
  fetchDeps = false,
  capabilities = {
    document_formatting = true
  }
}

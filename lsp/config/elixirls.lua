-- local util = require "lspconfig.util"
return {
  cmd = {
    vim.fn.expand("~/.elixir_ls/release/language_server.sh")
  },
  root_dir = function()
    return os.getenv("PWD")
    --util.root_pattern(".git")
  end,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  settings = {
    elixirLS = {
      suggestSpecs = false,
      dialyzerEnabled = true,
      signatureAfterComplete = false,
      fetchDeps = false,
      capabilities = {
        document_formatting = true
      }
    }
  }
}

-- Lua
require('lspconfig').lua_ls.setup{
  settings = {
    Lua = {
      telemetry = { enable = false },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

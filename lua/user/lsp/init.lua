-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup()

require('user.lsp.lua')
require('user.lsp.efm')

local nvim_lsp = require('lspconfig')
local configs = require 'lspconfig/configs'

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['tsserver'].setup {
--   capabilities = capabilities
-- }
-- require('lspconfig')['gopls'].setup {
--   capabilities = capabilities
-- }

nvim_lsp.jsonls.setup {capabilities = capabilities}

nvim_lsp.pylsp.setup {}

vim.api.nvim_command('au BufReadPost *.graphql set syntax=graphql')


local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- LSP Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- buf_set_keymap('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.keymap.set('n', '<space>h', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    -- ...
    -- No idea how this works, but it formats
    if client.server_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api
            .nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
    end
end

-- TypeScript
nvim_lsp.tsserver.setup {on_attach = on_attach, capabilities = capabilities}

-- -- GoLang
-- if not configs.golangcilsp then
--   configs.golangcilsp = {
--     default_config = {
--       cmd = { 'golangci-lint-langserver' },
--       root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod'),
--       init_options = {
--         -- command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
--         command = { "golangci-lint", "run", "--out-format", "json" };
--       }
--     };
--   }
-- end
-- nvim_lsp.golangci_lint_ls.setup {
--   filetypes = { 'go', 'gomod' }
-- }

-- JSON
nvim_lsp.jsonls.setup {}

-- GraphQL
nvim_lsp.graphql.setup {}

-- Protobuf: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bufls
nvim_lsp.bufls.setup {}

-- SQL
nvim_lsp.sqlls.setup {}
-- Checkout https://github.com/lighttiger2505/sqls in the future

-- GoLang
nvim_lsp.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    -- filetypes = { "go", "gomod" },
    -- root_dir = util.root_pattern("go.mod", ".git"),
    settings = {
        gopls = {
            -- usePlaceholders = false,
            buildFlags = {"-tags=integration"}
            -- gofumpt = true,
            -- ["local"] = "<repo>",
        }
    },
    init_options = {buildFlags = {"-tags=integration"}}
}

if not configs.golangcilsp then
 	configs.golangcilsp = {
		default_config = {
			cmd = {'golangci-lint-langserver'},
			root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod'),
			init_options = {
					command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" };
			}
		};
	}
end
nvim_lsp.golangci_lint_ls.setup {
	filetypes = {'go','gomod'}
}

-- nvim_lsp.sumneko_lua.setup {
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { 'vim' },
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }


-- diagnostic options
vim.cmd [[
hi LspDiagnosticsVirtualTextError guifg=lightred gui=bold,italic,underline
hi LspDiagnosticsVirtualTextWarning guifg=lightorange gui=bold,italic,underline
hi LspDiagnosticsVirtualTextInformation guifg=lightyellow gui=bold,italic,underline
hi LspDiagnosticsVirtualTextHint guifg=gray gui=bold,italic,underline
]]

local nvim_lsp = require('lspconfig')

local eslint = {
    lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {'%f:%l:%c: %m'},
    formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
    formatStdin = true
}

local prettier = {
    formatCommand = 'prettier_d --stdin-filepath ${INPUT}',
    formatStdin = true
}

-- luarocks install --server=https://luarocks.org/dev luaformatter
local luaformatter = {formatCommand = 'lua-format -i', formatStdin = true}

local gofmt = {formatCommand = 'gofmt ${INPUT}'}
local go_imports_revisor = {
    formatCommand = 'goimports-reviser -rm-unused -set-alias -format ${INPUT}'
}

-- EFM (formatting and linting)
nvim_lsp.efm.setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    root_dir = nvim_lsp.util.root_pattern({'.git/', '.'}),
    settings = {
        rootMarkers = {".git/"},
        filetypes = {
            "javascript", "javascriptreact", "javascript.jsx", "typescript",
            "typescript.tsx", "typescriptreact", "less", "scss", "css", "lua",
            "graphql", "go", "json"
        },
        languages = {
            typescript = {eslint, prettier},
            javascript = {eslint, prettier},
            typescriptreact = {eslint, prettier},
            javascriptreact = {eslint, prettier},
            yaml = {prettier},
            json = {prettier},
            html = {prettier},
            scss = {prettier},
            css = {prettier},
            lua = {luaformatter},
            markdown = {prettier},
            graphql = {prettier},
            -- linting is handled by ALE
            go = {gofmt, go_imports_revisor}
        }
    }
}

local null_ls = require('null-ls')

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr
    })
end

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- null_ls.setup {
--     -- you can reuse a shared lspconfig on_attach callback here
--     on_attach = function(client, bufnr)
--         if client.supports_method("textDocument/formatting") then
--             vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 group = augroup,
--                 buffer = bufnr,
--                 callback = function()
--                     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--                     lsp_formatting(bufnr)
--                 end
--             })
--         end
--     end,
--     sources = {
--         -- code actions
--         -- npm install -g eslint_d
--         null_ls.builtins.code_actions.eslint_d, -- Formatting
--         null_ls.builtins.formatting.gofmt,
--         -- go install -v github.com/incu6us/goimports-reviser/v3@latest
--         null_ls.builtins.formatting.goimports_reviser,
--         -- npm install -g @fsouza/prettierd
--         null_ls.builtins.formatting.prettierd,
--         -- SEE https://ask.fedoraproject.org/t/problem-using-luarocks-on-f35/22897
--         -- sudo dnf install lua-devl
--         -- luarocks install --server=https://luarocks.org/dev luaformatter
--         null_ls.builtins.formatting.lua_format,
--         null_ls.builtins.diagnostics.golangci_lint
--     }
-- }

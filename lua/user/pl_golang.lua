vim.g.go_fmt_fail_silently = 1
vim.g.go_list_type = "quickfix"

vim.cmd [[
autocmd FileType go nnoremap <buffer><localleader>bs :vsplit<cr> :terminal make start<cr>
autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
]]

vim.g.go_metalinter_command = "golangci-lint"
vim.g.go_metalinter_autosave = 0
vim.g.go_metalinter_autosave_enabled = {
  'deadcode',
  'errcheck',
  'gosimple',
  'govet',
  'ineffassign',
  'staticcheck',
  'typecheck',
  'unused',
  'varcheck',
}

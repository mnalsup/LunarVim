
-- let g:NERDTreeHijackNetrw = 0  add this line if you use NERDTree
vim.ranger_command_override = 'ranger --cmd "set show_hidden=true"'
vim.ranger_replace_netrw = 1
vim.g.ranger_map_keys = 0

vim.api.nvim_set_keymap('n', '<leader>fm', '<cmd>Ranger<CR>', {noremap = true})

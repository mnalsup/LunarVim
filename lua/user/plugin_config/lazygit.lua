vim.g.lazygit_floating_window_winblend = 0 -- transparency
vim.g.lazygit_floating_window_boarder_chars = {'╭', '╮', '╰', '╯'} -- customize lazygit popup window corner characters
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>LazyGit<CR>', {noremap = true})

-- Refs
-- https://github.com/kdheepak/lazygit.nvim
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- https://www.lua.org/pil/11.1.html

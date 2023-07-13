-- VIM configs
require('vim')
require('projects')

-- Plugins
require('plugins')

-- LSP
require('lsp')

-- formatters and linters
require('plugin_config.null_ls_config')
require('plugin_config.ale')

-- Programing Language Configs
require('pl_terraform')
require('pl_golang')
require('pl_javascript')

require('plugin_config.nerdtree')
require('plugin_config.nvim_telescope')
require('plugin_config.lazygit')
require('plugin_config.which_key')
require('plugin_config.ranger')
require('plugin_config.float_term')
require('plugin_config.nvim_cmp')
require('plugin_config.trouble')
require('plugin_config.gitsigns')
require('plugin_config.treesitter')
require('plugin_config.vim_test')
require('plugin_config.lualine')

vim.cmd [[colorscheme base16-tomorrow]]

-- Sources
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
-- https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887

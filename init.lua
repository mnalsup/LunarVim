local base_dir = vim.env.LUNARVIM_BASE_DIR
  or (function()
    local init_path = debug.getinfo(1, "S").source
    return init_path:sub(2):match("(.*[/\\])"):sub(1, -2)
  end)()

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:prepend(base_dir)
end

require("lvim.bootstrap"):init(base_dir)

require("lvim.config"):load()

-- local plugins = require "lvim.plugins"

--require("lvim.plugin-loader").load { plugins, lvim.plugins }

require("lvim.core.theme").setup()

local Log = require "lvim.core.log"
Log:debug "Starting LunarVim"

local commands = require "lvim.core.commands"
commands.load(commands.defaults)

lvim.keys = {}
-- lvim.builtin.which_key.mappings = {}

-- VIM configs
require('user.vim')
require('user.projects')

-- Plugins
require('user.plugins')

-- LSP
require('user.lsp')

-- formatters and linters
require('user.plugin_config.null_ls_config')
require('user.plugin_config.ale')

-- Programing Language Configs
require('user.pl_terraform')
require('user.pl_golang')
require('user.pl_javascript')

require('user.plugin_config.nerdtree')
require('user.plugin_config.lazygit')
-- require('user.plugin_config.which_key')
require('user.plugin_config.ranger')
require('user.plugin_config.nvim_cmp')
require('user.plugin_config.trouble')
require('user.plugin_config.gitsigns')
require('user.plugin_config.treesitter')
require('user.plugin_config.vim_test')

vim.cmd [[colorscheme base16-tomorrow]]

-- Sources
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
-- https://blog.inkdrop.app/how-to-set-up-neovim-0-5-modern-plugins-lsp-treesitter-etc-542c3d9c9887

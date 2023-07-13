local plugins = {}
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

local lvim_plugins = {
  "folke/lazy.nvim",
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
  "tamago324/nlsp-settings.nvim",
  "jose-elias-alvarez/null-ls.nvim",
    "williamboman/mason.nvim",
    "folke/tokyonight.nvim",
    "lunarvim/lunar.nvim",
   "Tastyep/structlog.nvim",
  "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzf-native.nvim",
    "hrsh7th/nvim-cmp",
   "hrsh7th/cmp-nvim-lsp",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
    "folke/neodev.nvim",
    "windwp/nvim-autopairs",
    "nvim-treesitter/nvim-treesitter",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "kyazdani42/nvim-tree.lua",
  -- Lir
    "tamago324/lir.nvim",
    "lewis6991/gitsigns.nvim",
  -- Whichkey
    "folke/which-key.nvim",
  -- Comments
    "numToStr/Comment.nvim",
  -- project.nvim
    "ahmedkhalf/project.nvim",
  -- Icons
    "nvim-tree/nvim-web-devicons",
  -- Status Line and Bufferline
    -- "hoob3rt/lualine.nvim",
    "nvim-lualine/lualine.nvim",
  -- breadcrumbs
    "SmiteshP/nvim-navic",
    "akinsho/bufferline.nvim",
  -- Debugging
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  -- alpha
    "goolord/alpha-nvim",
  -- Terminal
    "akinsho/toggleterm.nvim",
  -- SchemaStore
    "b0o/schemastore.nvim",
    "RRethy/vim-illuminate",
    "lukas-reineke/indent-blankline.nvim",
    "lunarvim/onedarker.nvim",
    "lunarvim/bigfile.nvim",
}

local user_plugins = {
   -- {'nvim-lua/plenary.nvim'},
    -- Neovim Development
    -- { "folke/neodev.nvim", opts = {} },
    {'rafcamlet/nvim-luapad'},

    -- {'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate'}, -- LSP/Mason
    -- {
    --     "neovim/nvim-lspconfig",
    --     lazy = true,
    --     dependencies = {"mason-lspconfig.nvim", "nlsp-settings.nvim"}
    -- }, {
    --     "williamboman/mason-lspconfig.nvim",
    --     cmd = {"LspInstall", "LspUninstall"},
    --     config = function()
    --         require("mason-lspconfig").setup({
    --             ensure_installed = {
    --                 -- lua
    --                 'lua_ls', -- Go
    --                 'golangci_lint_ls', 'gopls', -- Buf
    --                 'bufls'

    --             }
    --         })
    --     end,
    --     lazy = true,
    --     event = "User FileOpened",
    --     dependencies = "mason.nvim"
    -- }, {"tamago324/nlsp-settings.nvim", cmd = "LspSettings", lazy = true},
    -- {"jose-elias-alvarez/null-ls.nvim", config = function() end}, {
    --     "williamboman/mason.nvim",
    --     config = function() require("mason").setup() end,
    --     cmd = {
    --         "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll",
    --         "MasonLog"
    --     },
    --     build = "MasonUpdate",
    --     event = "User FileOpened",
    --     lazy = true
    -- }, {'nvim-telescope/telescope.nvim'}, {'dense-analysis/ale'},
    -- {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    -- {'folke/which-key.nvim'}, {'voldikss/vim-floaterm'}
       {'folke/trouble.nvim'},

    -- {
    --     -- "hoob3rt/lualine.nvim",
    --     "nvim-lualine/lualine.nvim",
    --     -- "Lunarvim/lualine.nvim",
    --     config = function()
    --         require("lualine").setup(require("user.plugin_config.lualine"))
    --     end,
    --     dependencies = {'nvim-tree/nvim-web-devicons'},
    --     event = "VimEnter"
    -- }, -- File Management
    {'francoiscabrol/ranger.vim'}, {'rbgrouleff/bclose.vim'},

    {'cohama/lexima.vim'}, {'tpope/vim-surround'},

    {'nathanaelkane/vim-indent-guides'}, -- Code uses
    {'SirVer/ultisnips'},
    -- {
    --     'hrsh7th/nvim-cmp',
    --     dependencies = {
    --         'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
    --         'hrsh7th/cmp-cmdline'
    --     }
    -- }, {'hrsh7th/vim-vsnip'}, {'ekalinin/dockerfile.vim'}, -- Integrations
    -- {
    --     'lewis6991/gitsigns.nvim',
    --     config = function() require('gitsigns').setup() end
    -- },
    {'kdheepak/lazygit.nvim'}, {'tpope/vim-fugitive'},

    -- Sessions - used in combination
    {'tpope/vim-obsession'}, -- Javascript
    {'pangloss/vim-javascript'}, -- Golang
    {'fatih/vim-go'}, -- Graphql
    {'jparise/vim-graphql'}, -- Typescript
    -- 'Quramy/tsuquyomi'
    {'leafgarland/typescript-vim'}, {'HerringtonDarkholme/yats'},
    {'peitalin/vim-jsx-typescript'}, -- Testing
    {'ruanyl/coverage.vim'}, -- Terraform
    {'hashivim/vim-terraform'}, -- Python
    {'hdima/python-syntax'}, {'vim-scripts/indentpython.vim'}, -- Go
    {'ray-x/go.nvim'}, -- HTML
    {'alvan/vim-closetag'}, -- Testing
    {'vim-test/vim-test'}, -- Navigation
    {'easymotion/vim-easymotion'}, -- TMUX integration
    {'tmux-plugins/vim-tmux-focus-events'}, -- Themes
    {'ayu-theme/ayu-vim'}, {'sts10/vim-pink-moon'},
    {'altercation/vim-colors-solarized'}, {'RRethy/nvim-base16'},
    {'arcticicestudio/nord-vim'}
}


local function contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end

-- merges selected lvim plugins with my own plugins
function plugins.getPlugins()
  local loaded_plugins = {}
  local lvim_core = require('lvim.plugins')
  for _, value in pairs(lvim_core) do
      if contains(lvim_plugins, value[1]) then
        table.insert(loaded_plugins, value)
      end
  end
  for _, value in pairs(user_plugins) do
    table.insert(loaded_plugins, value)
  end
  return loaded_plugins
end

require("lazy").setup(plugins.getPlugins())

return plugins

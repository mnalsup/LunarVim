local set = vim.opt

-- Leader related keybindings
vim.keymap.set('n', '<SPACE>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = '-'


-- set runtime path for fzf
-- set.rtp = set.rtp .. "/usr/local/opt/fzf"

-- For some reason this is a table?
set.colorcolumn = {81}

vim.cmd[[
highlight ColorColumn ctermbg=gray guibg=gray
]]

if vim.fn.has('termguicolors') then
  set.termguicolors = true
end
vim.g.solarized_termcolors = 256
local color_path = vim.fn.expand('~/.config/nvim/scheme.vim')
if vim.fn.filereadable(color_path) == 1 then
  vim.cmd('source ' .. color_path)
else
  --default color scheme
  -- vim.cmd('colorscheme pink-moon')
end

-- if available and a file was not passed, restore session and begin recording
-- if there is a session available and a file was passed the previous session
-- is not overwritten.
-- Sources:
-- https://stackoverflow.com/questions/6256884/in-vimrc-how-to-test-whether-any-filename-arguments-are-given-to-vim-at-invoca
if vim.fn.filereadable('./Session.vim') == 1 and vim.fn.argc() == 0 then
  vim.cmd('source ./Session.vim')
end


vim.cmd[[
" Other options
" Backspace like normal editors
set backspace=indent,eol,start
set number
highlight LineNr ctermfg=black ctermbg=grey
set tabstop=2
set shiftwidth=2
set expandtab
set nocursorline
]]

vim.cmd[[
" Retraining Mappings

" no more esc for exiting insert mode
inoremap <esc> <nop>
" no more arrow keys
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Mappings testing area
nnoremap <leader>j :vsplit<cr> <C-w>l :execute 'Note '.strftime("%m-%d-%Y")<cr>

" navigating windwos
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w>v :vnew<cr>
" Opens terminal in vsplit
nnoremap <leader>tv :vsplit<cr> :terminal<cr>
" Opens the vimrc/init.vim in a vsplit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Sources the vimrc/init.vim
nnoremap <leader>sv :source $MYVIMRC<cr>
" Sources the vimrc/init.vim
nnoremap <leader>dv :source $MYVIMRC<cr> :PluginClean<cr>y :PluginInstall<cr>ZQ
" moves a line down one line
nnoremap <leader>- dd gP
" _ moves a line up one line
nnoremap <leader>_ :m-2<cr>
" Move all the way left (can also use 0 or ^)
nnoremap H :-0<esc>
" Move all the way right
noremap L $
" deletes the line in insert mode
inoremap <c-d> <esc>ddi
" puts the previous word into upper case
inoremap <c-u> <esc>bvwUA
" removes dumb comment in .vim files when creating new line
inoremap <c-l> <esc>ddi<cr><esc>ki
" escape from the dreaded insert or visual mode
:inoremap jk <esc>
:inoremap Jk <esc>
:inoremap jK <esc>
:inoremap JK <esc>

" places double quotes around visually selected content: inferior to
" vim-surround
vnoremap <leader>" A"<esc>`<i"<esc>`>e

" adds appostrophe to dont
inoreabbrev dont don't
inoreabbrev adn and
inoreabbrev improt import

" Autocommands
autocmd BufRead,BufNew *Jenkinsfile* :set ft=groovy
autocmd FileType typescript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType zsh nnoremap <buffer> <localleader>c I#<esc>
" run make start in current project
]]

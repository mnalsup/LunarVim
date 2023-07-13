-- vim-wiki
vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_list = {
  {
    ['path'] = '~/vimwiki',
    ['syntax'] = 'markdown',
    ['ext'] = '.md'
  }
}
-- vim.g.vimwiki_table_mappings = 0
vim.cmd[[
au filetype vimwiki silent! iunmap <buffer> <Tab>
au filetype vimwiki nnoremap <buffer> <leader>\ :VimwikiToggleListItem<CR>
]]

-- limelight
vim.g.limelight_conceal_ctermfg = 'gray'
vim.g.limelight_conceal_guifg = 'DarkGray'

-- Goyo
-- Leaves room for the vimwiki textwidth setting
vim.g.goyo_width = 81 

-- Markdown Preview Options
vim.g.mkdp_auto_start = 0

vim.cmd[[
autocmd FileType text set spell

autocmd FileType vimwiki inoremap <buffer> MDY <C-R>=strftime("%B %d, %Y")<CR>
autocmd FileType vimwiki nnoremap <buffer> <localleader>td ^/\[ \]<cr>lrx<esc>
autocmd FileType vimwiki nnoremap <buffer> <localleader>tt ^a [ ] <esc>

function! InsertWikiLinkFromFZF(file)
    "let filename = fnameescape(fnamemodify(a:file, ":t"))
    "why only the tail ?  I believe the whole filename must be linked unless everything is flat ...
    let filename = fnameescape(a:file)
    " escape filename, modify by trimming ext (:r) only with tail (:t), and
    " substituting a timestamp regex with nothing
    let filename_wo_timestamp_wo_ext = fnameescape(fnamemodify(a:file, ":r:t:s/^[0-9]*-//"))
     " Insert the markdown link to the file in the current buffer
    let mdlink = "[".filename_wo_timestamp_wo_ext."](".filename.")"
    " original put= impelmentation adds a newline
    "put=mdlink
    exe "normal! a" . mdlink . "\<Esc>"
endfunction
command! -nargs=1 InsertWikiLink :call InsertWikiLinkFromFZF(<f-args>)

autocmd FileType vimwiki inoremap <buffer> <localleader>wl <esc>:call fzf#run({'sink': 'InsertWikiLink'})<CR>
autocmd FileType vimwiki :set spell
autocmd FileType vimwiki :set textwidth=80
autocmd FileType vimwiki :set wrap linebreak

" Open todays note when opening vim
" autocmd VimEnter <leader>j :vsplit<cr> <C-w>l :Note <C-R>=strftime("%m-%d-%Y")<CR><cr>
]]


vim.cmd[[
" FZF Settings
noremap <leader>vo :vsplit<CR> :FzfGitFilesPreview<CR>
" noremap <leader>o :call FzfPreview()<CR>
" Search all files, helpful for searching non-standard git repos
noremap <leader>a :FzfFilesPreview<CR>
" noremap <leader>l :BLines<CR>
let g:fzf_preview_window = 'right:60%'

func! FzfPreview()
  let isGitRepo = system('git rev-parse --is-inside-work-tree')
  let isGitRepo = substitute(isGitRepo, '\n', '', '')
  if isGitRepo == 'true'
    silent! :FzfGitFilesPreview
  else
    :FzfFilesPreview
  endif
endfunc

command! -bang -nargs=? -complete=dir FzfGitFilesPreview
    \ call fzf#vim#gitfiles(<q-args>, {'options': ['--info=inline', '--preview', 'bat {}']}, <bang>0)

command! -bang -nargs=? -complete=dir FzfFilesPreview
    \ call fzf#vim#files(<q-args>, {'options': ['--info=inline', '--preview', 'bat {}']}, <bang>0)

function! GetRipGrepCommand(ignore, sourceFiles, markUpFiles, dataFiles)
  let baserg = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '
  let sourceFiles = ' -g "*.{vim,js,ts,php,py,cpp,c,go,hs,rb,tf,sh,tfvars,html}" '
  let markUpFiles = ' -g "*.{md,jade,styl}" '
  let dataFiles = ' -g "*.{json,config,conf,yml,yaml}" '
  let ignoredPaths = ' -g "!{.git,node_modules,vendor,coverage,docs/tsdoc}/*" '
  if a:sourceFiles
    let baserg = baserg . sourceFiles
  endif
  if a:markUpFiles
    let baserg = baserg . markUpFiles
  endif
  if a:dataFiles
    let baserg = baserg . dataFiles
  endif
  if a:ignore
    let baserg = baserg . ignoredPaths
  endif
  return baserg
endfunction

command! -bang -nargs=* FindSource call fzf#vim#grep(GetRipGrepCommand(1, 1, 0, 0) .shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* FindAll call fzf#vim#grep(GetRipGrepCommand(1, 1, 1, 1) .shellescape(<q-args>), 1, <bang>0)

nnoremap <leader>fs :FindSource 
nnoremap <leader>fa :FindAll 

" command! YankFile call fzf#run({'sink': {line -> setreg('', line)}})
]]

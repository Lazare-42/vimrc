set nocompatible
filetype off
filetype plugin indent on
syntax on
set expandtab
set encoding=utf-8
set t_Co=256
set cc=80
set ai
set number
set mouse=a
set cursorline
set showcmd
set showmatch
set ruler
set ignorecase
set hlsearch
colorscheme Atelier_SulphurpoolLight
"set background=blue
set tabstop=4
set shiftwidth=4

"Shortcuts"
inoremap <F5> <esc>:w<cr>
noremap <F5> <esc>:w<cr>
:imap jk <Esc>
:imap JK <Esc>
:map <F7> <esc>:q <cr>
:map <F7> <esc>:q <cr>
:map <F2> <Esc>:tabnew 
:map <F3> <esc>:tabprevious<cr>
:map <F4> <esc>:tabnext<cr>
:map <F8> <esc>:vs 

"Haskell ghc-mod"
"map <silent> tw :GhcModTypeInsert<CR>
"map <silent> ts :GhcModSplitFunCase<CR>
"map <silent> tq :GhcModType<CR>
"map <silent> te :GhcModTypeClear<CR>
"locate ghc-mod executable"
"let $PATH = $PATH . ':' . expand ('~/.local/bin/')

"Syntastic ////////////////////////////////////////////////////////////////////
call pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let current_compiler = "gcc"
let g:syntastic_aggregate_errors=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height = 10
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_rails=1
let g:syntastic_enable_signs=1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_include_dirs = ['../../../include', '../../include','../include','./include']
let g:syntastic_c_compiler_options ='-Wall -Werror -Wextra -fsanitize=address -C99 -pedantic -fno-stack-protecto -ftest-coverage -fsanitize=address' 
"//////////////////////////////////////////////////////////////////////////////
"
"Vimtex
let g:tex_flavor = "latex"
let g:tex_conceal = ""
let g:tex_fold_enabled = 0
let g:tex_comment_nospell = 1
let g:vimtex_view_method = 'skim'
let g:livepreview_previewer = 'open -a Skim'
let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'jobs',
        \ 'background' : 1,
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

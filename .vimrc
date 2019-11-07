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

" Store swap files in home directory
set directory^=$HOME/.vim/tmp//

" Replace tabs with 4 spaces [I see you Python]
set tabstop=4
set shiftwidth=4

" Of course you remap jk :)   
:imap jk <Esc>
:imap JK <Esc>

" faster tabnavigation with CONTROL-[letter]
map         <C-h> :tabprevious<CR>
map         <C-l> :tabnext<CR>
map         <C-n> :tabnew 

" faster file saving with CONTROL-f
inoremap    <C-f> <esc>:w<cr>
noremap     <C-f> <esc>:w<cr>

" replace command no-highlit with hitting three times v
inoremap    vvv <esc>:noh<cr> 
noremap     vvv <esc>:noh<cr> 

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

"""
"""     VIMTEX
"""
""" [of course you need latexmk]
let g:tex_flavor = "latex"
let g:tex_conceal = ""
let g:tex_fold_enabled = 0
let g:tex_comment_nospell = 1
let g:vimtex_view_method = 'zathura'
let g:livepreview_previewer = 'zathura'
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

"""
"""     NERDTREE
"""
"Show hidden files
"Open nerd tree with tab toggler on opening VIM 
autocmd VimEnter *  NERDTreeTabsOpen
autocmd VimEnter * wincmd p

" remap CONTROL-N to NERDTreeTabsToggle
nmap <C-a> :NERDTreeTabsToggle <CR> 

" Hide help
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

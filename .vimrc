call pathogen#infect()
"call pathogen#runtime_append_all_bundles()  " adding pathogen to vimrc
"call pathogen#helptags()

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible  " Use Vim defaults (much better!)
syntax on
set encoding=utf-8
set showcmd                         " display incomplete commands

set bs=indent,eol,start   " allow backspacing over everything in insert mode
"set ai     " always set autoindenting on
"set backup   " keep a backup file
set viminfo='20,\"50  " read/write a .viminfo file, don't store more
      " than 50 lines of registers
set history=50    " keep 50 lines of command line history
set ruler   " show the cursor position all the time

" defaults
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

set selectmode=mouse

"python stuff
filetype on
filetype plugin on
filetype indent on 
au FileType html,htmldjango setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType python setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4 colorcolumn=81
au FileType puppet setl autoindent tabstop=2 expandtab shiftwidth=2 softtabstop=2 colorcolumn=81
au FileType ruby setl autoindent tabstop=2 expandtab shiftwidth=2 softtabstop=2 

" remove trailing whitespace from files
au FileType python autocmd BufWritePre <buffer> :%s/\s\+$//e
au FileType puppet autocmd BufWritePre <buffer> :%s/\s\+$//e

" Only do this part when compiled with support for autocommands
if has("autocmd")
:autocmd BufWrite *.html :normal gg=G
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

if has("cscope") && filereadable("/opt/local/bin/cscope")
   set csprg=/opt/local/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
"  syntax on
"endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif

"let g:pymode_folding = 0

set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
colorscheme vividchalk

" Enable fancy mode 
let g:Powerline_symbols = 'fancy'   " Powerline
set laststatus=2                    " Always show the statusline

" for neocomplcache
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_min_syntax_length = 3

" json parsing
autocmd BufNewFile,BufRead *.json set ft=javascript

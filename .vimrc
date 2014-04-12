" use vim
set nocompatible
" let mapleader = ","

" backspacing funciton for insert mode
set backspace=indent,eol,start

" tab
set ts=4 sts=4 sw=4 expandtab
set listchars=tab:▸\ ,eol:¬
" ui
set cmdheight=1
set ruler
set laststatus=2
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)=\ %4l,%02c%2V\ %P%*
set showcmd
set guioptions-=L
set guioptions-=r

" search
set ic
set smartcase
set incsearch

" complete
set cot+=longest
set infercase

" operation set notildeop 
if has("gui")
	set guifont=Menlo
	set guifontwide=Hei

	syntax on
	set hlsearch
endif

" plug-ins
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'vundle'
Bundle 'molokai'
Bundle 'vimwiki'
Bundle 'snipMate'
Bundle 'surround.vim'
Bundle 'perl-support.vim'
Bundle 'ZenCoding.vim'
Bundle 'The-NERD-tree'
Bundle 'EasyMotion'
Bundle 'tComment'
Bundle 'rails.vim'
Bundle 'ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'VimIM'
Bundle "pangloss/vim-javascript"
Bundle 'JavaScript-syntax'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-coffee-script'
Bundle 'marijnh/tern_for_vim'
Bundle 'godlygeek/tabular'

filetype plugin on
filetype indent on
" syntax enable

" scheme
colorscheme molokai

" chinese
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" perl
" au FileType perl set complete-=i
au FileType perl map <leader>rr :!perl '%'<CR>

" c# complete
au FileType cs set omnifunc=syntaxcomplete#Complete

" key map
map <leader>nt :NERDTree<CR>
imap jj <esc>

" buffer
set wildmenu
set hidden "in order to switch between buffers with unsaved change 

" set textwidth=80

" python
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nmap <leader>rr :!python %<CR>

" vimim
let g:vimim_cloud = 'baidu,sogou,qq,google'  
let g:vimim_map = 'c-bslash'  

let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" latex
" set grepprg=grep\ -nH\ $*
" let g:tex_flavor='latex'

" vim wiki
let g:vimwiki_list = [
	\{'path': '~/Box Documents/wiki/source/', 'path_html': '~/Box Documents/wiki/html/'},
	\{'path': '~/Documents/wiki-lionant/source/', 'path_html': '~/Documents/wiki-lionant/html/'}
\ ]
let g:vimwiki_folding = 'syntax'
au FileType vimwiki map <leader>rr :Vimwiki2HTMLBrowse<CR>
au FileType vimwiki map <leader>ra :VimwikiAll2HTML<CR>
au FileType vimwiki map <leader>rc :Vimwiki2HTML<CR>

" use vim
set nocompatible
let mapleader = ","

" backspacing funciton for insert mode
set backspace=indent,eol,start

" tab
set shiftwidth=2
set ts=2
" set expandtab
" set autoindent
" set list
" set listchars=tab:>.

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

	if &t_Co > 2
		syntax on
		set hlsearch
	endif
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

filetype plugin on
filetype indent on
" syntax enable

" scheme
colorscheme molokai

" chinese
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" c# complete
au FileType cs set omnifunc=syntaxcomplete#Complete

" key map
map <leader>nt :NERDTree<CR>

" buffer
set wildmenu
set hidden "in order to switch between buffers with unsaved change 

set textwidth=80

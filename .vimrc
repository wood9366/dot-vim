" use vim
set nocompatible
" let mapleader = ","

" backspacing funciton for insert mode
set backspace=indent,eol,start

" chinese
set enc=utf-8
set fileencodings=utf-8,chinese,latin-1
set fileencoding=utf-8

if has("win32")
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim

	language messages zh_CN.utf-8

	:let $PATH.=";c:/cygwin/bin"
endif

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
set nu
set rnu

" search
set ic
set smartcase
set incsearch

" complete
set cot+=longest
set infercase

" operation set notildeop 
if has("gui")
	if has("unix")
		if system("uname") == "Darwin\n"
			set guifont=Menlo
			set guifontwide=Hei
		endif
	elseif has("win32")
		set guifont=consolas
		set guifontwide=consolas
	endif
endif

" plug-ins
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vimwiki'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'surround.vim'
Plugin 'perl-support.vim'
Plugin 'mattn/emmet-vim'
Plugin 'The-NERD-tree'
Plugin 'EasyMotion'
Plugin 'tComment'
Plugin 'ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'VimIM'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'JavaScript-Indent'
Plugin 'marijnh/tern_for_vim'
Plugin 'moll/vim-node'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'digitaltoad/vim-jade'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on

" latex
set rtp+=~/.vim/latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

if has("unix") && match(system("uname"),'Darwin') != -1
    let g:Tex_ViewRule_pdf = 'open -a Preview.app' 
endif   

syntax on
set hlsearch

" scheme
colorscheme molokai

" ultisnaps
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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
" let g:tern_show_argument_hints='on_hold'

" latex
" set grepprg=grep\ -nH\ $*
" let g:tex_flavor='latex'

" vim wiki
let g:vimwiki_list = [
	\{'path': '~/OneDrive/wiki/source/', 'path_html': '~/OneDrive/wiki/html/'},
\ ]
let g:vimwiki_folding = 'syntax'
au FileType vimwiki map <leader>rr :Vimwiki2HTMLBrowse<CR>
au FileType vimwiki map <leader>ra :VimwikiAll2HTML<CR>
au FileType vimwiki map <leader>rc :Vimwiki2HTML<CR>

" air line
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" tagbar
" let g:tagbar_ctags_bin='//bin/ctags'
let g:tagbar_width = 26
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
noremap <silent> <leader>y :TagbarToggle<CR>

" Ack
map <leader>.js :Ack --js '\b<C-R><C-W>\b'<CR>

" use vim not vi
set nocompatible

" setup plugins
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" powerful status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" find file quickly
Plugin 'kien/ctrlp.vim'

" file/directory manager
Plugin 'scrooloose/nerdtree'

" comment/uncomment code
Plugin 'scrooloose/nerdcommenter'

" insert surround char with motion key
Plugin 'tpope/vim-surround'

" git support
Plugin 'tpope/vim-fugitive'

" check & highlight syntax error realtime
Plugin 'vim-syntastic/syntastic'

" solarized color theme
Plugin 'altercation/vim-colors-solarized'

" add filetype glyphs for other plugins
Plugin 'ryanoasis/vim-devicons'

" auto complete
Plugin 'Valloric/YouCompleteMe'

" code alignment
Plugin 'godlygeek/tabular'

" code snippet
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'

" move cursor quickly
" Plugin 'EasyMotion'

" java script support
" Plugin 'pangloss/vim-javascript'
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'JavaScript-Indent'

" nodejs support
" Plugin 'marijnh/tern_for_vim'
" Plugin 'moll/vim-node'

" syntax highlight for jade template engine
" Plugin 'digitaltoad/vim-jade'

" vim wiki
" Plugin 'vimwiki/vimwiki'

call vundle#end()
filetype plugin indent on

" backspacing funciton for insert mode
set backspace=indent,eol,start

" chinese support
set enc=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set fileencoding=utf-8

" setup font
if has('gui')
    set guifont=DejaVuSansMono\ Nerd\ Font:h12
    set guifontwide=WenQuanYi\ Micro\ Hei:h12
endif

" menu support chinese for win32
if has("win32")
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim

	language messages zh_CN.utf-8

	:let $PATH.=";c:/cygwin/bin"
endif

" tab width 4
set tabstop=4
set softtabstop=4
set shiftwidth=4

" change tab to space
set expandtab

" change tab and line wrap visual char
set listchars=tab:▸\ ,eol:¬

" show tab and link wrap char
set list

" command line window height
set cmdheight=1

" show cursor row and column
set ruler

" always show status bar for each window
set laststatus=2

" status line format, use airline instead
" set statusline=[%02n]\ %f\ %(\[%M%R%H]%)=\ %4l,%02c%2V\ %P%*

" ? show command last line
set showcmd

" ? show/hide gui scrollbar
if has('gui')
    set guioptions-=L
    set guioptions-=r
endif

" show relative line number
set nu
set rnu

" search
" ignore case search
set ignorecase
" case sensitive if search contains upper case char
set smartcase
" when search show where match immediate
set incsearch
" highlight all match search
set hlsearch

" ? internal complete config
" set cot+=longest
" set infercase

" change leader key to ,
let mapleader = ","

" map kj to esc 
imap kj <esc>

" setup term for tmux
if exists('$TMUX')
	set term=screen-256color
endif

" setup cursor display different in normal and insert mode
if exists('$TMUX')
	let &t_SI = "\<Esc>[3 q"
	let &t_EI = "\<Esc>[0 q"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" syntax highlight
syntax enable

" solarized color scheme
set background=dark
colorscheme solarized
exe "hi! SpecialKey ctermbg=NONE guibg=NONE"

" code fold by syntax
set foldmethod=syntax

" add common ignore files for vimgrep
set wildignore=*.o,*.so,*.obj

" airline
let g:airline_powerline_fonts = 1

" nerd commenter
let g:NERDCreateDefaultMappings = 0
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
map <C-_> <plug>NERDCommenterToggle

" nerd tree
nmap <leader>nt :NERDTreeToggle<CR>

" git
nmap <leader>gs :Gstatus<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gd :Gdiff<CR>

" enable tag search in ctrlp
let g:ctrlp_extensions = ['tag']

" ? latex
" set rtp+=~/.vim/latex
" set grepprg=grep\ -nH\ $*
" let g:tex_flavor='latex'

" if has("unix") && match(system("uname"),'Darwin') != -1
"     let g:Tex_ViewRule_pdf = 'open -a Preview.app' 
" endif   
"
" set grepprg=grep\ -nH\ $*
" let g:tex_flavor='latex'

" ultisnaps
" let g:UltiSnipsExpandTrigger="<c-k>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" perl
" au FileType perl set complete-=i
au FileType perl map <leader>rr :!perl '%'<CR>

" c# complete
au FileType cs set omnifunc=syntaxcomplete#Complete

" enhance command line completion
set wildmenu

" ? in order to switch between buffers with unsaved change 
" set hidden 

" max width
set textwidth=80

" python
" bind rr to compile current file and send errors into list with specific format
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nmap <leader>rr :!python %<CR>

" tern
" let g:tern_map_keys=1
" let g:tern_show_argument_hints='on_hold'

" vim wiki
" let g:vimwiki_list = [
"     \{'path': '~/OneDrive/wiki/source/', 'path_html': '~/OneDrive/wiki/html/'},
" \ ]
" let g:vimwiki_folding = 'syntax'
" au FileType vimwiki map <leader>rr :Vimwiki2HTMLBrowse<CR>
" au FileType vimwiki map <leader>ra :VimwikiAll2HTML<CR>
" au FileType vimwiki map <leader>rc :Vimwiki2HTML<CR>

" ? tagbar
" let g:tagbar_ctags_bin='//bin/ctags'
" let g:tagbar_width = 26
" let g:tagbar_autoclose = 1
" let g:tagbar_autofocus = 1
" noremap <silent> <leader>y :TagbarToggle<CR>

" ycm
let g:ycm_always_populate_location_list = 1

" quickfix, localtion key bind
nmap <leader>cn :cn<CR>
nmap <leader>cp :cp<CR>
nmap <leader>cw :cw<CR>
nmap <leader>cs :ccl<CR>
nmap <leader>ln :lne<CR>
nmap <leader>lp :lp<CR>
nmap <leader>lw :lw<CR>
nmap <leader>ls :lcl<CR>

" switch h, cpp
function! SwitchCppH()
	let s:root = expand('%:r')
	let s:ext = expand('%:e')

	if s:ext == 'h'
		let s:path = s:root . '.cpp'

		if filereadable(s:path)
			exe 'e' s:path
		endif
	elseif s:ext == 'cpp'
		let s:path = s:root . '.h'

		if filereadable(s:path)
			exe 'e' s:path
		endif
	endif
endfunction

nmap <leader>jj :call SwitchCppH()<CR>

" local local config if exist
function! LoadLocalConfig()
    let s:files = glob("$HOME/.vim/local/*.vim", v:true, v:true)
    for s:file in s:files
        exe 'source' s:file
    endfor
endfunction

call LoadLocalConfig()

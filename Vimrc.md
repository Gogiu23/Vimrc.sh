# VIMRC BASIC ONE NO PLUGINS
## General sets
```vim
filetype plugin indent on
set backspace=indent,eol,start
syntax on
set history=300
set nocompatible
set wildmenu
set wildmode=full
set mouse=a

set path+=**
set relativenumber
set number
set autoindent

set cursorline
set noswapfile

set splitbelow
set splitright
set complete-=i
set foldlevelstart=2
set ttyfast
set showcmd ruler laststatus=2
set scrolloff=5
let c_comment_strings=1

set hlsearch

if 1
	nohlsearch
endif

set nobackup
set encoding=utf8
set noexpandtab shiftwidth=4 tabstop=4
set include=
let g:netrw_winsize=15
```

### Maps

```vim
 nnoremap <C-s> :w<CR>
 nnoremap <C-z> :wqa<CR>
 inoremap jk <esc>
 inoremap <esc> <nop>
 nnoremap L <end>
 nnoremap H <home>
 nnoremap <space> :Lexplore<CR>
 nnoremap <leader>t :terminal<CR>

 "commenter
 nnoremap cc :normal Hi//jkj<CR>

 "uncommenter
nnoremap ,c :normal Hxxj<CR>
```
```vim
 function! TheNext()
	if exists ( '*tabpagenr' ) && tabpagenr('$') != 1
		normal gt
	else
		execute ":bnext"
	endif
endfunction

function! ThePrev()
	if exists ( '*tabpagenr' ) && tabpagenr('$') != 1
		normal gT
	else
		execute ":bprev"
	endif
endfunction
```

### MOVING TEXT

 ```vim
 vnoremap <S-j> :m '>+1<CR>gv=gv
 vnoremap <S-k> :m '<-2<CR>gv=gv
 ```

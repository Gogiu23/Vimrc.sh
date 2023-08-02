#!/bin/bash
#
#COLORES (SE NE AGGIUNGERANNO MAN MANO)
rojo='\033[1;31m'
verde='\033[1;32m'
azul='\033[1;34m'
reset='\033[0m'


echo -e "${verde}Welcome${reset}${azul} $USER${reset}"

#Crea el archivo .vimrc
vimrc_file=~/.vimrc

#Verificar si el archivo .vimrc existe
if [ -f "$vimrc_file" ]; then
	echo ".vimrc exist already. No changes will be made."
else
	#Crea el .vimrc
	echo 'source ~/.vim/settings.vim' > "$vimrc_file"
fi

#CREATING DIR .VIM IN CASE DOESN'T EXIST
cartella="$HOME/.vim"

if [ ! -d "$cartella" ]; then
	echo "dir doesn't exist. Creating..."
	mkdir -p "$cartella"
	echo "Directory successsfully created"
else
	echo "Dir already exist, no change made"
fi

# Crea el archivo settings.vim dentro de vim
echo "filetype plugin indent on
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
nnoremap <C-s> :w<CR>
nnoremap <C-z> :wqa<CR>
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap L <end>
nnoremap H <home>
nnoremap <space> :Lexplore<CR>
nnoremap <leader>t :terminal<CR>

nnoremap cc :normal Hi//jkj<CR>

set termguicolors

nnoremap ,c :normal Hxxj<CR>

vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv" > ~/.vim/settings.vim

echo -e "${verde}Progress\n${reset}"

for ((percent=0; percent<=100; percent++)); do
	sleep 0.01

# Borra el prograso anterior y muestra el nuevo
	echo -ne "\r$percent% "

#Aggiunge una barra di progresso
	for ((i=0; i<percent/10; i++)); do
		echo -n '🟩'
	done
done
echo -e "\n"

echo 'source ~/.vim/settings.vim' > "$vimrc_file"
echo -e "${azul}At the moment seems you don't have any plugin installed.\nWhich plugin would you like to install?${reset}"

#CREATING DIR PLUGINS IN CASE DOESN'T EXIST
cartella_plug="$HOME/.vim/plugins.vim"

if [ ! -f "$cartella_plug" ]; then
	echo "dir doesn't exist. Creating..."
	touch "$cartella_plug"
	echo "Directory successsfully created"
else
	echo "Dir already exist, no change made"
fi

while true; do
	echo -e "Would you like to install a plugin manager? yes(1) or no (2)\n"
	read plug_bool;

	case $plug_bool in
		1)
			echo -e "YOU say yes\n"
			curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
			echo "source ~/.vim/plugins.vim" >> "$vimrc_file"
			echo "call plug#begin()" > "$cartella_plug"
			break
			;;
		2)
			echo -e "you said no\n"
			echo -e "No plugins will be installed\n"
			break
			;;
	esac
done

$finish : "1"

while [ "$finish" != "2" ]; do

	while true; do
		echo -e "Here a list of possibles plugin to increase your vim potential. Just press the option desired: \n"
		echo -e "- Vim Nerdtree (1);\n"
		echo -e "- Vim ALE (2);\n"
		echo -e "- Vim fugitive (3);\n"
		echo -e "- Vim airlines (4);\n"
		echo -e "- Vim easy complete (5);\n"
		echo -e "- Vim lsp (6);\n"
		echo -e "- Vim snippets (7);\n"
		echo -e "- Vim FZf (8);\n"
		echo -e "- Vim colorscheme Oceanic next (9);\n"

	read choice;

	case $choice in
		1)
			echo -e "Installing NerdTree\n"
			echo "Plug 'preservim/nerdtree'" >> "$cartella_plug"
			break
			;;
		2)
			echo -e "Installing ALE"
			echo "Plug 'dense-analysis/ale'" >> "$cartella_plug"
			break
			;;
		3)
			echo -e
			echo "Plug 'tpope/vim-fugitive'" >> "$cartella_plug"
			break
			;;
		4)
			echo -e
			echo "Plug 'vim-airline/vim-airline'" >> "$cartella_plug"
			echo "Plug 'vim-airline/vim-airline-themes'" >> "$cartella_plug"
			break
			;;
		5)
			echo -e
			echo "Plug 'jayli/vim-easycomplete'" >> "$cartella_plug"
			break
			;;
		6)
			echo -e
			echo "Plug 'prabirshrestha/vim-lsp'" >> "$cartella_plug"
			echo "Plug 'prabirshrestha/vim-lsp'" >> "$cartella_plug"
			echo "Plug 'mattn/vim-lsp-settings'" >> "$cartella_plug"
			break
			;;
		7)
			echo -e
			echo "Plug 'hrsh7th/vim-vsnip-integ'" >> "$cartella_plug"
			echo "Plug 'hrsh7th/vim-vsnip'" >> "$cartella_plug"
			break
			;;
		8)
			echo -e
			echo "Plug 'junegunn/fzf'" >> "$cartella_plug"
			echo "Plug 'junegunn/fzf.vim'" >> "$cartella_plug"
			break
			;;
		9)
			echo -e
			echo "Plug 'mhartington/oceanic-next'" >> "$cartella_plug"
			break
			;;
	esac
done

	echo -e "Did you install everithing you need or want to add something more?\n Back (1) I'm finish (2)\n"
	read finish
	if [ "$finish" == "2" ]; then
		echo "call plug#end()" >> "$cartella_plug"
		vim -c ":PlugInstall" -c "!sleep 1" -c ":q" $vimrc_file
		echo "colorscheme OceanicNext" >> "$vimrc_file"
	fi
done


echo -e "${azul}The .vimrc and the settings are correctly created. Well done!!${reset}"

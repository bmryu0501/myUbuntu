"Vundle Plugin
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

syntax on

"Colorscheme (gruvbox)
set bg=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"Encoding types
set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

"Vim settings
set hlsearch		"highlight searched
set nu rnu			"set line numbers (hybrid)
set autoindent		"auto indent
set cindent			"indent
set ts=4			"set tab spaces
set sts=4
set shiftwidth=4
set showmatch		"show matched brackets
set ruler			"show ruler
set scrolloff=8

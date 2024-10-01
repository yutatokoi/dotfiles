" Getting help: https://vimhelp.org/

" Set compatibility to Vim only
set nocompatible

" Automatically wrap text that extends beyond screen length
set wrap

" Show line numbers
set number

" Status bar
set laststatus=2

" Show matcing brackets
set showmatch

" Automatically save before commands like :next and :make
set autowrite

" Syntax highlighting
syntax on

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Show color column at 80 characters width
set colorcolumn=80

" Set shift width to 4 spaces
set shiftwidth=4

" Show file stats
set ruler

" Blink cursor on error instead of beeping.
set visualbell

" Reacts to the syntax/style of the code you are editing
set smartindent

" Makes sure that spaces are used for indenting lines, even when you press the "Tab" key
set expandtab

" This will insert 4 spaces for a line indent
set tabstop=4

" Manages the indentation when you use the ">>" or "<<" operators to add or remove indentation to an already existing line/block of code
set shiftwidth=4

" Show what mode you are currently editing in
set showmode

" Each time a new or existing file is edited, Vim will try to recognize the
" type of the file and set the 'filetype' option. This will trigger the
" FileType event, which can be used to set the syntax highlighting, set options, etc.
filetype on

" when a file is edited its plugin file is loaded (if there is one for the
" detected filetype).
filetype plugin on

" enable syntax highlighting
syntax on

" nice colors
colorscheme molokai


set hidden
set history=100
"set tabstop=4
"set shiftwidth=4
"set expandtab
"set smartindent
"set autoindent
"nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
set showmatch

" https://github.com/nickmccurdy/sane-defaults/blob/master/home/.vimrc


" columns
set textwidth=80
set colorcolumn=80

" show '>   ' at the beginning of lines that are automatically wrapped
set showbreak=>\ \ \

" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" 'tabstop' is used in other places. A <BS> will delete a 'shiftwidth' worth of
" space at the start of the line.
set smarttab

" When a file is edited its indent file is loaded (if there is one for the
" detected filetype). indent-expression
filetype indent on

" Automatically inserts one extra level of indentation in some cases, and works
" for C-like files
set smartindent

" Copy indent from current line when starting a new line (typing <CR> in Insert
" mode or when using the "o" or "O" command)
set autoindent

" show the filename in the window titlebar
set title

" set encoding
set encoding=utf-8

" mouse support
set mouse=a

" automatically load changed files
set autoread

" auto-reload vimrc
autocmd! bufwritepost vimrc source ~/.vim/vimrc

" line numbers
set number

" highlight cursor line, disabled since it interferes with spellcheck
" set cursorline

" Be able to arrow key and backspace across newlines
set whichwrap=bs<>[]

" enable completion
set ofu=syntaxcomplete#Complete

" make laggy connections work faster
set ttyfast

" let vim open up to 100 tabs at once
set tabpagemax=100

" case-insensitive filename completion
set wildignorecase

" Search
set hlsearch "when there is a previous search pattern, highlight all its matches
set incsearch "while typing a search command, show immediately where the so far typed pattern matches
set ignorecase "ignore case in search patterns
set smartcase "override the 'ignorecase' option if the search pattern contains uppercase characters
set gdefault "imply global for new searches

" Turn on spell check for certain filetypes automatically
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us
set complete+=kspell


" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=json syntax=javascript

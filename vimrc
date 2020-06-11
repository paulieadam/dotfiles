set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme gruvbox       " set colorscheme
set background=dark
hi Normal ctermbg=none    " make background non transparent from theme
set number                " show line numbers
set colorcolumn=80        " Show line at column 80
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set mouse=a
set splitright            " opens vsplit to the right of current buffer
set number relativenumber " turn hybrid line numbers on
set nu rnu                " turn hybrid line numbers on

" temporary vim files
set undodir=~/vimtempfilesdir/.undo//
set backupdir=~/vimtempfilesdir/.backup//
set directory=~/vimtempfilesdir/.swp//

" disable arrow keys and page scroll
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>

" Highlight line when in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

if &term =~ '256color'
      " disable Background Color Erase (BCE) so that color schemes
      " render properly when inside 256-color tmux and GNU screen.
      " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
      set t_ut=
endif

" Improved autocompletion
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
map <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
 \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
 \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Plug plugin manager
" https://github.com/junegunn/vim-plug
call plug#begin('~/dotfiles/vim/plugged')

" Plugins
Plug 'mattn/emmet-vim'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/AutoComplPop'
Plug 'airblade/vim-gitgutter'

call plug#end()

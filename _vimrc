execute pathogen#infect()
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set langmenu=en_US
let $LANG = 'en_US'
let mapleader=";"

filetype off
syntax on
filetype plugin indent on
syntax enable
colorscheme seoul256
"colorscheme wal

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif

function! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/
    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'
    " Liquid single line. Look for "{%[anything]%}"
    syn match liquid '{%.*%}'
    " Liquid multiline. Look for "{%[anything]%}[anything]{%[anything]%}"
    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
    " Fenced code blocks, used in GitHub Flavored Markdown (GFM)
    syn region highlight_block start='```' end='```'

    "" Actually highlight those regions.
    hi link math Statement
    hi link liquid Statement
    hi link highlight_block Function
    hi link math_block Function
endfunction

" Call everytime we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()

"highlight Comment cterm=italic



"# LISTA DE PLUGINS
"
"ultisnips
"vimñsnippets
"vim-dokumentary
"vim-surround
"vimtex

"agrega matchit: circula entre bloques con %
packadd! matchit 


let python_highlight_all = 1

set writebackup
set smartcase
set splitright
set path+=**
set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set scrolloff=6 
set autoindent
set showmode
set ruler
set matchtime=1
set mouse=a
set incsearch
set laststatus=2
set statusline=%<%f\ \ @\ %F\ \ %h%m%r%=%-14.(%l,%c%V%)\ %P
"podes usar backspace sin parar
set backspace=indent,eol,start
"expand tab en command
set wildmode=longest,full

set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END



" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


"#####MAPEOS#####

"usa S para reemplazar
nnoremap S :%s//g<Left><Left>

"abre y cierra goyo
nmap <F2> :Goyo 100<CR>
nmap <F3> :Goyo!<CR>

"hv para help vertical
cmap vh vert h 

"borra toda una palabra en insert
nnoremap <S-BS> <C-w>
inoremap ;shp #!/usr/bin/env python

"deja hacer las cosas cuando tipeas rápido
cnoreabbrev W w
cnoreabbrev Q q

"usa H para buscar info con plugin better K y M para unir líneas
nnoremap H K
nnoremap M J

"usa J y K para mover entre parrafos
nnoremap J 6j
nnoremap K 6k

"usa Y para copiar hasta el final de linea como D y A
nnoremap Y y$

"P es poner al final
noremap P $p

"linea en blanco
nnoremap ñ o<Esc>
nnoremap Ñ O<Esc>

"usa Ctrl-u para rehacer 
noremap <C-u> <C-r>

"F9 para repasar spelling
nnoremap <F9> :silent setlocal spell! spelllang=es,en<CR>

"agarra la letra bajo el cursor y la vuelve a poner con tilde
"nnoremap <silent> ´ s<c-r>"<bs>'<esc>
nnoremap <silent> ´ s<c-r>=tr(@", 'aeioucnAEIOUCNáéíóúçñÁÉÍÓÚÇÑ', 'áéíóúçñÁÉÍÓUÇÑaeioucnAEIOUCN')<cr><esc>

"corta el undo tree en cada punto, asi no se borra todo con un u
autocmd Filetype markdown inoremap . .<c-g>u

"seleccionar todo y copiarlo
nnoremap <C-a> gg<S-v>G"+y

"ejecuta el archivo actual
autocmd Filetype markdown map <F5> :w <bar> !pandoc<space><C-r>%<space>--pdf-engine=pdflatex<space>-o<space><C-r>%.pdf<Enter>
autocmd Filetype python map <F5> :w <bar> !python<space><C-r>%<space><Enter>
map <leader>p :!zathura <c-r>%.pdf &<CR><CR>
    
"# MAPEOS MARKDOWN - LATEX 

inoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l
map <Tab><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gg <++><Esc>a

autocmd Filetype mkd,markdown inoremap { {}<++><Esc>F}i
autocmd Filetype mkd,markdown inoremap $ $$<Esc>i

autocmd Filetype mkd,markdown inoremap ;f \frac{}{<++>}<++><Esc>2F{a

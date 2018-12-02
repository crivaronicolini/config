execute pathogen#infect()
set nocompatible
set langmenu=en_US
let $LANG = 'en_US'
let mapleader=";"

filetype off
syntax on
filetype plugin indent on
syntax enable
set background=light
colorscheme PaperColor


"highlight Comment cterm=italic
let g:rainbow_active = 1
"cosas de python
let python_highlight_all = 1
"pone netrw en modo arbol
let g:netrw_liststyle=3
"autocmd Filetype python set omnifunc=python3complete#Complete
setlocal omnifunc=jedi#completions

set incsearch
set noshowmode
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
set ruler
set matchtime=1
set mouse=a
set laststatus=2
" set statusline=%<%f\ \ @\ %F\ \ %h%m%r%=%-14.(%l,%c%V%)\ %P
"podes usar backspace sin parar
set backspace=indent,eol,start
"expand tab en command
set wildmode=longest,full



if has('nvim')
    "ir a ventana con C-direccion
    tmap <C-h> <C-\><C-n><C-w>h
    tmap <C-j> <C-\><C-n><C-w>j
    tmap <C-k> <C-\><C-n><C-w>k
    tmap <C-l> <C-\><C-n><C-w>l
    "Control i es esc
    tnoremap <C-i> <C-\><C-n>
    "C-y y la direccion de la ventana manda el texto
    tmap <C-y>h <Up><C-\><C-n>yy<C-h>Gp
    tmap <C-y>j <Up><C-\><C-n>yy<C-j>Gp
    tmap <C-y>k <Up><C-\><C-n>yy<C-k>Gp
    tmap <C-y>l <Up><C-\><C-n>yy<C-l>Gp
endif
" <C-l><Down><Down>a 
" <C-k><Down><Down>a 
" <C-j><Down><Down>a 
" <C-h><Down><Down>a 

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


"#####MAPEOS#####

"usa lead y d para copiar y pegar al portapapeles
nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d

"usa lead p para pegar
nnoremap <Leader>p :set paste<CR>"+p:set nopaste<CR>
nnoremap <Leader>P :set paste<CR>"+P:set nopaste<CR>
vnoremap <Leader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <Leader>P :set paste<CR>"+P:set nopaste<CR>


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
nnoremap <silent> ´ s<c-r>=tr(@", 'aeioucnAEIOUCNáéíóúçñÁÉÍÓÚÇÑ', 'áéíóúçñÁÉÍÓUÇÑaeioucnAEIOUCN')<cr><esc>

"saca el highlight
nnoremap <silent> <F4> :noh<CR>

"corta el undo tree en cada punto, asi no se borra todo con un u
autocmd Filetype markdown inoremap . .<c-g>u

"ejecuta el archivo actual
autocmd Filetype markdown map <F5> :w <bar> !pandoc<space><C-r>%<space>--pdf-engine=pdflatex<space>-o<space> %:r.pdf<CR><CR>
autocmd! BufWritePost _vimrc source %
autocmd Filetype python map <F5> :w <bar> !python3<space><C-r>%<space><Enter>

map <leader>o :!zathura <c-r>%.pdf >/dev/null 2>&1 &<CR><CR>
    
"# MAPEOS MARKDOWN - LATEX 

"inoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l
"vnoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l
"map <Tab><Tab> <Esc>/<++><Enter>"_c4l
"inoremap ;gg <++><Esc>a

autocmd Filetype mkd,markdown inoremap { {}<++><Esc>F}i
autocmd Filetype mkd,markdown inoremap $ $$<Esc>i
autocmd Filetype mkd,markdown inoremap ;f \frac{}{<++>}<++><Esc>2F{a

"tips"
":%y+" copia todo el buffer


"FUNCIONES
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


set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END


" air-line
let g:airline_theme='wal'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

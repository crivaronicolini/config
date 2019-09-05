execute pathogen#infect()
set nocompatible
set langmenu=en_US
let $LANG = 'en_US'
let mapleader=" "

"""COLOR"""
filetype off
syntax on
filetype plugin indent on
syntax enable
set background=light
colorscheme PaperColor
"""COLOR"""

"""""SETTINGS"""""
"highligh de python en markdown
let g:markdown_fenced_languages = ['python']
let g:pandoc#syntax#codeblocks#embeds#langs = ['python']

"para hacer que el output de python se vea
let $PYTHONUNBUFFERED=1
let g:asyncrun_open=8

"highlight Comment cterm=italic
let g:rainbow_active = 1

"cosas de python
let python_highlight_all = 1

"pone netrw en modo arbol
let g:netrw_liststyle=3
"autocmd Filetype python set omnifunc=python3complete#Complete
" setlocal omnifunc=jedi#completions

" Give me a prompt instead of just rejecting risky :write, :saveas
set confirm

" Break lines at word boundaries
set linebreak

" Show search matches as I type my pattern
set incsearch
set noswapfile
set ttyfast
set noshowmode
set writebackup
set smartcase
set path+=**
set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set scrolloff=6
set autoindent
set matchtime=1
set mouse=a
set laststatus=2
set backspace=indent,eol,start

"wildmode settings
"set wildmenu
set wildmode=longest,full
silent! set wildignorecase  " Case insensitive, if supported

" New windows go below or to the right of a split
set splitbelow splitright

" Don't assume I'm editing C; let the filetype set this
set include=

" Keep much more command and search history
set history=2000

" Delete comment leaders when joining lines, if supported
silent! set formatoptions+=j

" Don't wait for a key after Escape in insert mode
silent! set noesckeys

" Try to keep undos in one dir
set undolevels=1000
set undofile
set undodir^=~/.vim/cache/undo

" Try to keep backups in one system-appropriate dir
set backup
set backupdir^=~/.vim/cache/backup
"""""SETTINGS"""""



" easier navigation between split windows
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

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Window Resizing {{{
" right/up : bigger
" left/down : smaller
nmap <S-Right> :vertical resize +3<cr>
nmap <S-Left> :vertical resize -3<cr>
nmap <S-Up> :resize +3<cr>
nmap <S-Down> :resize -3<cr>

"""""MAPEOS"""""

" Cycle through buffers
nnoremap {b :bprevious<CR>
nnoremap }b :bnext<CR>
nnoremap <Leader>b :b#<CR>
" Cycle through quicklist/:helpgrep items
nnoremap {c :cprevious<CR>
nnoremap }c :cnext<CR>

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

" \DEL deletes the current buffer
nnoremap <Leader><Bslash> :bdelete<CR>
" \INS edits a new buffer
nnoremap <Leader><CR> :<C-U>enew<CR>

" \g changes directory to the current file's location
nnoremap <Leader>c :<C-U>cd %:h<CR>:pwd<CR>

" Lead u pone el UndoTree
nnoremap <Leader>u :UndotreeToggle<CR>

" \R reloads ~/.vimrc
nnoremap <Leader>R :<C-U>source $MYVIMRC<CR><CR>

" \? types :helpgrep for me ready to enter a search pattern
nnoremap <Leader>? :<C-U>helpgrep \c<S-Left>

"usa S para reemplazar
nnoremap <Leader>S :%s//g<Left><Left>
nnoremap <Leader>s :s//g<Left><Left>

"abre y cierra goyo
nmap <Leader>g :Goyo<CR>
" nmap <F3> :Goyo!<CR>

"hv para help vertical
cmap vh vert h

"borra toda una palabra en insert
nnoremap <S-BS> <C-w>

"shebang python
nnoremap <Leader>hp #!/usr/bin/env python3

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
autocmd Filetype markdown inoremap ¿ `



"ejecuta el archivo actual
autocmd Filetype markdown map <F5> :!clear<CR><CR> :w<bar>!pandoc <C-r>% --pdf-engine=pdflatex -o %:p:h/pdf/%:r.pdf --variable urlcolor=blue -V geometry:margin=1in<CR>

autocmd BufNewFile,BufReadPost *.pmd set filetype=pweave syntax=pweave

autocmd Filetype pweave map <F5> :w <bar>:!pweave -o %:r.md -f markdown %<CR>:!pandoc <C-r> %:r.md --pdf-engine=pdflatex -o  %:p:h/pdf/%:r.pdf<CR>

autocmd! BufWritePost _vimrc source %

autocmd Filetype python map <F5> :w <bar> AsyncRun python3 %<CR> 
":!clear<CR><CR> :w <bar> !python3<space><C-r>%<space><Enter>

map <leader>o :!zathura %:p:h/pdf/%:r.pdf >/dev/null 2>&1 &<CR><CR>

"tips"
":%y+" copia todo el buffer


"FUNCIONES
" function! MathAndLiquid()
"     "" Define certain regions
"     " Block math. Look for "$$[anything]$$"
"     syn region math start=/\$\$/ end=/\$\$/
"     " inline math. Look for "$[not $][anything]$"
"     syn match math_block '\$[^$].\{-}\$'
"     " Liquid single line. Look for "{%[anything]%}"
"     syn match liquid '{%.*%}'
"     " Liquid multiline. Look for "{%[anything]%}[anything]{%[anything]%}"
"     syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
"     " Fenced code blocks, used in GitHub Flavored Markdown (GFM)
"     syn region highlight_block start='```' end='```'

"     "" Actually highlight those regions.
"     hi link math Statement
"     hi link liquid Statement
"     hi link highlight_block Function
"     hi link math_block Function
" endfunction

" " Call everytime we open a Markdown file
" autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()



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

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

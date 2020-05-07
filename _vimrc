let mapleader=" "

"""COLOR"""
filetype off
syntax on
filetype plugin indent on
syntax enable
set background=dark
colorscheme PaperColor
"""""""""""

call plug#begin()
Plug 'justinmk/vim-sneak'
Plug 'Shougo/echodoc.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/goyo.vim'
" Plug 'autozimu/LanguageClient-neovim', {'branch':'next', 'do': 'bash install.sh',}
Plug 'ptzz/lf.vim'
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-path'
Plug 'kassio/neoterm'
Plug 'roxma/nvim-yarp'
Plug 'felixhummel/setcolors.vim'
Plug 'mgedmin/taghelper.vim'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-commentary'
Plug 'Konfekt/vim-CtrlXA'
Plug 'tpope/vim-fugitive'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'fs111/pydoc.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"""""SETTINGS"""""

"""""PLUGINS"""""
let g:pydoc_open_cmd = 'vsplit'

let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
highlight link EchoDocFloat Pmenu

"deje de usar coc y nm2 porque encontre que C_x C_o funciona 
"mejor :h ins-complietion

"""coc
" let g:coc_global_extensions = ['coc-python']

" function! s:check_back_space() abort
" let col = col('.') - 1
" return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<Tab>" :
"     \ coc#refresh()

" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" if exists('*complete_info')
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
" imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
"""

"""ncm2
" call ncm2#override_source('LanguageClient_python', {'enable': 0})
" autocmd FileType python autocmd BufEnter * call ncm2#enable_for_buffer()
" let g:python3_host_prog = '/usr/bin/python3'
" set shortmess+=c
" let g:ncm2#auto_popup=0
" " Use <TAB> to select the popup menu:
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" imap <silent><expr> <TAB>
"             \ pumvisible() ?  "\<C-n>" :
"             \ <SID>check_back_space() ? "\<TAB>" :
"             \ "\<Plug>(ncm2_manual_trigger)"
" function! s:check_back_space() abort ""
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
" endfunction ""
" au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
" au User Ncm2PopupClose set completeopt=menuone
"""
let g:sneak#s_next = 1

let g:no_plugin_maps = 1

"highligh de python en markdown
let g:markdown_fenced_languages = ['python']
let g:pandoc#syntax#codeblocks#embeds#langs = ['python']

let g:semshi#error_sign_delay = 2

"para hacer que el output de python se vea
let $PYTHONUNBUFFERED=1

let g:neoterm_default_mod='vertical' " open terminal in bottom split
let g:neoterm_size=66 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command

let g:rainbow_active = 1

"cosas de python
let python_highlight_all = 1

let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1
let g:asyncrun_open=8
let g:asyncrun_trim=1

" let g:asyncrun_exit = "silent call system('afplay ~/.vim/notify.wav &')"
" let g:asyncrun_status = ''

let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
let g:float_preview#docked = 0

set hidden
set autowriteall
set number
set confirm
set linebreak
set incsearch
set noswapfile
set ttyfast
set lazyredraw
set noshowmode
set writebackup
set smartcase
set path+=**
set breakindent
set expandtab
set textwidth=0
set tabstop=8
set softtabstop=4
set shiftwidth=4
set scrolloff=12
set autoindent
set matchtime=1
set mouse=a
set laststatus=2
set backspace=indent,eol,start
set inccommand=nosplit
set completeopt-=preview
set wildmode=longest,full
set virtualedit=block,onemore
silent! set wildignorecase  " Case insensitive, if supported
set splitright
set include=
set history=500
" Delete comment leaders when joining lines, if supported
set formatoptions+=j
set formatoptions-=j
silent! set noesckeys

set undolevels=500
set undofile
set undodir^=/home/marco/.vim/cache/undo
set backup
set backupdir^=/home/marco/.vim/cache/backup

"para que vim recuerde donde quedo
set viminfo='1000,f1,:100,%

runtime macros/matchit.vim

"""""MAPPINGS"""""
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1500) . 'm'
  call matchdelete(ring)
  redraw
endfunction

nnoremap <leader>w :TREPLSendLine<CR>j
vnoremap <leader>w :TREPLSendSelection<CR>

"ir a ventana con C-direccion
" tmap <C-j> <C-\><C-n><C-w>j
" tmap <C-k> <C-\><C-n><C-w>k
tmap <C-h> <C-\><C-n><C-w>h
tmap <C-l> <C-\><C-n><C-w>l

" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Window Resizing
nmap <S-Right> :vertical resize +3<cr>
nmap <S-Left> :vertical resize -3<cr>
nmap <S-Down> :resize +3<cr>
nmap <S-Up> :resize -3<cr>

" Cycle through buffers
nnoremap <silent>{ :bprevious<CR>
nnoremap <silent>} :bnext<CR>
nnoremap <Leader><Leader> <C-^>
nnoremap <silent><Leader>b :b <C-d>
nnoremap <silent><Leader>q :Bclose<CR>

"usa lead y d para copiar y pegar al portapapeles
nnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d

"usa lead p para pegar
nnoremap <Leader>p :set paste<CR>"+]p:set nopaste<CR>
nnoremap <Leader>P :set paste<CR>"+]P:set nopaste<CR>
vnoremap <Leader>p :set paste<CR>"+]p:set nopaste<CR>
vnoremap <Leader>P :set paste<CR>"+]P:set nopaste<CR>

"repite el ultimo macro
nnoremap Q @@

" \g changes directory to the current file's location
nnoremap <Leader>c :<C-U>cd %:h<CR>:pwd<CR>
nnoremap <silent><Leader>C :let @+=expand('%:p:h')<CR>

" Lead u pone el UndoTree
nnoremap <Leader>u :UndotreeToggle<CR>

" \R reloads ~/.vimrc
nnoremap <silent> <Leader>R :<C-U>source $MYVIMRC<CR><CR>

" \? types :helpgrep for me ready to enter a search pattern
nnoremap <Leader>? :<C-U>helpgrep \c<S-Left>

"usa S para reemplazar
nnoremap <Leader>S :%s//g<Left><Left>
nnoremap <Leader>s :s//g<Left><Left>

"abre y cierra goyo
nmap <F2> :Goyo<CR>

"abre quickfix
noremap <silent><F3> :call asyncrun#quickfix_toggle(8)<cr>

"hv para help vertical
cmap vh vert h

nmap <silent> <leader>e :Semshi goto error<CR>
" nmap <silent> <leader>f :Semshi goto function next<CR>
" nmap <silent> <leader>F :Semshi goto function prev<CR>

"mi primer fncion, pone python a todos los bloques de texto de un .md
function! Fence_python()
    let l:save = winsaveview()
    let a=['','python']
    %s/```\zs/\=reverse(a)[0]/g
    call winrestview(save)
endfunction

nnoremap <Leader>x :call Fence_python()<cr>

"abre el archivo en el debugger
function! Go_pdb()
    let a=expand('%')
    execute 'vsplit term://zsh'
    call chansend(b:terminal_job_id, 'ipython -m ipdb ' . a . "\n sticky \n")
    normal i
endfunction

nnoremap <Leader>c :call Go_pdb()<cr>


"suena la campana de AsyncRun dependiendo el estado
function! Ring_bell()
    if g:asyncrun_status == 'succes'
        silent call system('cvlc --play-and-exit ~/.vim/success_asyncrun.mp3 &')
    elseif g:asyncrun_status == 'failure'
        silent call system('cvlc --play-and-exit ~/.vim/error_asyncrun.mp3 &')
    endif
endfunction

let g:asyncrun_exit = 'silent call Ring_bell()'

"deja hacer las cosas cuando tipeas rápido
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa

"usa H para buscar info con plugin better K y M para unir líneas
nnoremap <silent> H K<CR>
nnoremap M J

"ctrl f para subir media pantalla, devuelve el ctrl u que uso para 
"redo y es mas comodo para usar junto con ctrl d
" nnoremap <C-f> <C-u>
"
" que tal si en vez de eso uso ctrl k y j
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>

"usa J y K para mover entre parrafos
nnoremap K 6k
nnoremap J 6j
vnoremap K 6k
vnoremap J 6j

"usa Y para copiar hasta el final de linea como D y A
nnoremap Y y$

"P es poner al final
noremap P $p

"linea en blanco
nnoremap ñ o<Esc>
nnoremap Ñ O<Esc>

"vuelve a seleccionar cuando cambias la indentacion
vnoremap < <gv
vnoremap > >gv

"usa Ctrl-u para rehacer
noremap <C-u> <C-r>

"F9 para repasar spelling
nnoremap <F9> :silent setlocal spell! spelllang=es,en<CR>

"agarra la letra bajo el cursor y la vuelve a poner con tilde, es hermoso
nnoremap <silent> ´ s<c-r>=tr(@", 'aeioucnAEIOUCNáéíóúçñÁÉÍÓÚÇÑ', 'áéíóúçñÁÉÍÓUÇÑaeioucnAEIOUCN')<cr><esc>

"saca el highlight
nnoremap <silent> <F4> :noh<CR>

"abre el archivo actual en pdf
map <leader>o :!zathura %:p:h/pdf/%:r.pdf >/dev/null 2>&1 &<CR><CR>
"pone marcas en el ultimo archivo visitado de esa extension
autocmd BufWritePost vimrc,*.vim                normal! mV
autocmd BufWritePost *.md                       normal! mM
autocmd BufWritePost *.py                       normal! mP
autocmd BufWritePost *.css,*.less,*.scss        normal! mC
autocmd BufWritePost *.html                     normal! mH
autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx      normal! mJ

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



" air-line
let g:airline_theme='solarized_flood'
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
let g:airline_symbols.linenr = '☰'
let g:airline_section_x = '%{taghelper#curtag()}'
let g:airline_section_y = ''
let g:airline_section_z = 'ln %l/%L'

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

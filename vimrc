" Este vimrc é um fork do https://github.com/InFog/meuvim
set nocompatible
filetype off

let mapleader=","

" Estou usando o Vundle para gerenciar os bundles
set rtp+=~/.vim/meuvim/bundle/vundle/
call vundle#rc()

" Agora os bundles
" Navegador para os buffers abertos
Bundle 'vim-scripts/bufexplorer.zip'

" Adiciona opções para apagar, selecionar, etc dentro de tags, aspas, etc.
Bundle 'tpope/vim-surround'

" O melhor wrapper Git de todos os tempos =P
" Bundle 'tpope/vim-fugitive'
" Mostrando adições, remoções e alterações do Git
Bundle 'airblade/vim-gitgutter'

" Adiciona tags html e mais umas coisinhas para o %
Bundle 'vim-scripts/matchit.zip'

" Snippets, este é meu fork
Bundle 'InFog/snipmate.vim'

" Melhora os temas para terminais
Bundle 'godlygeek/csapprox'

" Integração com o Twig
" Bundle 'evidens/vim-twig'

" Números das linhas relativo no modo normal e absoluto no modo insert
Bundle 'myusuf3/numbers.vim'
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa
cnoreabbrev W w
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev Wq wq
cnoreabbrev Se se
cnoreabbrev SE se
cnoreabbrev sE se
nnoremap ; :
vnoremap ; :

" HTML5
Bundle 'othree/html5.vim'

" CSS3
Bundle 'hail2u/vim-css3-syntax'

" Sintaxe Tubaína (Casa do Código)
Bundle 'vinibaggio/vim-tubaina'

"Auto generate html5
Bundle 'mattn/emmet-vim'

" Nerdtree
Bundle 'scrooloose/nerdtree'
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeFind<CR>
" Go Lang
"
" Adicionar no bashrc/zshrc:
" export GOROOT=$HOME/.go
" export PATH=$PATH:$GOROOT/bin
"
" Depois
" go get github.com/nsf/gocode
Bundle 'Blackrush/vim-gocode'

" Exibe os espaços em branch no final de linhas
Bundle 'bronson/vim-trailing-whitespace'

" Blade
Bundle 'xsbeats/vim-blade'

"Toggle comentário: gcc gC(Visual mode)
Bundle 'tComment'

" Esquemas de cores
" Bundle 'altercation/vim-colors-solarized'
Bundle 'spf13/vim-colors'
Bundle 'baskerville/bubblegum'
Bundle 'lsdr/monokai'
Bundle 'ChrisKempson/Vim-Tomorrow-Theme'
Bundle 'gmarik/ingretu'
Bundle 'flazz/vim-colorschemes'

" Abaixo estão os Bundles que precisam de algumas opções/personalizações "

" TagList: Lista de classes e métodos em um arquivo
Bundle 'vim-scripts/taglist.vim'
nnoremap <leader>l :TlistToggle<CR>
let Tlist_Use_Right_Window=1            " Lista de tags à direita
let Tlist_GainFocus_On_ToggleOpen=1     " Ganhar foco
let Tlist_File_Fold_Auto_Close=1        " Não exibe tags de buffers inativos
let Tlist_Sort_Type="name"              " Ordenar pelo nome e não pela ordem no arquivo
let Tlist_Close_On_Select=1             " Fecha a taglist após selecionar uma tag
" Escondendo itens no TagList para PHP
let tlist_php_settings='php;c:Classes;f:Functions'

" Airline: Linha de status bem completa, tem até git.
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
" let g:airline_theme='bubblegum'
let g:airline_theme='cool'
let g:airline_powerline_fonts=1
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline_detect_paste=1

" CtrlP: Pesquisa arquivos e diretórios
Bundle 'kien/ctrlp.vim'
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPMRU<CR>
let g:ctrlp_working_path_mode='' "Pesquisa a partir do diretório atual no Vim.

Bundle 'tacahiroy/ctrlp-funky'
let g:ctrlp_extensions = ['funky'] "Pesquisa funções
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Markdown: Sintax highlight para markdown
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

" PDV: Facilita a adição de Docblocks no PHP
Bundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
nnoremap <leader>doc :call PhpDocSingle()<CR>
vnoremap <leader>doc :call PhpDocRange()<CR>

" Syntastic: Verifica sintaxe e exibe erros
Bundle 'scrooloose/syntastic'
let g:syntastic_php_checkers=['php']
" let g:syntastic_phpcs_conf='--standard=DrupalCodingStandard'
" let g:syntastic_phpcs_disable=1
" Exemplo
" let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

" VDebug: usa o protocolo DBGP (xdebug e outros)
Bundle 'joonty/vdebug'
let g:vdebug_options = {'server': '0.0.0.0'}
"
" VDebug for xdebug (PHP)
" xdebug.remote_autostart = On
" xdebug.remote_enable = On
" xdebug.remote_host = localhost
" xdebug.remote_port = 9000

" Matchmaker: Destaca as palavras iguais
Bundle 'qstrahl/vim-matchmaker'
let g:matchmaker_enable_startup = 1

" Bundle 'bs/vim-cowsay' "pass git must be ok
set shortmess=I " Read :help shortmess for everything else.


"
" Daqui para baixo são as minhas opções
"
syntax enable       " Habilita a marcação de sintaxe

" Persistent undo
if has('persistent_undo')
    set undodir=~/.vimundo      " Diretório de gravação do undo
    set undofile                " desfazer persistente
    set undolevels=1000         " número de alterações para desfazer
    set undoreload=10000        " número de linhas do undo no reload de um buffer
endif

set nobackup
set noswapfile      " Eu não uso os arquivos de swap e backup...

set hidden          " Pode esconder buffers não salvos.

set encoding=utf-8
set showmode        " Exibe o modo atual
set wildmenu        " Menu com as opções do vim usando tab
set background=dark " Define o fundo preto (É melhor usar isso com a sintaxe)
set nu              " Mostra o número de linhas
set ai              " Faz o auto tab/auto indent
set ts=2            " tab vale 4 espaços
set sw=2            " tab com 4 espaços
set softtabstop=2   " Operações como o backspace também com 4 espaços
set et              " Troca tabs por espaços
set ruler           " Mostra a posição do cursor
set cursorline      " Destaca a linha atual
set laststatus=2    " Sempre exibe a barra de status
set clipboard=unnamedplus   " Copia do vim para o clipboard
set lazyredraw
set autoread        " Recarrega arquivos alterados em disco automaticamente

"set tw=80           " Define a largura do texto como 80 caracteres
" set tw=120           " Define a largura do texto como 120 caracteres
" set colorcolumn=120  " Deixa a coluna 120 colorida
set colorcolumn=80  " Deixa a coluna 120 colorida
set incsearch       " Pesquisa incremental
set hlsearch        " Highligth search :)
nnoremap <leader>h :noh<CR> " Desabilita o highlight search
set ignorecase      " Pesquisa ignora caixa alta e baixa
set smartcase       " Pesquisa considera caixa alta apenas se ouver uma ou mais maiúsculas na pesquisa
" Mapas, atalhos, etc
"
" Limpando a pesquisa
nmap <silent> ,/ :nohlsearch<CR>

" File explorer
map <leader>t :Explore<CR>
map <leader>T :split<CR> :Explore<CR>

" Sem setas.
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>

" Abas, uso bastante
nmap <silent> tn :tabnew<CR>
nmap <silent> tq :tabclose<CR>

" Opções para que blocos selecionados sejam reselecionados após identações.
" Ajuda muito na hora de identar grandes e confusos blocos =)
vnoremap < <gv
vnoremap > >gv

:filetype plugin on
:filetype plugin indent on

nnoremap <leader>w :%s/\s\+$//<CR>

" Para as cores funcionarem bem é preciso usar 256 cores no terminal.
" No bashrc, zshrc ou similar, faça algo como
" export TERM="xterm-256color"

" Cores a considerar:
" colo zenburn
let g:solarized_termcolors=256
" colorscheme obsidian2
colorscheme monokai-mine
" colorscheme calmar256-dark
" colorscheme tesla
" colorscheme railscasts
" Definindo sintaxe PHP para arquivos com a extensão 'thtml'.
au BufNewFile,BufRead *.thtml setfiletype php
set t_Co=256

"Find no arquivo atraves da selecao visual e pressionando //
vnorem // y/<c-r>"<cr>

"XML Autofolding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

"JSON Formatter
" exe python -m json.tool


"source from http://amix.dk/vim/vimrc.html
function! CmdLine(str)
        exe "menu Foo.Bar :" . a:str
        emenu Foo.Bar
        unmenu Foo
endfunction

function! VisualSelection(direction) range
        let l:saved_reg = @"
            execute "normal! vgvy"

            let l:pattern = escape(@", '\\/.*$^~[]')
            let l:pattern = substitute(l:pattern, "\n$", "", "")

            if a:direction == 'b'
                execute "normal ?" . l:pattern . "^M"
            elseif a:direction == 'gv'
                call CmdLine("vimgrep " . '/'. l:pattern . '/gj' . ' **/* |copen')
            elseif a:direction == 'replace'
                call CmdLine("%s" . '/'. l:pattern . '/')
            elseif a:direction == 'f'
                execute "normal /" . l:pattern . "^M"
            endif

            let @/ = l:pattern
            let @" = l:saved_reg
endfunction

function! RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
          \ '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>


" s/ [a-zA-Z]\+$/\r&/gc  quebra linha na ultima palavra
" %s/\(.\{120\}\)/\1\r/gc queba linha na posicao 120

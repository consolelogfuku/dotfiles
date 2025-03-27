"===== 表示設定 =====
set number "行番号の表示
set laststatus=2 "ステータスを表示
syntax on "コードに色をつける
" Esc2回でハイライトOFF
nnoremap <ESC><ESC> :nohl<CR>
" ターミナルのカラースキームを優先
colorscheme vim
set notermguicolors " 256色の制限されたカラーパレット を使用

"===== 文字、カーソル設定 =====
set fenc=utf-8 "文字コードを指定
set whichwrap=b,s,h,l,<,>,[,],~ "行頭、行末で行のカーソル移動を可能にする
set backspace=indent,eol,start "バックスペースでの行移動を可能にする
set list "不可視文字を可視化
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮ "不可視文字の指定
set expandtab "タブをスペースに変換する
set autoindent "自動インデント
set smartindent "オートインデント
set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
set tabstop=2 "インデントをスペース2つ分に設定
set shiftwidth=2 "indentの幅をスペース2つ分に設定

"===== モードによってカーソルを変更 =====
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"===== Visual mode時のカラースキームを変更 =====
" highlight Visual ctermbg=24 ctermfg=white
highlight Visual ctermbg=blue ctermfg=white

"===== キー入力 =====
"ノーマルモード時に文頭・文末に移動するキーを変更
nnoremap <C-h> ^
nnoremap <C-l> $
" ノーマルモード/ビジュアルモードで、画面移動キーを変更
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>
vnoremap <C-k> <C-u>
vnoremap <C-j> <C-d>
"redoをUで実行
" nnoremap U <c-r>
"jキーを二度押しでESCキー
inoremap <silent> jj <Esc>
inoremap <silent> っj <Esc>
" Cnt+dで一文字前を消す
inoremap <C-d> <C-h>
"入力モード時にcontrolキーを押しながら、h,j,k,lでカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" ビジュアルモードの時に、文頭・文末に移動するキーを変更
vnoremap <C-l> $
vnoremap <C-h> ^
" ビジュアルモード時に,で全選択する
vnoremap , <Esc>ggVG

"===== 検索設定 =====
set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする

"===== コマンド補完 =====
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

"===== クリップボードへの登録 =====
set clipboard=unnamed

"===== クリップボードからのペースト設定 =====
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
"===== Undoの永続化 =====
if has('persistent_undo')
  let undo_path = expand('~/.vim/undo')
  exe 'set undodir=' .. undo_path
  set undofile
endif

"===== プラグイン =====
call plug#begin()
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'mechatroner/rainbow_csv'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
call plug#end()

"===== プラグインの設定 =====
" fzfのエイリアス
command! F Files
command! R Rg

" gitプラグインのエイリアス
command! GD GitGutterDiffOrig
command! GB Git blame

" airline
let g:airline_theme = 'papercolor'

" なんの設定か忘れた
vnoremap / :'<,'>Commentary<CR>
set updatetime=250

" gitgutter
let g:gitgutter_highlight_linenrs = 1

" vim-horizon
  " set termguicolors
  " colorscheme horizon
  " " lightline
  " let g:lightline = {}
  " let g:lightline.colorscheme = 'horizon'
  " " or this line
  " let g:lightline = {'colorscheme' : 'horizon'}

" coc
inoremap <silent><expr> <C-j>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<C-j>" :
    \ coc#refresh()
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" cocとaleの連携
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 1

" 末尾ハイライトの設定
" highlight ExtraWhitespace ctermbg=ここに設定

" RainbowToggle
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\   'guifgs': ['violet', 'lime', 'deepskyblue', 'yellow'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'guis': [''],
\   'cterms': [''],
\   'operators': '_,_',
\   'parentheses': [
\       'start=/(/ end=/)/ fold',
\       'start=/\[/ end=/\]/ fold',
\       'start=/{/ end=/}/ fold'
\   ],
\   'separately': {
\       '*': {},
\       'markdown': {
\           'parentheses_options': 'containedin=markdownCode contained',
\       },
\       'lisp': {
\           'guifgs': ['cyan', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'haskell': {
\           'parentheses': [
\               'start=/(/ end=/)/ fold',
\               'start=/\[/ end=/\]/ fold',
\               'start=/\v\{\ze[^-]/ end=/}/ fold'
\           ],
\       },
\       'vim': {
\           'parentheses_options': 'containedin=vimFuncBody',
\       },
\       'perl': {
\           'syn_name_prefix': 'perlBlockFoldRainbow',
\       },
\       'stylus': {
\           'parentheses': [
\               'start=/{/ end=/}/ fold contains=@coloaableGroup'
\           ],
\       },
\       'css': 0,
\       'nerdtree': 0,
\   },
\ }



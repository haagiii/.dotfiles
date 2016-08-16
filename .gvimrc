colorscheme koehler

set number
set ruler
set cursorline
set smartindent
set showmode
set shiftwidth=4
set softtabstop =4
set visualbell t_vb =
set hlsearch
set expandtab

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集に関する設定:
" タブの画面上での幅
set tabstop=4
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

set ambiwidth=double

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

set nowritebackup
set nobackup
set noswapfile

" set autochdir
"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
" 行番号を非表示 (number:表示)
set number
" タブや改行を表示 (list:表示)
set nolist
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set notitle

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set guioptions+=a
set clipboard=unnamedplus
" set clipboard+=autoselect

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"escの連打で検索のハイライトを解除
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Esc><Esc> :nohlsearch<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"行末以降もビジュアル選択できるようにする
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set virtualedit=block

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"コマンドdlでラインが引けるようにする
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoreabbrev dl /*------------------------------------------*/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ノーマルモードでEnter改行
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <CR> o<ESC>

let &t_SI .= "\e[5 q"
let &t_EI .= "\e[1 q"

"autocmd FileType ruby
"setlocal omnifunc=rubycomplete#Complete


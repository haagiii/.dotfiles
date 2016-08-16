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

set nocompatible
filetype off

if has('vim_starting')
	set nocompatible               " Be iMproved

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'https://github.com/Shougo/neocomplete.git'
" NeoBundle 'git://github.com/Shougo/neocomplcache.git'
" NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'https://github.com/thinca/vim-quickrun.git'
NeoBundle 'https://github.com/liquidz/lein-vim.git'
NeoBundle 'YankRing.vim'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'Shougo/unite-outline.git'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-operator-surround'
NeoBundle 'thinca/vim-ft-clojure.git'
NeoBundle 'nathanaelkane/vim-indent-guides.git'
NeoBundle 'davidhalter/jedi-vim'
" 静的解析
NeoBundle 'scrooloose/syntastic'
" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'
" 自動で閉じる
NeoBundle 'tpope/vim-endwise'
NeoBundleLazy 'marcus/rsense', {
      \ 'autoload': {
      \   'filetypes': 'ruby',
      \ },
      \ }
NeoBundle 'supermomonga/neocomplete-rsense.vim', {
      \ 'depends': ['Shougo/neocomplete.vim', 'marcus/rsense'],
      \ }


NeoBundleLazy "davidhalter/jedi-vim", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"],
      \ },
      \ "build": {
      \   "mac": "pip install jedi",
      \   "unix": "pip install jedi",
      \ }
	  \}
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
	let g:jedi#auto_initialization = 1
    let g:jedi#auto_vim_configuration = 1
	" jediにvimの設定を任せると'completeopt+=preview'するので
	" 自動設定機能をOFFにし手動で設定を行う
	let g:jedi#auto_vim_configuration = 0
	" 補完の最初の項目が選択された状態だと使いにくいためオフにする
	let g:jedi#popup_select_first = 0
	" quickrunと被るため大文字に変更
	let g:jedi#rename_command = '<Leader>R'
	" gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
	let g:jedi#goto_command = '<Leader>G'

let g:quickrun_config = {}
let g:quickrun_config._={
      \ 'outputter/buffer/split': ':botright'
      \ }

" -------------------------------
" Rsense
" -------------------------------
" let g:rsenseHome = '/home/kouji/.rbenv/shims/rsense'
let g:rsenseUseOmniFunc = 1
" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" インデントのカラー表示
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
endfunction

call neobundle#end()

" Required:
filetype plugin indent on

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#force_overwrite_completefunc = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#max_list = 10

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"

" setting of VimFiler
let g:vimfiler_as_default_explorer = 1
nnoremap <C-f> :VimFilerCurrentDir<CR>
inoremap <C-f> <ESC>:VimFilerCurrentDir<CR>

" rainbow_parentheses.vimの括弧の色付けを有効化
" au VimEnter,ColorScheme * RainbowParenthesesToggle
au ColorScheme * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" docstringは表示しない
autocmd FileType clojure setlocal completeopt-=preview
autocmd FileType python setlocal completeopt-=preview


au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Firefox'


" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete



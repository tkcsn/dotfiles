let mapleader = ","

""""""""""""""""""""""""
" NeoBundle
""""""""""""""""""""""""
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
if has('gui_running') && !has('unix')
  set encoding=utf-8
endif

call neobundle#begin(expand('~/.vim/bundle/'))

"""" plugins """"

" neobundle
NeoBundleFetch "Shougo/neobundle.vim"

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'Townk/vim-autoclose'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
" NeoBundle 'tomtom/tcomment_vim'  "<C-->*2
" NeoBundle 'osyo-manga/vim-over'
" NeoBundle 'groenewege/vim-less'
" NeoBundle 'tpope/vim-surround'

" End of NeoBundle
call neobundle#end()

" Installation check.
NeoBundleCheck

filetype plugin indent on

""""""""""""""""""""""""
" vim option
""""""""""""""""""""""""
syntax enable

set nobackup
set noswapfile
set noundofile
set clipboard=unnamed,autoselect
set cursorline  "カーソル行をハイライト

set encoding=utf-8
set backspace=eol,indent,start
set ignorecase
set smartcase
set number
"タブ設定
"set expandtab     "タブ入力を複数の空白入力に置き換える
set tabstop=4     "画面上でタブ文字が占める幅
set shiftwidth=4  "自動インデントでずれる幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    "改行時に前の行のインデントを継続する
set smartindent   "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set list listchars=tab:\¦\ 

"n-mode
"vimrcを開く
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
"vimrcをリロードする
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>
"helpを開く
nnoremap <C-h> :<C-u>help<Space>
"行の折り返し
nnoremap <Leader>w  :set wrap!<CR>
"Buffer kill
nnoremap <silent><Space>k    :bd<CR>
"vim-over
"nnoremap <silent> <Leader>m :OverCommandLine<CR>%s/
"スペースキーでページ移動
nnoremap <SPACE>   <PageDown>
nnoremap <S-SPACE> <PageUp>

"n-mode/v-mode/ope-mode
noremap j gj
noremap k gk
noremap gj j
noremap gk k

"insertモードから抜ける
inoremap <silent> <C-g> <esc>

"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline

""""""""""""""""""""""""
" unite.vim
""""""""""""""""""""""""
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Leader>u [unite]

"unite general settings
"インサートモードで開始しない
let g:unite_enable_start_insert = 0
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() "{{{
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+lで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  "ctrl+tでタブで開く
  nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
  inoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
endfunction


""""""""""""""""""""""""
" other plugin
""""""""""""""""""""""""
" nerdtree.vim
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
nnoremap <silent> <Leader>E :lcd %:h<CR>:NERDTree<CR>

""" ctrlp
"let g:ctrlp_max_height = &lines
set wildignore+=*/target/*,*/classes/*,*/成果物/*,*/BoldCreativeDocs/*,*/modules/OSGiBase/*

""" lightline.vim
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"!":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
      \ }

""" 自動的にquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow



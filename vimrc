" pathogen 一个管理插件的插件 {{{
runtime /bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
" }}}

" 文本编码设置 {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"中文编码 GBK
set encoding=utf-8                      "将vim的内部编码格式变为utf-8,这样vim识别文件正确的准确性会提高很多
set fileencoding=utf-8                  "当新建一个文档的时候，默认编码是utf-8
set fileencodings=utf-8                 "让vim按照utf-8识别文件
" }}}

" 编辑显示设置 {{{ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set go=                 "去掉边框
set number              "显示行号
set incsearch           "搜索关键词高亮
set hlsearch
syntax on               "设置语法高亮
set nowrap              "关闭自动折行
set autoread            "当文件在外部被改变时，自动加载

" 关闭文件备份，因为大多数东西都是在SVN，GIT上的
set nobackup
set nowb
set noswapfile
" }}}

" 设置缩进空格数 {{{
set tabstop=4           "表示一个tab显示出来是多少个空格，默认为8
set softtabstop=4       "在编辑的时候（比如按退格或tab键）一个tab是多少个空格
set shiftwidth=4        "每一级缩进是多少空格
set expandtab           "将tab扩展成空格; noepandtab 不扩展;
set autoindent          "自动缩进
set smartindent
" }}}

" 插件设置 {{{ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype on
filetype plugin on
filetype indent on

" color and font {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme molokai
"set guifont=Monaco\ 11

" powerline {{{
let g:Powerline_symbols = 'fancy'
set laststatus=2
" }}}

" nerdtree {{{
nnoremap <F8> :NERDTreeToggle<CR>
" }}}


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" programming {{{

" CSS
augroup ft_css
    au!

    au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css setlocal iskeyword+=-
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
augroup END

" Ruby 
au FileType ruby nmap<buffer> <leader>r :!ruby "%"<CR>
au FileType ruby set tabstop=2
au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2

" }}}

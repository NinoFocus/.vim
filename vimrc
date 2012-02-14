" pathogen 一个管理插件的插件 {{{
runtime /bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
" }}}

" 文本编码设置 {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"中文编码 GBK
set encoding=utf-8                      "将vim的内部编码格式变为utf-8,这样vim识别文件正确的准确性会提高很多
set fileencoding=cp936                  "当新建一个文档的时候，默认编码是GBK
set fileencodings=cp936,ucs-bom,utf-8   "让vim按照gbk,utf-8(没有头),utf-8的顺序识别文件
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

set relativenumber      "行号相对于光标计算
" }}}

" Folding 代码折叠 {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldmethod=marker
set foldmarker={,}
set foldminlines=2
set foldlevelstart=0
set foldlevel=99

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in,
" no matter where the cursor happens to be.
nnoremap zO zMzvzz

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '...' . repeat(" ",fillcharcount) . foldedlinecount . '...' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" }}}

" 设置缩进空格数 {{{
set tabstop=4           "表示一个tab显示出来是多少个空格，默认为8
set softtabstop=4       "在编辑的时候（比如按退格或tab键）一个tab是多少个空格
set shiftwidth=4        "每一级缩进是多少空格
set expandtab           "将tab扩展成空格; noepandtab 不扩展;
set autoindent          "自动缩进
set smartindent
" }}}

" ruby {{{
" """""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType ruby nmap<buffer> <leader>r :!ruby "%"<CR>
au FileType ruby set tabstop=2
au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2
" }}}

" 改键设置 {{{ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-c> "+yaw
vmap <C-c> "+y
nmap <C-v> "+p
imap <C-v> <ESC><C-v>a
map <silent><C-s> :update<CR> "<Ctrl-s> for saving
imap <C-s> <ESC>:update<CR>a
nmap <C-z> :sheel<CR>
" }}}

" 插件设置 {{{ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype on
filetype plugin on
filetype indent on

" velocity 模板代码高亮 
au! BufRead,BufNewFile *.vm  setfiletype velocity 

" }}}

" color and font {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme molokai
set guifont=Monaco\ 11
highlight LineNr ctermfg=darkgray 
" }}}

" vimwiki {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path':'~/Dropbox/vimwiki/',
            \'path_html':'~/Dropbox/vimwiki/html',}]
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0

map <F4>   :Vimwiki2HTML<cr>
" }}}

" tagbar {{{
let g:tagbar_compact    = 1 " Remove empty lines by default
let g:tagbar_autofocus  = 1
let g:tagbar_autoshowtag= 1
let g:tagbar_iconchars  =  ['▸', '▾']
let g:tagbar_type_html = {
    \ 'ctagstype' : 'html',
    \ 'kinds' : [
    \ 'h:Headers',
    \ 'o:Objects(ID)',
    \ 'c:Classes'
    \ ]
    \ }
let g:tagbar_type_css = {
    \ 'ctagstype' : 'css',
    \ 'kinds' : [
    \ 't:Tags(Elements)',
    \ 'o:Objects(ID)',
    \ 'c:Classes'
    \ ]
    \ }

nnoremap <F9> :TagbarToggle<CR>
" }}}

" powerline {{{
let g:Powerline_symbols = 'fancy'
set laststatus=2
" }}}

" nerdtree {{{
nnoremap <F8> :NERDTreeToggle<CR>
" }}}

" jquery {{{
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
" }}}

" neocomplcache {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" }}}

" zencoding {{{
nmap , <C-y>,
vmap , <C-y>,
" }}}

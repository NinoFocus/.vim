""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 文本编码设置                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"中文编码 GBK
set encoding=utf-8                      "将vim的内部编码格式变为utf-8,这样vim识别文件正确的准确性会提高很多
set fileencoding=cp936                  "当新建一个文档的时候，默认编码是GBK
set fileencodings=cp936,ucs-bom,utf-8   "让vim按照gbk,utf-8(没有头),utf-8的顺序识别文件


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 编辑显示设置                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"去掉边框
set go=
"显示行号
set number

"搜索关键词高亮
set incsearch
set hlsearch
"设置语法高亮
syntax on

"代码折叠
set foldmethod=indent
"设置缩进空格数
set tabstop=4       "表示一个tab显示出来是多少个空格，默认为8
set softtabstop=4   "在编辑的时候（比如按退格或tab键）一个tab是多少个空格
set shiftwidth=4    "每一级缩进是多少空格

au FileType ruby nmap<buffer> <leader>r :!ruby "%"<CR>
au FileType ruby set tabstop=2
au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2

set expandtab       "将tab扩展成空格; noepandtab 不扩展;
"set smarttab       "根据文件中其他地方的缩进空格个数来确定一个tab是多少空格
"关闭自动折行
:set nowrap

"自动缩进
set autoindent
set smartindent
"当文件在外部被改变时，自动加载
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 改键设置                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-c> "+yaw
vmap <C-c> "+y
nmap <C-v> "+p
imap <C-v> <ESC><C-v>a
"<Ctrl-s> for saving
map <silent><C-s> :update<CR>
imap <C-s> <ESC>:update<CR>a
nmap <C-z> :sheel<CR>

" Plugin: NERDTree
nmap ` :NERDTreeToggle<CR>

" 括号的自动补全
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 插件设置                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
:filetype on
:filetype plugin on
:filetype indent on
"matchit  已经自动启用，使%不仅能匹配简单的()<>,还能匹配<html></html>之类的标签
"snipMate 已经自动启用，代码片段插件
"zen coding
let g:user_zen_leader_key = '<c-e>'
let g:user_zen_expandabbr_key='<c-e>'
let g:use_zen_complete_tab=1
" wordpress
let VIMPRESS = [{'username':'ninofocus',
    \'blog_url':'http://ninofocus.com'
    \}]

" 打开javascript折叠 
let b:javascript_fold=1
" 打开jvascript对dom、html、css的支持
let javascript_enable_domhtmlcss=1
" html auto close tag
"au FileType xhtml,xml so ~/woring-anywehere/vim/ftplugin/html_autoclosetag.vim
" velocity 模板代码高亮
au! BufRead,BufNewFile *.vm  setfiletype velocity 
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 基本设置                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 当vimrc被改变时，重新加载
autocmd! bufwritepost vimrc source ~/working-anywhere/vim/.vimrc
" 关闭文件备份，因为大多数东西都是在SVN，GIT上的
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => color and font
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
":colorscheme darkspectrum
:colorscheme molokai
:set guifont=Monaco\ 12
"行号字体颜色
:highlight LineNr ctermfg=darkgray   
"行号背景颜色
":highlight LineNr ctermbg=black

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""


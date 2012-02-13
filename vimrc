" �ı��������� {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"���ı��� GBK
set encoding=utf-8                      "��vim���ڲ������ʽ��Ϊutf-8,����vimʶ���ļ���ȷ��׼ȷ�Ի���ߺܶ�
set fileencoding=cp936                  "���½�һ���ĵ���ʱ��Ĭ�ϱ�����GBK
set fileencodings=cp936,ucs-bom,utf-8   "��vim����gbk,utf-8(û��ͷ),utf-8��˳��ʶ���ļ�
" }}}

" �༭��ʾ���� {{{ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set go=                 "ȥ���߿�
set number              "��ʾ�к�
set incsearch           "�����ؼ��ʸ���
set hlsearch
syntax on               "�����﷨����
set nowrap              "�ر��Զ�����
set autoread            "���ļ����ⲿ���ı�ʱ���Զ�����
if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" �ر��ļ����ݣ���Ϊ���������������SVN��GIT�ϵ�
set nobackup
set nowb
set noswapfile

set relativenumber
" }}}

" Folding �����۵� {{{
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

" ���������ո��� {{{
set tabstop=4           "��ʾһ��tab��ʾ�����Ƕ��ٸ��ո�Ĭ��Ϊ8
set softtabstop=4       "�ڱ༭��ʱ�򣨱��簴�˸��tab����һ��tab�Ƕ��ٸ��ո�
set shiftwidth=4        "ÿһ�������Ƕ��ٿո�
set expandtab           "��tab��չ�ɿո�; noepandtab ����չ;
set autoindent          "�Զ�����
set smartindent
" }}}

" ruby {{{
" """""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType ruby nmap<buffer> <leader>r :!ruby "%"<CR>
au FileType ruby set tabstop=2
au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2
" }}}

" �ļ����� {{{ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-c> "+yaw
vmap <C-c> "+y
nmap <C-v> "+p
imap <C-v> <ESC><C-v>a
map <silent><C-s> :update<CR> "<Ctrl-s> for saving
imap <C-s> <ESC>:update<CR>a
nmap <C-z> :sheel<CR>

" Plugin: NERDTree
nmap ` :NERDTreeToggle<CR>

" }}}

" ������� {{{ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype on
filetype plugin on
filetype indent on

" velocity ģ�������� 
au! BufRead,BufNewFile *.vm  setfiletype velocity 

" }}}

" color and font {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme molokai
set guifont=Monaco\ 12
highlight LineNr ctermfg=darkgray 
" }}}

" vimwiki {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path':'~/Dropbox/vimwiki/',
            \'path_html':'~/Dropbox/vimwiki/html',}]
" �������û���˵�����ǲ�����ô��Ҫ�շ�Ӣ�ĳ�Ϊά������
let g:vimwiki_camel_case = 0

map <F4>   :Vimwiki2HTML<cr>
" }}}

" TagList {{{
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
" }}}

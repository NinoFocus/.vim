""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 �ı���������                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"���ı��� GBK
set encoding=utf-8                      "��vim���ڲ������ʽ��Ϊutf-8,����vimʶ���ļ���ȷ��׼ȷ�Ի���ߺܶ�
set fileencoding=cp936                  "���½�һ���ĵ���ʱ��Ĭ�ϱ�����GBK
set fileencodings=cp936,ucs-bom,utf-8   "��vim����gbk,utf-8(û��ͷ),utf-8��˳��ʶ���ļ�


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 �༭��ʾ����                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ȥ���߿�
set go=
"��ʾ�к�
set number

"�����ؼ��ʸ���
set incsearch
set hlsearch
"�����﷨����
syntax on

"�����۵�
set foldmethod=indent
"���������ո���
set tabstop=4       "��ʾһ��tab��ʾ�����Ƕ��ٸ��ո�Ĭ��Ϊ8
set softtabstop=4   "�ڱ༭��ʱ�򣨱��簴�˸��tab����һ��tab�Ƕ��ٸ��ո�
set shiftwidth=4    "ÿһ�������Ƕ��ٿո�

au FileType ruby nmap<buffer> <leader>r :!ruby "%"<CR>
au FileType ruby set tabstop=2
au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2

set expandtab       "��tab��չ�ɿո�; noepandtab ����չ;
"set smarttab       "�����ļ��������ط��������ո������ȷ��һ��tab�Ƕ��ٿո�
"�ر��Զ�����
:set nowrap

"�Զ�����
set autoindent
set smartindent
"���ļ����ⲿ���ı�ʱ���Զ�����
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 �ļ�����                            "
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

" ���ŵ��Զ���ȫ
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 �������                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
:filetype on
:filetype plugin on
:filetype indent on
"matchit  �Ѿ��Զ����ã�ʹ%������ƥ��򵥵�()<>,����ƥ��<html></html>֮��ı�ǩ
"snipMate �Ѿ��Զ����ã�����Ƭ�β��
"zen coding
let g:user_zen_leader_key = '<c-e>'
let g:user_zen_expandabbr_key='<c-e>'
let g:use_zen_complete_tab=1
" wordpress
let VIMPRESS = [{'username':'ninofocus',
    \'blog_url':'http://ninofocus.com'
    \}]

" ��javascript�۵� 
let b:javascript_fold=1
" ��jvascript��dom��html��css��֧��
let javascript_enable_domhtmlcss=1
" html auto close tag
"au FileType xhtml,xml so ~/woring-anywehere/vim/ftplugin/html_autoclosetag.vim
" velocity ģ��������
au! BufRead,BufNewFile *.vm  setfiletype velocity 
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 ��������                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ��vimrc���ı�ʱ�����¼���
autocmd! bufwritepost vimrc source ~/working-anywhere/vim/.vimrc
" �ر��ļ����ݣ���Ϊ���������������SVN��GIT�ϵ�
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => color and font
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
":colorscheme darkspectrum
:colorscheme molokai
:set guifont=Monaco\ 12
"�к�������ɫ
:highlight LineNr ctermfg=darkgray   
"�кű�����ɫ
":highlight LineNr ctermbg=black

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""


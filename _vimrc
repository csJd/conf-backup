source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"==================== above are default vimrc file ==================================


syntax on                               "高亮
"colo torte              		        "配色
set guifont=Microsoft_YaHei_Mono:h11    "字体
set lines=26 columns=99                 "gvim窗口大小
"set nu									"行号开关
set nocompatible						"关闭vi兼容，可使用更多功能
set history=10000						"最大历史
set tabstop=4                           "一个TAB长度
set softtabstop=4 						"退格键的时候退回缩进的长度
set shiftwidth=4 						"每一级缩进的长度
set expandtab                           "space instead of tab
set smarttab  							"行首tab加入sw个空格，否则ts个空格
set autoindent                          "自动缩进
set cindent  							"C风格自动缩进
set noundofile							"不生成undo文件
set nobackup 							"不生成备份文件
set noswapfile  						"不生成swap文件
set mouse=a 							"光标定位到鼠标位置
    
"设置编码
"set enc=utf-8
"set fenc=utf-8
"set fencs=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
	set fileencoding=chinese
else
	set fileencoding=utf-8
endif

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages en_US.utf-8

"按键映射
imap jj <ESC>
imap <A-/> <C-n>
imap {{ {<ESC>o}<ESC>O
imap <c-]> {<cr>}<c-o>O<left><right>

"隐藏工具栏 菜单栏
"set guioptions-=m
set guioptions-=T
map <silent> <F4> :if &guioptions =~# 'T' <Bar>
			\set guioptions-=T <Bar>
			\set guioptions-=m <bar>
			\else <Bar>
			\set guioptions+=T <Bar>
			\set guioptions+=m <Bar>
			\endif<CR>

"C，C++，Java 按F5编译运行
map <F5> :call CompileRun()<CR>
func! CompileRun()
	exec "w"
	if &filetype == 'c'
		exec "!g++ -o run %"
		"        exec "!run"
	elseif &filetype == 'cpp'
		exec "!g++ -o run %"
		"        exec "!run"
	elseif &filetype == 'py'
		exec "!python %"
		":!%
	elseif &filetype == 'java'
		exec "!javac -d .\\bin %"
		exec "!java -cp .\\bin %<"
		"    elseif &filetype == 'sh'
		"        :!.\%
	endif
endfunc

"generate default cplusplus code
map <F2> :call SetTitle()<CR>
func SetTitle()
	let l = 0
	let l = l + 1 | call setline(l,'#include <bits/stdc++.h>')
	let l = l + 1 | call setline(l,'using namespace std;')
	let l = l + 1 | call setline(l,'')
	let l = l + 1 | call setline(l,'int main()')
	let l = l + 1 | call setline(l,'{')
	" let l = l + 1 | call setline(l,'    //freopen("in.txt","r",stdin);')
	" let l = l + 1 | call setline(l,'    //freopen("out.txt","w",stdout);')
	let l = l + 1 | call setline(l,'    ')
	let l = l + 1 | call setline(l,'    return 0;')
	let l = l + 1 | call setline(l,'}')
	let l = l + 1 | call setline(l,'//Last modified :  '.strftime("%Y-%m-%d %H:%M CST"))
	normal G
endfunc


"""""""""""""""""""vim base config
set nocompatible 
set t_ut= " 防止vim背景颜色错误
set report=0
set noeb
set autoread
set selection=exclusive
""set shortmess=atl
""set shortmess+=c
set shortmess-=S
" set selectmode=mouse,key
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不管文件的编码如何，不管如何显示和输入，Vim 内部使用的编码是 UTF-8；这是国际化支持的基础。
set encoding=utf-8
""set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 取决于实际的终端或 X Window 的设定。
" 举例来说，如果选择语言简体中文登录到 X Window，或者正在使用 CXTERM [10] 的话，那么该选项应被设为 GB2312；
" 如果使用缺省的语言（LANG=en_US.UTF-8）登录到 X Window，或者使用 PuTTY [11] 远程访问 Linux 机器、并且设定里的字符编码（配置中 Window-Translation）设为 UTF-8 的话，该选项就应该设为 utf-8。
" 从 Windows 下使用 PuTTY 远程连接 Linux 的请特别注意，测试表明，仅在使用 UTF-8 的情况下，PuTTY 才能可靠地支持中文的显示和输入（显示字体必须设成中文字体）。
" set termencoding
""set termencoding=utf-8

" 文件载入时，该选项被置为 Vim 认定的文件编码，因此，存储时文件的编码不会改变。
" 此处和下面 fileencodings 可使用的编码为 libiconv 支持的所有几百种编码（如果编译时包含了 iconv 特性的话），与中文相关的有 gb2312、gbk、gb18030、hz-gb-2312、iso-2022-cn、big5、cp936、cp950 等。
" 如果创建新文件，你又不希望使用 UTF-8 作为文件编码时，那么，你可能需要手工设定该选项，如“:set fileencoding=gb2312”。
" 需要注意的一点是，使用“set”来设定该选项的话会改变以后新建文件的缺省编码，而使用 “setlocal”的话则只影响当前文件（参考“:help setlocal”）。
" set fileencoding
""set fileencoding=utf-8

" Vim 会首先判断文件的开头是否是一个 Unicode [7] 的 BOM（byte order mark）字符 [8]， 是的话则把文件的其余内容解释成相应的 Unicode 序列；
" 否的话再试图把文件内容解释成 UTF-8 的序列；
" 再失败的话，则把文件解释为简体中文（chinese 是一个跨平台的简体中文字符集的别名，Linux 下相当于 gb2312 和 euc-cn；此处也可以根据需要以 gb2312、gbk 或 gb18030 等编码替代）。
" 需要注意的是，该顺序不能颠倒，并且在后面再添加其它编码如 big5、latin1 也是没有意义的，因为 Vim 不能识别 8 比特编码中的错误，因此这些编码后列的编码永远不会被用到。
"set fileencodings=ucs-bom,utf-8,chinese
""set fileencodings=ucs-bom,utf-8,cp936

" 把所有的“不明宽度”字符 [9]——指的是在 Unicode 字符集中某些同时在东西方语言中使用的字符，如省略号、破折号、书名号和全角引号，在西方文字中通常字符宽度等同于普通 ASCII 字符，而在东方文字中通常字符宽度等同于两倍的普通 ASCII 字符，因而其宽度“不明”——的宽度置为双倍字符宽度（中文字符宽度）。
" 此数值只在 encoding 设为 utf-8 或某一 Unicode 编码时才有效。
" 需要额外注意的是，如果你通过终端使用 Vim 的话，需要令终端也将这些字符显示为双宽度。
" 比如，XTERM [12] 的情况下应该使用选项“-cjk”，即使用命令“uxterm -cjk”来启动使用双宽度显示这些字符的 Unicode X 终端；
" 使用 PuTTY 远程连接的话则应在配置的 Window-Translation 中选中“Treat CJK ambiguous characters as wide”（参见图 3）。
"set ambiwidth=double
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本配置
""set mouse=a      " 启动鼠标所有模式，但是右键功能不可用, 可以保证鼠标滚屏在当前屏幕内
set mousehide    " 输入文件时隐藏鼠标
set backspace=indent,eol,start   " 退格键分别可删除缩进，上一行结束，insert之前的字
set nobackup
set nowritebackup " 不写入备份文件
set history=500     " history存储长
set showcmd       " 显示输入命令
set shortmess=atI"  " 关闭欢迎页面
" Better Unix / Windows compatibility
set viewoptions=folds,options,cursor,unix,slash 
set virtualedit=onemore             " 光标可以移到当行最后一个字符之后
set hidden                          " 切换文件不保存，隐藏
" set confirm       " 退出前验证
" set spell         " 拼写检查
set linespace=0   " 行之间没有多余的空格
set wildmenu      " 自动补全时的文件菜单
set wildmode=list:longest,full " 自动补全时，匹配最长子串，列出文件
set whichwrap=b,s,h,l,<,>,[,]  " 行尾可右移到下行，行首左移到上行,b：退格，s：空格，hl：左右，<>：n/v模式下的左右，[]：i/r模式下的左右
set scrolljump=5  " 光标离开屏幕范围
set scrolloff=3   " 光标移动至少保留行数

" 格式
set nowrap        " 取消自动折行
" set nojoinspaces  " 用J合并两行用一个空格隔开
set splitright    " 用vsplit新建窗口，让新的放右边
set splitbelow    " 用split新建窗口，让新的放下面
set pastetoggle=<F12> " 指定F12进入黏贴模式，可以正常复制缩进
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " 空格等无效字符显示
set textwidth=80  " 内容宽度

"syntax on 

" shiftwidth（缩进的空格数）；
" tabstop（制表符的宽度）；
" softtabstop（软制表符宽度，设置为非零数值后使用 Tab 键和 Backspace 时光标移动的格数等于该数值，但实际插入的字符仍受 tabstop 和 expandtab 控制）；
" expandtab（是否在缩进和遇到 Tab 键时使用空格替代；使用 noexpandtab 取消设置）；
set tabstop=4 
set shiftwidth=4 
set softtabstop=4 
set expandtab
" autoindent（自动缩进，即每行的缩进值与上一行相等；使用 noautoindent 取消设置）；
" cindent（使用 C 语言的缩进方式，根据特殊字符如“{”、“}”、“:”和语句是否结束等信息自动调整缩进；在编辑 C/C++ 等类型文件时会自动设定；使用 nocindent 取消设置）；
" set cindent
" cinoptions（C 语言缩进的具体方式，请参考“:help cinoptions-values”）；
" paste（粘贴模式，会取消所有上述选项的影响来保证后面的操作——通常是从剪贴板粘贴代码——保持原有代码的风格；使用
" nopaste 取消设置）。
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示行号
set number
" 显示光标当前位置
set ruler
" 突出显示当前行
set cursorline
" 代码折叠
set nofoldenable

set autoindent
set showmatch " 高亮匹配括号
set matchtime=1
set linebreak
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 取消备份
set nobackup
set noswapfile
set autowrite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 查找
set incsearch     " 搜索时自动匹配
set hlsearch      " 高亮搜索项
set ignorecase    " 无视大小写
set smartcase     " 如果有大写就区别大小写匹配
set iskeyword-=.  " 让'.' 作为单词分割符
set iskeyword-=#  " 让'#' 作为单词分割符
set iskeyword-=-  " 让'-' 作为单词分割符
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 左下角显示当前 vim 模式
"set showmode

filetype off 
filetype plugin indent off

" 开启新的buffer时，自动转到对应文件目录
let g:autochdir = 1
if exists('g:autochdir')
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h |
endif
" 恢复光标最后编辑位置
au BufWinLeave *.py,*.c,*.cpp,*.css,*.html,*.js,*php mkview
au BufWinEnter *.py,*.c,*.cpp,*.css,*.html,*.js,*php silent loadview
" key 映射
let mapleader = '\'         " 全局leader设置
let maplocalleader = '_'    " 本地leader设置

" 设置tag和window间快速跳转
let g:easyWindows = 1
if exists('g:easyWindows')
    " 向上
    map <C-J> <C-W>j<C-W>_
    " 向下
    map <C-K> <C-W>k<C-W>_
    " 向右
    map <C-L> <C-W>l<C-W>_
    " 向左
    map <C-H> <C-W>h<C-W>_
endif
" 处理折叠行的左右移动
noremap j gj
noremap k gk

" ,fc查找冲突的地方
map <leader>fc /\v^[<\|=>]{7}( .*\|$ )<CR>
" ,ff 查找光标后的单词位置，列出选择项
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" 屏幕左移和右移
map zl zL
map zh zH
" 映射vsp这些开启新的buffer,默认目录为当前目录
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" 黏贴板
if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif
endif"

" TextEdit might fail if hidden is not set.
set hidden


" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif
call plug#begin('~/.nvim/plugged')
" 目录管理
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'majutsushi/tagbar'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" 
" " 主题/色彩管理
" Plug 'altercation/vim-colors-solarized'
" Plug 'vim-scripts/khaki.vim'
" Plug 'mavnn/mintty-colors-solarized'
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
" 
" " git 插件
" Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive'
" 
" " 状态行
" "Plug 'itchyny/lightline.vim'
" "Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 
" " 文件名查找文件
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'

" 内容模板 
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
" " Plug 'tomtom/tlib_vim.git'
" " Plug 'MarcWeber/vim-addon-mw-utils.git'
" " Plug 'garbas/vim-snipmate.git'
" " Plug 'honza/vim-snippets.git'
" 
" " 其他增强型
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
" "Plug 'Townk/vim-autoclose'
" "Plug 'vim-scripts/AutoClose'
" 
" " 语法相关
" Plug 'w0rp/ale'
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'scrooloose/syntastic'
"
" 自动补全 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" " Plug 'Valloric/YouCompleteMe'
" "Plug 'davidhalter/jedi-vim'
" "Plug 'FromtonRouge/OmniCppComplete'
" "Plug 'scrooloose/nerdcommenter'
" " Plug 'fatih/vim-go'
" " Plug 'yssource/python.vim'
" 
Plug 'itchyny/vim-cursorword'
call plug#end()

syntax enable 
filetype on

" 配色方案
" let g:seoul256_background = 234
" 显示颜色"
set t_Co=256
set background=dark

let g:PaperColor_Theme_Options = {
	\'theme':{
	\	'default':{
	\		'transparent_background':1,
	\		'override':{},
	\		'allow_bold':0,
	\		'allow_italic':0,
	\	}
	\},
	\'language':{
	\ 	'python':{'highlight_builtins':1},
	\ 	'cpp':{'highlight_standard_library':1},
	\ 	'c':{'highlight_builtins':1},
	\ 	'go':{'highlight_builtins':1},
	\ 	'sh':{}
	\}
\}
" 主题
colorscheme PaperColor
" colorscheme desert
""colo monokai

"if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
""  let g:solarized_termcolors=256
""  let g:solarized_termtrans=1
""  let g:solarized_contrast="normal"
""  let g:solarized_visibility="normal"
""  color solarized             " Load a colorscheme
""endif
""colorscheme SolarizedDark
""colorscheme SolarizedLight

autocmd BufEnter *.py set cc=81 " 打开py文件81行高亮
" 之前的高亮线太难看，重新制定颜色，这里的black和iterm2颜色配置中的black一样
hi CursorLine   cterm=NONE ctermbg=black guibg=black
hi CursorColumn   cterm=NONE ctermbg=black guibg=black "
highlight ColorColumn ctermbg=black guibg=black
hi LineNr ctermbg=black

"""""""""""""""""""""indentLine"
let g:indent_guides_size = 1
let g:indent_guides_level = 2

""""""""""""""""""coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB> 
	\ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction



" Use <c-space> to trigger completion.
if has('nvim')
  	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  	if (index(['vim','help'], &filetype) >= 0)
      		execute 'h '.expand('<cword>')
        else
	    	call CocAction('doHover')
        endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
        autocmd!
	" Setup formatexpr specified filetype(s).
  	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    	" Update signature help on jump placeholder.
      	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected) 
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

"" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call   CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p :<C-u>CocListResume<CR>"






" airline
" 总是显示状态栏" 
let laststatus = 2
" 使用powerline打过补丁的字体"
let g:airline_powerline_fonts = 1   
" 设置主题"
""let g:airline_theme="dark"      
let g:airline_theme='molokai'
""let g:airline_theme = 'desertink'  " 主题
" 开启tabline"
let g:airline#extensions#tabline#enabled = 1
"tabline中当前buffer两端的分隔字符"
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符"
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号"
let g:airline#extensions#tabline#buffer_nr_show = 1 
let g:airline#extensions#tabline#formatter = 'default'    
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9>"
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR" 

" ctrlP
" Ctrlp 和 Ctrlp-funky(,fu)
if isdirectory(expand("~/.nvim/plugged/ctrlp.vim/"))
	let g:ctrlp_working_path_mode = 'ra'
    	nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
       		\ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
        if executable('ag')
        	let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
	elseif executable('ack-grep')
        	let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
        elseif executable('ack')
	        let s:ctrlp_fallback = 'ack %s --nocolor -f'
		" On Windows use "dir" as fallback command.
    	else
            	let s:ctrlp_fallback = 'find %s -type f'
        endif
        if exists("g:ctrlp_user_command")
                 unlet g:ctrlp_user_command
        endif
        let g:ctrlp_user_command = {
		\ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
		\ 2: ['.hg', 'hg --cwd %s locate -I .'],
		\ },
		\ 'fallback': s:ctrlp_fallback 
		\ }
        if isdirectory(expand("~/.nvim/plugged/ctrlp-funky/")) 
		" CtrlP extensions
		let g:ctrlp_extensions   =    ['funky']
		" funky
		nnoremap <Leader>fu :CtrlPFunky<Cr>
	endif
endif

""""""""""""""""""""""""""snip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]

" auto pairs
"设置要自动配对的符号
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
"添加要自动配对的符号<>
let g:AutoPairs['<']='>'
"设置要自动配对的符号，默认为g:AutoPairs，可以通过自动命令来对不同文件类型设置不同自动匹配对符号。
let b:AutoPairs = g:AutoPairs
"设置插件打开/关闭的快捷键，默认为ALT+p。
let g:AutoPairsShortcutToggle = '<M-p>'
"设置自动为文本添加圆括号的快捷键，默认为ALT+e。
let g:AutoPairsShortcutFastWrap = '<M-e>'
"设置调到下一层括号对的快捷键，默认为ALT+n。
let g:AutoPairsShortcutJump = '<M-n>'
"设置撤销飞行模式的快捷键，默认为ALT+b。
let g:AutoPairsShortcutBackInsert = '<M-b>'
"把BACKSPACE键映射为删除括号对和引号，默认为1。
let g:AutoPairsMapBS = 1
"把ctrl+h键映射为删除括号对和引号，默认为1。
let g:AutoPairsMapCh = 1
"把ENTER键映射为换行并缩进，默认为1。
let g:AutoPairsMapCR = 1
"当g:AutoPairsMapCR为1时，且文本位于窗口底部时，自动移到窗口中间。
let g:AutoPairsCenterLine = 1
"把SPACE键映射为在括号两侧添加空格，默认为1。
let g:AutoPairsMapSpace = 1
"启用飞行模式，默认为0。
let g:AutoPairsFlyMode = 0
"启用跳出多行括号对，默认为1，为0则只能跳出同一行的括号。
let g:AutoPairsMultilineClose = 1"

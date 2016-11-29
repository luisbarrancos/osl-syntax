colorscheme evening

syntax manual

set nocompatible
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set ruler
oset virtualedit=all
set hlsearch

" set font for gvim (need to have it ofc...)
"
" for linux atm, gui mode 
if has('gui_running')
    if has("unix")
        set guifont=Liberation\ Mono\ 12
    endif
    if has("gui_win32")
    endif
    if has("mac")
    endif
endif

set guifont=Liberation\ Mono\ 12

" set columns=80
" set columns=80

" colorize >81 column in 7.3
"set colorcolumn=80

" text width to column
" set textwidth=80

" to allow window size to allow 80 chars of actual text, no vert splits
" let &co=80 + &foldcolumn + (&number || &relativenumber ? &numberwidth : 0)

" x,y position display on status bar
set ruler

" set backup, swaps
set backup
set writebackup
set swapfile

syntax on

" no way to vizualize edge of >80 column, but this colors it (for 7.2)
" autocmd BufWinEnter * call matchadd('ErrorMsg', '\%>'.&l:textwidth.'v.\+', -1)

filetype on
filetype plugin on
"autocmd FileType c,cc,cpp,h,hpp,sl,vfl,vex :set cindent
"autocmd FileType osl,rsl,sl,h,vfl,vex :set smartindent
"autocmd FileType rib :set cindent

au BufReadPost *.rib set syntax=rib
au BufReadPost *.osl set syntax=osl
au BufReadPost *.mel set syntax=mel


" omnicomplete matching
" set completeopt ="menu,menuone,longest"

" limit popup menu height
set pumheight =15

" magenta dropdown is unreadable, change colors
" highlight clear
highlight Pmenu ctermfg=0 ctermbg=2
highlight PmenuSel ctermfg=0 ctermbg=7
highlight PmenuSbar ctermfg=7 ctermbg=0
highlight PmenuThumb ctermfg=0 ctermbg=0


" Setup the tab key to do autocompletion
"function! CompleteTab()
"  let prec = strpart( getline('.'), 0, col('.')-1 )
"  if prec =~ '^\s*$' || prec =~ '\s$'
"    return "\"
"  else
"    return "\\"
"  endif
"endfunction

"inoremap  =CompleteTab()


" omnicomplete complete key is Ctrl+N, change to Ctrl+Space
" inoremap <Nul> <C-x><C-o>

"omnicpp options
" complete with . 
" let OmniCpp_MayCompleteDot =0 " disable in rsl2 vim, dot product...
" let OmniCpp_MayCompleteArrow    =1
" let OmniCpp_MayCompleteScope    =1 " ::
" let OmniCpp_SelectFirstItem     =2 " select first item but don't insert
" let OmniCpp_NamespaceSearch     =2 " search namespaces
" let OmniCpp_ShowPrototypeInAbbr =1 " show prototype function in popup window

let OmniCpp_NamespaceSearch     = 1
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_ShowAccess          = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot      = 0
let OmniCpp_MayCompleteArrow    = 1
let OmniCpp_MayCompleteScope    = 1
let OmniCpp_DefaultNamespaces   = [ "wstd" , "_GLIBCXX_STD" ]
" automagically open and close the popup/preview menu
au CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" use default tags
set tags+=$HOME/.vim/tags/tags

" map ctrl+F12 to generate ctags for current folder
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" add current directory generated tags to available tags
set tags+=./tags


" map tab completion to func+tab, and leave tab for indentation
let g:SuperTabMappingTabLiteral     = '<Tab>'
let g:SuperTabMappingForward        = '<C-Tab>'
let g:SuperTabMappingBackward       = '<C-Tab>'
let g:SuperTabDefaultCompletionType = 'context'


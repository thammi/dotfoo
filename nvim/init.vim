" vim wants a posix compatible shell
if $SHELL =~ 'bin/fish'
  set shell=/bin/sh
endif

" helper for the color script
if &term == 'xterm' || &term =~? '^screen'
  set t_Co=256
  let g:CSApprox_konsole = 1
endif

" nice colorscheme
colorscheme torte

" reset some stuff
set nocompatible

" new leader
let mapleader = ","


call plug#begin('~/.vim/plugged')

" ui
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'Yggdroot/indentLine'

" colors
Plug 'vim-scripts/vilight.vim'

" editing
Plug 'tpope/vim-surround'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'bkad/CamelCaseMotion'

" git
Plug 'tpope/vim-fugitive'

Plug 'vim-syntastic/syntastic'

" auto completion
Plug 'Valloric/YouCompleteMe', {'do': './install.py --ts-completer --clangd-completer'}

Plug 'editorconfig/editorconfig-vim'

"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/denite.nvim'
"Plug 'Shougo/deoplete-clangx'

let g:deoplete#enable_at_startup = 1

" language stuff
Plug 'sheerun/vim-polyglot'

call plug#end()

if has('python3')
    let g:gundo_prefer_python3 = 1
endif

" magic indent plugin for many languages
filetype indent plugin on

" syntax highlighting
syntax on

" toggle wrapping with F10
" TODO: find out how ugly this really is
function! WrapToggle()
  if g:wrapped
    let g:wrapped = 0
    set textwidth=0
  else
    let g:wrapped = 1
    set textwidth=80
  endif
endfunction
let g:wrapped = 0
map <F10> :call WrapToggle()<CR>
imap <F10> :call WrapToggle()<CR>

" C / C++
" gates for header
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" python
au FileType python setlocal shiftwidth=4 tabstop=4 smarttab expandtab softtabstop=4

" vimrc (meta :D)
au FileType vim setlocal shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2

" haml
au FileType haml setlocal shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2

" latex
au FileType plaintex setlocal shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2

" js the way i want it
au FileType javascript setlocal shiftwidth=4 tabstop=4 smarttab expandtab softtabstop=4

au FileType typescript setlocal shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2
au FileType typescript.jsx setlocal shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2
au FileType typescriptreact setlocal shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2

" coffee script
au FileType coffee setlocal shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2

" ruby
au FileType ruby setlocal shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2

" tex
au FileType tex setlocal shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2

" md
au FileType markdown setlocal shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2

" brainfuck
au BufRead,BufNewFile *.bf setfiletype brainfuck

" json
au BufRead,BufNewFile *.json setfiletype json

" qt style sheets (looks like css ;) )
au BufRead,BufNewFile *.qss setfiletype css

au BufRead,BufNewFile *.hamlc setfiletype haml

" toggle paste option
set pastetoggle=<F11>

" funny cmd completion
set wildmenu

" highlight search results
set hlsearch
" and <C-?> (aka Ctrl+Shift+/ on my layout) removes the highlighting
nnoremap <silent> <C-?> :nohl<CR><C-?>

" always show statusbar
set laststatus=2

" kind of clever case (all small letters => ignore case)
set ignorecase
set smartcase

" hopping search
set incsearch

" keeping context by scrolling too early ;)
set scrolloff=2

" Tag-List
map <leader>T :TlistToggle<CR><C-W>h

" Doxygen
map <C-D> :Dox<CR>
imap <C-D> <ESC>:Dox<CR>

let g:ctrlp_working_path_mode = 'a'

" gundo
nnoremap <F5> :GundoToggle<CR>

" MiniBufExplorer
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l
noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>

" don't close hidden buffers
set hidden

" find trailing whitespaces
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Commant-T
set wildignore+=build,test,out,*.o,*.d,.git,node_modules,bower_components,doc,dist

" snipmate keybinding
let g:snips_trigger_key='<c-tab>'

" do not lose selection after indent shift
vnoremap > >gv
vnoremap < <gv

" quick macros with qq and Q
nnoremap Q @q

" Y acts the same way as C and D
nnoremap Y y$

" navigate by visual lines
nnoremap j gj
nnoremap k gk

" insert and select
nnoremap <leader>p p`[v`]
nnoremap <leader>P P`[v`]

map <leader>yf :YcmCompleter FixIt<CR>
map <leader>yt :YcmCompleter GetType<CR>
map <leader>yg :YcmCompleter GoToDeclaration<CR>
map <leader>yd :YcmShowDetailedDiagnostic<CR>

let g:ycm_extra_conf_globlist = ['~/proggen/*']

call camelcasemotion#CreateMotionMappings('<leader>')

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_typescript_checkers = ['eslint']
let g:syntastic_typescript_eslint_exe = 'npm run lint --'


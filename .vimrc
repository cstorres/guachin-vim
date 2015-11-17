set nocompatible
" Vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle
    let iCanHazVundle=0
endif

" required for Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle/
call vundle#rc()


" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

" Required for vundle
Bundle 'gmarik/vundle'

" File browser
Bundle 'scrooloose/nerdtree'

" Code commenter
Bundle 'scrooloose/nerdcommenter'

" Python and other languages code checker
Bundle 'scrooloose/syntastic'

" Class/module browser
Bundle 'majutsushi/tagbar'

" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'

" Tab list panel
Bundle 'kien/tabman.vim'

" Airline
Bundle 'bling/vim-airline'

" Autoclose
Bundle 'Townk/vim-autoclose'

" Indent text object
Bundle 'michaeljsmith/vim-indent-object'

" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'

" Better autocompletion
Bundle 'Shougo/neocomplcache.vim'

" Useful python snippets 
Bundle 'honza/vim-snippets'

" Git/mercurial/others diff icons on the side of the file lines
Bundle 'mhinz/vim-signify'

" Window chooser
Bundle 't9md/vim-choosewin'

" Paint css colors with the real color
Bundle 'lilydjwg/colorizer'

" Search results counter
Bundle 'IndexedSearch'

" XML/HTML tags navigation
Bundle 'matchit.zip'

" Yank history navigation
Bundle 'YankRing.vim'

" Collection of colours
Bundle 'flazz/vim-colorschemes'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" -----------------------------------------------------------------------------
"  Detect OS to make things nicer
" -----------------------------------------------------------------------------
if has("unix")
  " 'Darwin' or 'Linux'.
  let s:uname = system("echo -n \"$(uname -s)\"")
  let $PLATFORM = tolower(s:uname)
else
  let s:uname = ""
end

" Set the font, colour scheme, etc. appropriately.
if has("gui_running")
  colors desert
  if has("gui_gtk2")
    set guifont=Monospace\ 9
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h11
  endif
endif

" On Mac OS X, "set lines" causes the terminal window to be resized; we don't want that.
if has("gui_running")
  " gui_running => not in a terminal => safe to resize.
  if &lines < 50
    set lines=50
  endif
  if &columns < 120
    set columns=120
  endif
endif

" In terminal mode, use a different coloured cursor for insert mode:
if s:uname != "Darwin" && &term =~ "xterm-256color" && !has("gui_running")
  " Use an orange cursor in insert mode.
  let &t_SI = "\<Esc>]12;orange\x7"
  " Use a white cursor otherwise, and set it initially.
  let &t_EI = "\<Esc>]12;white\x7"
  silent !echo -ne "\E]12;white\x7"
  " Reset it when exiting.
  autocmd VimLeave * silent !echo -ne "\E]12;white\x7"
end


" -----------------------------------------------------------------------------
" Plugins Configurations
" -----------------------------------------------------------------------------

" NerdTree
map <F2> :NERDTreeToggle<CR>


" -----------------------------------------------------------------------------
" GUI / Look & Feel
" -----------------------------------------------------------------------------

" Hide buttons in gVim
if has("gui_running")
  if has("gui_gtk2")
    set guioptions-=T
  endif
endif


" -----------------------------------------------------------------------------
" Editing
" -----------------------------------------------------------------------------

syntax on

" Allow plugins by file type
filetype plugin on
filetype indent on
set number

" Make "<BS>" and "<Del>" behavior less surprising. (fix backspace problem )
set backspace=indent,eol,start

set pastetoggle=<F1>


" -----------------------------------------------------------------------------
" Indentation
" -----------------------------------------------------------------------------

set expandtab " insert space chars whenever a tab key is pressed
set tabstop=4 " how many columns a tab counts for
set softtabstop=4 " use 4 space chars for tab with insert mode (since expandtab is enabled)
set shiftwidth=4 " Number of spaces to use for each step of (auto)indent

" Tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" for showing status bar always
set ls=2


" -----------------------------------------------------------------------------
" Mapped Key Bindings
" -----------------------------------------------------------------------------

set pastetoggle=<F1>
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

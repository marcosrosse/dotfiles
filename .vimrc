set autowrite
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Add relative numbers to each line on the left-hand side.
set relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Set color scheme to molokai
colorscheme molokai


" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.
call plug#begin('~/.vim/plugged')
    Plug 'dense-analysis/ale'
    Plug 'preservim/nerdtree'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call  plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.
    inoremap jj <esc>
    " You can split the window in Vim by typing :split or :vsplit.
    " Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l
    " Resize split windows using arrow keys by pressing:
    " CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
    noremap <c-up> <c-w>+
    noremap <c-down> <c-w>-
    noremap <c-left> <c-w>>
    noremap <c-right> <c-w><

    " NERDTree specific mappings.
    " Map the F3 key to toggle NERDTree open and close.
    nnoremap <F3> :NERDTreeToggle<cr>

    " Have nerdtree ignore certain files and directories.
    let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

    " Go syntax highlighting
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_operators = 1

    " Auto formatting and importing
    let g:go_fmt_autosave = 1
    let g:go_fmt_command = "goimports"

    " Status line types/signatures
    let g:go_auto_type_info = 1

    " Run :GoBuild or :GoTestCompile based on the go file
    function! s:build_go_files()
      let l:file = expand('%')
      if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
      elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
      endif
    endfunction

    " Map keys for most used commands.
    " "Ex: `\b` for building, `\r` for running and `\b` for running test.
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <leader>r  <Plug>(go-run)
    autocmd FileType go nmap <leader>t  <Plug>(go-test)

    " Start autocomplete automatically
    au filetype go inoremap <buffer> . .<C-x><C-o>
" }}}


    " VIMSCRIPT -------------------------------------------------------------- {{{

    " This will enable code folding.
    " Use the marker method of folding.
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END

    " More Vimscripts code goes here.
    " If the current file type is YAML or YML, set indentation to 2 spaces.
    autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 expandtab
    autocmd Filetype yml setlocal tabstop=2 shiftwidth=2 expandtab

    " If Vim version is equal to or greater than 7.3 enable undofile.
    " This allows you to undo changes to a file even after saving it.
    if version >= 703
        set undodir=~/.vim/backup
        set undofile
        set undoreload=10000
    endif

    " You can split a window into sections by typing `:split` or `:vsplit`.
    " Display cursorline and cursorcolumn ONLY in active window.
    augroup cursor_off
        autocmd!
        autocmd WinLeave * set nocursorline nocursorcolumn
        autocmd WinEnter * set cursorline cursorcolumn
    augroup END

    " }}}


    " STATUS LINE ------------------------------------------------------------ {{{

    " Status bar code goes here.
    " Clear status line when vimrc is reloaded.
    set statusline=

    " Status line left side.
    set statusline+=\ %F\ %M\ %Y\ %R

    " Use a divider to separate the left side from the right side.
    set statusline+=%=

    " Status line right side.
    set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

    " Show the status on the second to last line.
    set laststatus=2

        " }}}

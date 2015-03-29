set nocompatible
execute pathogen#infect()

" general config
"----------------

  filetype plugin indent on             " load plugin and indent settings based on filetype
  syntax   on                           " syntax highlighting yes please

  set encoding=utf-8
  set number                            " enable line numbers
  set ruler                             " show cursor position information in bottom-left
  set backspace=indent,eol,start        " allow backspacing over everything in insert mode

  " whitespace
  set tabstop=2                         " display tabs as 2 spaces
  set expandtab                         " change tab input to spaces
  set softtabstop=2                     " expandtab width in insert mode
  set shiftwidth=2                      " shift operators (<< >>) move line 2 spaces
  set list listchars=tab:\ \ ,trail:·   " display · in place of whitespace
  set diffopt+=iwhite                   " ignore trailing whitespace in diffs

  " search
  set hlsearch                          " highlight search results
  set ignorecase                        " make search case insensitive
  set smartcase                         " make search case sensitive when using non-lowercase queries

  " status bar
  set laststatus=2                      " always show status bar

  " directories for swp files
  set backupdir=~/.vim/backup
  set directory=~/.vim/backup

  " color schemin'
  color  zenburn
  let g:zenburn_high_Contrast = 1


" plugin config
"---------------

  " Syntastic syntax checking
  "   checks code syntax on file save and displays warnings
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  let g:syntastic_quiet_messages={'level': 'warnings'}

  " airline
  "   makes the status line prettier
  let g:airline_powerline_fonts = 1
  let g:airline_extensions = ['branch', 'syntastic']


" autocommands
"---------------------

  " automatically wrap .txt and markdown files to 72 columns wide
  function s:setupWrapping()
    set wrap
    set textwidth=72
  endfunction
  au BufRead,BufNewFile *.txt call s:setupWrapping()
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupWrapping()

  " makefiles use real tabs
  au FileType make set noexpandtab

  " python files follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python  set tabstop=4 textwidth=79

  " Thorfile, Rakefile, Vagrantfile and Gemfile are ruby files
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

  " highlight all characters past 72 columns
  "augroup highlight_overflow
  "  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  "  autocmd BufEnter * match OverLength /\%72v.*/
  "augroup END


" key mappings
"--------------

  " remove all trailing whitespace by hitting <F5>
  nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

  " Opens an edit command with the path of the currently edited file filled in
  map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

  " remap movement keys to ignore linewraps
  noremap <silent> k gk
  noremap <silent> j gj
  noremap <silent> 0 g0
  noremap <silent> $ g$


" etc.
"---------------

  " Remember last location in file
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
  endif

  " Include user's local vim config
  if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
  endif

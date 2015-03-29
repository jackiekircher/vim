" general config
"----------------

  set guioptions-=T  " start without the toolbar
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h15


" macvim
"--------

  if has("gui_macvim")
    " Fullscreen takes up entire screen
    set fuoptions=maxhorz,maxvert

    " Command-Return for fullscreen
    macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
  endif


" etc.
"---------------

  " Include user's local vim config
  if filereadable(expand("~/.gvimrc.local"))
    source ~/.gvimrc.local
  endif

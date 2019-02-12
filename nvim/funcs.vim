" vim: fdm=marker fmr={{{,}}}

" General helper functions

function! Preserve(cmd)
  " preparation: save last search and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  execute a:cmd
  " clean up: restore previous search history and cursor pos
  let @/=_s
  call cursor(l, c)
endfunction

function! StripTrailingWhitespace()
  call Preserve("$s/\\s\\+$//e")
endfunction

function! EnsureExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path))
  endif
endfunction

function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  " never bdelete a nerd tree
  if match(expand('%'), 'NERD')
    wincmd c
    return
  endif

  " if term window, close gracefully
  if match(expand('%'), 'term://')
    wincmd c
    return
  endif

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction

function! ChangeCurrDir()
  let _dir = expand("%:p:h")
  exec "cd " . escape(_dir, ' ')
  unlet _dir
endfunction

function! <SID>GetGuiAttr(id)
  let l:gui = []
  if synIDattr(a:id, "bold", "gui")
    call add(l:gui, "bold")
  endif
  if synIDattr(a:id, "italic", "gui")
    call add(l:gui, "italic")
  endif
  if synIDattr(a:id, "reverse", "gui")
    call add(l:gui, "reverse")
  endif
  if synIDattr(a:id, "standout", "gui")
    call add(l:gui, "standout")
  endif
  if synIDattr(a:id, "undercurl", "gui")
    call add(l:gui, "undercurl")
  endif
  if synIDattr(a:id, "underline", "gui")
    call add(l:gui, "underline")
  endif
  return join(l:gui, ",")
endfunction

function! <SID>NormalizeColor(color_name)
  let l:color_name = a:color_name
  let l:normal_id = synIDtrans(hlID("Normal"))
  let l:normal_guibg = synIDattr(l:normal_id, "bg", "gui")
  let l:normal_guifg = synIDattr(l:normal_id, "fg", "gui")
  if l:color_name ==? "background" || l:color_name ==? "bg"
    let l:color_name = empty(l:normal_guibg) ? "bg" : l:normal_guibg
  elseif l:color_name ==? "fg" || l:color_name ==? "foreground"
    let l:color_name = empty(l:normal_guifg) ? "fg" : l:normal_guifg
  endif
  return l:color_name
endfunction

function! <SID>GetGuibgAttr(id)
  let l:guibg = synIDattr(a:id, "bg", "gui")
  return <SID>NormalizeColor(l:guibg)
endfunction

function! <SID>GetGuifgAttr(id)
  let l:guifg = synIDattr(a:id, "fg", "gui")
  return <SID>NormalizeColor(l:guifg)
endfunction

function! <SID>GetGuispAttr(id)
  let l:guisp = synIDattr(a:id, "sp", "gui")
  return <SID>NormalizeColor(l:guisp)
endfunction

function! <SID>FixHlGroup(id)
  let l:gui = <SID>GetGuiAttr(a:id)
  let l:guibg = <SID>GetGuibgAttr(a:id)
  let l:guifg = <SID>GetGuifgAttr(a:id)
  let l:guisp = <SID>GetGuispAttr(a:id)
  let l:name = synIDattr(a:id, "name")
  if !empty(l:guisp) && empty(l:guibg + l:guifg)
    let l:guifg = l:guisp
  endif
  execute "highlight " . l:name .
        \ " cterm=" . (empty(l:gui) ? "NONE" : l:gui) .
        \ " guifg=" . (empty(l:guifg) ? "NONE" : l:guifg) .
        \ " guibg=" . (empty(l:guibg) ? "NONE" : l:guibg)
endfunction

function! <SID>FixColorScheme()
  if has("gui_running") || !exists("&termguicolors") || !&termguicolors
    return
  endif
  let l:id = 0
  while 1
    let l:id = l:id + 1
    if synIDtrans(l:id) == 0
      break
    elseif synIDattr(l:id, "name") ==? "Normal"
      continue
    elseif synIDtrans(l:id) != l:id
      continue
    endif
    call <SID>FixHlGroup(l:id)
  endwhile
endfunction

autocmd ColorScheme * call <SID>FixColorScheme()
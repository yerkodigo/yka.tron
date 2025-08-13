"
"
"
"      ██╗   ██╗██╗  ██╗ █████╗    ███╗   ███╗ ██████╗ ███╗   ██╗ ██████╗ 
"      ╚██╗ ██╔╝██║ ██╔╝██╔══██╗   ████╗ ████║██╔═══██╗████╗  ██║██╔═══██╗
"       ╚████╔╝ █████╔╝ ███████║   ██╔████╔██║██║   ██║██╔██╗ ██║██║   ██║
"        ╚██╔╝  ██╔═██╗ ██╔══██║   ██║╚██╔╝██║██║   ██║██║╚██╗██║██║   ██║
"         ██║   ██║  ██╗██║  ██║██╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║╚██████╔╝
"         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ 
"      A fork from jaredgorski/Mies.vim
"
" File:       ykamono.vim
" Maintainer: Yerko Cortes <yerkodigo@gmail.com>
" Repository: https://github.com/yerkodigo/yka.mono
" License:    MIT

scriptencoding utf-8

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="yka.mono"

" ==========================
" Highlighting Function
" ==========================
fun! <sid>hi(group, fg, bg, attr)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" .  a:fg.cterm256
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" .  a:bg.cterm256
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun

" ==========================
" Color Variables - BASE: #ffd000 (escala de amarillos)
" ==========================
" Light
let s:globalTextColor                   = {'gui': '#2a2300', 'cterm256': '94'}   " Color del texto general (tinta cálida oscura)
let s:globalBackgroundColor             = {'gui': '#fffcf0', 'cterm256': '231'}  " Fondo general (papel cálido)
let s:lineNumberColor                   = {'gui': '#806f00', 'cterm256': '136'}  " Números de línea inactivos (mostaza)
let s:diffAddBackgroundColor            = {'gui': '#008700', 'cterm256': '28'}   " Fondo para líneas añadidas en diffs (verde)
let s:cursorLineBackground              = {'gui': '#3a3000', 'cterm256': '94'}   " Fondo base para elementos oscuros (cursor, avisos)
let s:secondaryBackgroundColor          = {'gui': '#262000', 'cterm256': '235'}  " Fondo secundario oscuro y cálido (folds, paneles)
let s:statusLineBackgroundColor         = {'gui': '#e6c200', 'cterm256': '178'}  " Fondo de la barra de estado (ámbar)
let s:visualSelectionColor              = {'gui': '#3a3000', 'cterm256': '58'}   " Fondo de selección visual (solo tema oscuro usa esta var)
let s:commentTextColor                  = {'gui': '#8a8840', 'cterm256': '143'}  " Color del texto de comentarios (oliva suave)
let s:lineNumberActiveColor             = {'gui': '#ffe8a0', 'cterm256': '229'}  " Resaltado de línea actual / visual en claro
let s:menuTextColor                     = {'gui': '#fff1b8', 'cterm256': '230'}  " Texto claro en fondos oscuros y fondo de menús en claro
let s:diffTextHighlightColor            = {'gui': '#664d00', 'cterm256': '94'}   " Fondo para resaltar texto cambiado (DiffText)
let s:warningBackgroundColor            = {'gui': '#ffd000', 'cterm256': '220'}  " Fondo de advertencias/búsquedas (amarillo base)
let s:warningTextColor                  = {'gui': '#5a4500', 'cterm256': '94'}   " Texto de advertencias (marrón oscuro cálido)
let s:diffChangeBackgroundColor         = {'gui': '#fff1a8', 'cterm256': '229'}  " Fondo para líneas modificadas en diffs (amarillo pálido)
let s:errorTextColor                    = {'gui': '#D70000', 'cterm256': '160'}  " Texto de errores (rojo)
let s:none                              = {'gui': 'NONE', 'cterm256': 'NONE'}    " Sin color (NONE)

" Dark
let s:globalTextColorDark               = {'gui': '#ffd000', 'cterm256': '220'}  " Color del texto general (tema oscuro, amarillo base)
let s:globalBackgroundColorDark         = {'gui': '#0f0c00', 'cterm256': '233'}  " Fondo general (negro cálido)
let s:lineNumberColorDark               = {'gui': '#a88f00', 'cterm256': '178'}  " Números de línea (tema oscuro, mostaza)
let s:diffAddBackgroundColorDark        = {'gui': '#00af5f', 'cterm256': '35'}   " Fondo para líneas añadidas (oscuro)

" Aliases y utilitarios
let s:cursorLineBackgroundLight         = {'gui': '#fff5bf', 'cterm256': '229'}  " Fondo suave para CursorLine/Column en claro
let s:menuBackgroundColor               = {'gui': '#806a00', 'cterm256': '136'}  " Fondo de menús/selecciones y separadores (ámbar oscuro)
let s:nonTextColor                      = {'gui': '#4d3f00', 'cterm256': '94'}   " Carácteres no textuales (~, espacios) en claro
let s:cursorBackgroundColor             = {'gui': '#ffd000', 'cterm256': '220'}  " Fondo del cursor/acentos brillantes

" ==========================
" Definitions
" ==========================
" call <sid>hi(GROUP, FOREGROUND, BACKGROUND, ATTRIBUTE)
if &background == 'light'
  " Editor
  call <sid>hi('ColorColumn', s:none, s:menuBackgroundColor, 'none')
  call <sid>hi('Cursor', s:globalBackgroundColor, s:cursorLineBackground, 'none')
  call <sid>hi('CursorColumn', s:none, s:cursorLineBackgroundLight, 'none')
  call <sid>hi('CursorLine', s:none, s:cursorLineBackgroundLight, 'none')
  call <sid>hi('CursorLineNr', s:globalTextColor, s:lineNumberActiveColor, 'none')
  call <sid>hi('Directory', s:globalTextColor, s:none, 'none')
  call <sid>hi('FoldColumn', s:menuTextColor, s:secondaryBackgroundColor, 'none')
  call <sid>hi('Folded', s:menuBackgroundColor, s:none, 'none')
  call <sid>hi('IncSearch', s:warningTextColor, s:statusLineBackgroundColor, 'none')
  call <sid>hi('LineNr', s:lineNumberColor, s:menuTextColor, 'none')
  call <sid>hi('MatchParen', s:globalTextColor, s:menuBackgroundColor, 'none')

  call <sid>hi('Normal', s:globalTextColor, s:globalTextColor, 'none')
  " call <sid>hi('Normal', s:globalTextColor, s:globalBackgroundColor, 'none')
  
  call <sid>hi('Pmenu', s:globalTextColor, s:menuTextColor, 'none')
  call <sid>hi('PmenuSel', s:globalBackgroundColor, s:menuBackgroundColor, 'none')
  call <sid>hi('Search', s:warningTextColor, s:statusLineBackgroundColor, 'none')
  call <sid>hi('SignColumn', s:none, s:statusLineBackgroundColor, 'none')
  call <sid>hi('StatusLine', s:globalBackgroundColor, s:statusLineBackgroundColor, 'none')
  call <sid>hi('StatusLineNC', s:menuTextColor, s:statusLineBackgroundColor, 'none')
  call <sid>hi('VertSplit', s:globalTextColor, s:commentTextColor, 'none')
  call <sid>hi('Visual', s:none, s:lineNumberActiveColor, 'none')

  " General
  call <sid>hi('Boolean', s:globalTextColor, s:none, 'none')
  call <sid>hi('Character', s:globalTextColor, s:none, 'none')
  call <sid>hi('Comment', s:commentTextColor, s:none, 'italic')
  call <sid>hi('Conditional', s:globalTextColor, s:none, 'none')
  call <sid>hi('Constant', s:globalTextColor, s:none, 'none')
  call <sid>hi('Define', s:globalTextColor, s:none, 'none')
  call <sid>hi('DiffAdd', s:globalTextColor, s:diffAddBackgroundColor, 'none')
  call <sid>hi('DiffChange', s:globalTextColor, s:warningTextColor, 'none')
  call <sid>hi('DiffDelete', s:globalTextColor, s:errorTextColor, 'none')
  call <sid>hi('DiffText', s:statusLineBackgroundColor, s:diffTextHighlightColor, 'none')
  call <sid>hi('ErrorMsg', s:globalTextColor, s:errorTextColor, 'none')
  call <sid>hi('Float', s:globalTextColor, s:none, 'none')
  call <sid>hi('Function', s:globalTextColor, s:none, 'none')
  call <sid>hi('Identifier', s:globalTextColor, s:none, 'none')
  call <sid>hi('Keyword', s:globalTextColor, s:none, 'none')
  call <sid>hi('Label', s:globalTextColor, s:none, 'none')
  call <sid>hi('NonText', s:nonTextColor, s:none, 'none')
  call <sid>hi('Number', s:globalTextColor, s:none, 'none')
  call <sid>hi('Operator', s:globalTextColor, s:none, 'none')
  call <sid>hi('PreProc', s:globalTextColor, s:none, 'none')
  call <sid>hi('Special', s:globalTextColor, s:none, 'none')
  call <sid>hi('SpecialKey', s:globalTextColor, s:none, 'none')
  call <sid>hi('SpellBad', s:errorTextColor, s:none, 'italic,undercurl')
  call <sid>hi('SpellCap', s:globalTextColor, s:none, 'italic,undercurl')
  call <sid>hi('SpellLocal', s:globalTextColor, s:none, 'undercurl')
  call <sid>hi('Statement', s:globalTextColor, s:none, 'none')
  call <sid>hi('StorageClass', s:globalTextColor, s:none, 'none')
  call <sid>hi('String', s:globalTextColor, s:none, 'none')
  call <sid>hi('Tag', s:globalTextColor, s:none, 'none')
  call <sid>hi('Title', s:none, s:none, 'bold')
  call <sid>hi('Todo', s:commentTextColor, s:none, 'inverse,bold')
  call <sid>hi('Type', s:none, s:none, 'none')
  call <sid>hi('Underlined', s:none, s:none, 'underline')
  call <sid>hi('WarningMsg', s:warningTextColor, s:cursorLineBackground, 'none')

  " Diff Mode
  if &diff
    call <sid>hi('DiffAdd', s:globalBackgroundColor, s:diffAddBackgroundColor, 'none')
    call <sid>hi('DiffChange', s:globalBackgroundColor, s:diffChangeBackgroundColor, 'none')
    call <sid>hi('DiffDelete', s:errorTextColor, s:diffChangeBackgroundColor, 'none')
    call <sid>hi('DiffText', s:statusLineBackgroundColor, s:diffTextHighlightColor, 'none')
  else
    call <sid>hi('DiffAdd', s:globalTextColor, s:diffAddBackgroundColor, 'none')
    call <sid>hi('DiffChange', s:warningTextColor, s:statusLineBackgroundColor, 'none')
    call <sid>hi('DiffDelete', s:globalTextColor, s:errorTextColor, 'none')
    call <sid>hi('DiffText', s:globalBackgroundColor, s:diffTextHighlightColor, 'none')
  endif

  " ------------
  " Plugins
  " ------------

  " todo.txt
  call <sid>hi('TodoContext', s:globalTextColor, s:none, 'none')
  call <sid>hi('TodoDate', s:globalTextColor, s:none, 'none')
  call <sid>hi('TodoDone', s:commentTextColor, s:none, 'none')
  call <sid>hi('TodoPriorityA', s:globalTextColor, s:none, 'none')
  call <sid>hi('TodoPriorityB', s:globalTextColor, s:none, 'none')
  call <sid>hi('TodoPriorityC', s:globalTextColor, s:none, 'none')
  call <sid>hi('TodoProject', s:globalTextColor, s:none, 'none')

  " Buftabline
  call <sid>hi('BufTabLineActive', s:globalTextColor, s:commentTextColor, 'none')
  call <sid>hi('BufTabLineCurrent', s:globalTextColor, s:menuBackgroundColor, 'none')
  call <sid>hi('BufTabLineFill', s:globalTextColor, s:globalBackgroundColor, 'none')
  call <sid>hi('BufTabLineHidden', s:commentTextColor, s:cursorLineBackground, 'none')
else
  " Editor
  call <sid>hi('ColorColumn', s:none, s:visualSelectionColor, 'none')
  call <sid>hi('Cursor', s:globalBackgroundColorDark, s:globalTextColorDark, 'none')
  call <sid>hi('CursorColumn', s:none, s:cursorLineBackground, 'none')
  call <sid>hi('CursorLine', s:none, s:secondaryBackgroundColor, 'none')
  call <sid>hi('CursorLineNr', s:globalTextColorDark, s:statusLineBackgroundColor, 'none')
  call <sid>hi('Directory', s:globalTextColorDark, s:globalBackgroundColorDark, 'none')
  call <sid>hi('FoldColumn', s:menuTextColor, s:globalBackgroundColorDark, 'none')
  call <sid>hi('Folded', s:menuBackgroundColor, s:none, 'none')
  call <sid>hi('IncSearch', s:globalBackgroundColorDark, s:warningBackgroundColor, 'none')
  call <sid>hi('LineNr', s:menuBackgroundColor, s:secondaryBackgroundColor, 'none')
  call <sid>hi('MatchParen', s:globalTextColorDark, s:commentTextColor, 'none')
  call <sid>hi('Normal', s:globalTextColorDark, s:globalBackgroundColorDark, 'none')
  call <sid>hi('Pmenu', s:none, s:secondaryBackgroundColor, 'none')
  call <sid>hi('PmenuSel', s:none, s:visualSelectionColor, 'none')
  call <sid>hi('Search', s:globalBackgroundColorDark, s:warningBackgroundColor, 'none')
  call <sid>hi('SignColumn', s:none, s:cursorLineBackground, 'none')
  call <sid>hi('StatusLine', s:globalBackgroundColorDark, s:globalTextColorDark, 'none')
  call <sid>hi('StatusLineNC', s:statusLineBackgroundColor, s:lineNumberActiveColor, 'none')
  call <sid>hi('VertSplit', s:globalBackgroundColorDark, s:commentTextColor, 'none')
  call <sid>hi('Visual', s:none, s:visualSelectionColor, 'none')

  " General
  call <sid>hi('Boolean', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('Character', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('Comment', s:commentTextColor, s:none, 'italic')
  call <sid>hi('Conditional', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('Constant', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('Define', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('DiffAdd', s:globalBackgroundColorDark, s:diffAddBackgroundColorDark, 'none')
  call <sid>hi('DiffChange', s:globalBackgroundColorDark, s:warningBackgroundColor, 'none')
  call <sid>hi('DiffDelete', s:globalTextColorDark, s:errorTextColor, 'none')
  call <sid>hi('DiffText', s:globalBackgroundColorDark, s:diffTextHighlightColor, 'none')
  call <sid>hi('ErrorMsg', s:globalTextColorDark, s:errorTextColor, 'none')
  call <sid>hi('Float', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('Function', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('Identifier', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('Keyword', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('Label', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('NonText', s:commentTextColor, s:none, 'none')
  call <sid>hi('Number', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('Operator', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('PreProc', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('Special', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('SpecialKey', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('SpellBad', s:errorTextColor, s:none, 'italic,undercurl')
  call <sid>hi('SpellCap', s:globalTextColorDark, s:none, 'italic,undercurl')
  call <sid>hi('SpellLocal', s:globalTextColorDark, s:none, 'undercurl')
  call <sid>hi('Statement', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('StorageClass', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('String', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('Tag', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('Title', s:none, s:none, 'bold')
  call <sid>hi('Todo', s:commentTextColor, s:none, 'inverse,bold')
  call <sid>hi('Type', s:none, s:none, 'none')
  call <sid>hi('Underlined', s:none, s:none, 'underline')
  call <sid>hi('WarningMsg', s:globalBackgroundColorDark, s:warningBackgroundColor, 'none')

  " Diff Mode
  if &diff
    call <sid>hi('DiffAdd', s:globalBackgroundColorDark, s:diffAddBackgroundColorDark, 'none')
    call <sid>hi('DiffChange', s:globalBackgroundColorDark, s:warningBackgroundColor, 'none')
    call <sid>hi('DiffDelete', s:errorTextColor, s:diffChangeBackgroundColor, 'none')
    call <sid>hi('DiffText', s:globalBackgroundColorDark, s:diffTextHighlightColor, 'none')
  else
    call <sid>hi('DiffAdd', s:diffAddBackgroundColorDark, s:none, 'none')
    call <sid>hi('DiffChange', s:warningBackgroundColor, s:none, 'none')
    call <sid>hi('DiffDelete', s:errorTextColor, s:none, 'none')
    call <sid>hi('DiffText', s:globalBackgroundColorDark, s:diffTextHighlightColor, 'none')
  endif

  " ------------
  " Plugins
  " ------------

  " todo.txt
  call <sid>hi('TodoContext', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('TodoDate', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('TodoDone', s:commentTextColor, s:none, 'none')
  call <sid>hi('TodoPriorityA', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('TodoPriorityB', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('TodoPriorityC', s:globalTextColorDark, s:none, 'none')
  call <sid>hi('TodoProject', s:globalTextColorDark, s:none, 'none')

  " Buftabline
  call <sid>hi('BufTabLineActive', s:globalTextColorDark, s:visualSelectionColor, 'none')
  call <sid>hi('BufTabLineCurrent', s:globalBackgroundColorDark, s:lineNumberActiveColor, 'none')
  call <sid>hi('BufTabLineFill', s:globalBackgroundColorDark, s:globalBackgroundColorDark, 'none')
  call <sid>hi('BufTabLineHidden', s:commentTextColor, s:secondaryBackgroundColor, 'none')
endif

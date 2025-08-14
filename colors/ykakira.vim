"
"
"
"      ██╗   ██╗██╗  ██╗ █████╗ ██╗  ██╗██╗██████╗  █████╗ 
"      ╚██╗ ██╔╝██║ ██╔╝██╔══██╗██║ ██╔╝██║██╔══██╗██╔══██╗
"       ╚████╔╝ █████╔╝ ███████║█████╔╝ ██║██████╔╝███████║
"        ╚██╔╝  ██╔═██╗ ██╔══██║██╔═██╗ ██║██╔══██╗██╔══██║
"         ██║   ██║  ██╗██║  ██║██║  ██╗██║██║  ██║██║  ██║
"         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
"      A fork from jaredgorski/Mies.vim
"
"      >>> Inspirado en la pelicula "Akira" de Katsuhiro Otomo <<<
"
" File:       ykakira.vim
" Maintainer: Yerko Cortes <yerkodigo@gmail.com>
" Repository: https://github.com/yerkodigo/ykakira
" License:    MIT

scriptencoding utf-8

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="ykakira"

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
" Color Variables - BASE: #EFE2D2 #A9B6B8 #1F1C19 #AE5739 #D55E42 #E55A33
" ==========================
" Light
let s:l_fg       = {'gui': '#1F1C19', 'cterm256': '94'}   " Texto principal (oscuro cálido)
let s:l_bg       = {'gui': '#EFE2D2', 'cterm256': '231'}  " Fondo principal claro
let s:l_muted    = {'gui': '#AE5739', 'cterm256': '143'}  " Texto atenuado (comentarios, nontext)
let s:l_accent   = {'gui': '#ffd000', 'cterm256': '220'}  " Acento principal (amarillo base)
let s:l_surface  = {'gui': '#A9B6B8', 'cterm256': '229'}  " Superficie sutil (selección suave, cursorline)
let s:l_danger   = {'gui': '#E55A33', 'cterm256': '160'}  " Error/alerta crítica

" Dark
let s:d_fg       = {'gui': '#EFE2D2', 'cterm256': '220'}  " Texto principal en oscuro
let s:d_bg       = {'gui': '#1F1C19', 'cterm256': '233'}  " Fondo principal oscuro cálido
let s:d_muted    = {'gui': '#A9B6B8', 'cterm256': '178'}  " Texto atenuado en oscuro (comentarios, nontext) timeHMS
let s:d_accent   = {'gui': '#D55E42', 'cterm256': '220'}  " Acento principal en oscuro
let s:d_surface  = {'gui': '#AE5739', 'cterm256': '58'}   " Superficie sutil en oscuro
let s:d_danger   = {'gui': '#A9B6B8', 'cterm256': '203'}  " Error/alerta crítica en oscuro

let s:none       = {'gui': 'NONE', 'cterm256': 'NONE'}

" ==========================
" Definiciones
" ==========================
if &background == 'light'
  " Editor
  call <sid>hi('Normal',       s:l_fg,      s:l_bg,      'none')
  call <sid>hi('ColorColumn',  s:none,      s:l_surface, 'none')
  call <sid>hi('Cursor',       s:l_bg,      s:l_accent,  'none')
  call <sid>hi('CursorColumn', s:none,      s:l_surface, 'none')
  call <sid>hi('CursorLine',   s:none,      s:l_surface, 'none')
  call <sid>hi('CursorLineNr', s:l_fg,      s:l_surface, 'none')
  call <sid>hi('Directory',    s:l_fg,      s:none,      'none')
  call <sid>hi('FoldColumn',   s:l_muted,   s:l_bg,      'none')
  call <sid>hi('Folded',       s:l_muted,   s:l_surface, 'none')
  call <sid>hi('IncSearch',    s:l_bg,      s:l_accent,  'none')
  call <sid>hi('Search',       s:l_bg,      s:l_accent,  'none')
  call <sid>hi('LineNr',       s:l_muted,   s:l_bg,      'none')
  call <sid>hi('MatchParen',   s:l_bg,      s:l_accent,  'bold')
  call <sid>hi('Pmenu',        s:l_fg,      s:l_surface, 'none')
  call <sid>hi('PmenuSel',     s:l_bg,      s:l_accent,  'none')
  call <sid>hi('SignColumn',   s:none,      s:l_bg,      'none')
  call <sid>hi('StatusLine',   s:l_bg,      s:l_accent,  'none')
  call <sid>hi('StatusLineNC', s:l_muted,   s:l_surface, 'none')
  call <sid>hi('VertSplit',    s:l_muted,   s:l_bg,      'none')
  call <sid>hi('Visual',       s:none,      s:l_surface, 'none')

  " Sintaxis general
  call <sid>hi('Boolean',      s:l_fg,      s:none,      'none')
  call <sid>hi('Character',    s:l_fg,      s:none,      'none')
  call <sid>hi('Comment',      s:l_muted,   s:none,      'italic')
  call <sid>hi('Conditional',  s:l_fg,      s:none,      'none')
  call <sid>hi('Constant',     s:l_fg,      s:none,      'none')
  call <sid>hi('Define',       s:l_fg,      s:none,      'none')
  call <sid>hi('ErrorMsg',     s:l_bg,      s:l_danger,  'none')
  call <sid>hi('Float',        s:l_fg,      s:none,      'none')
  call <sid>hi('Function',     s:l_fg,      s:none,      'none')
  call <sid>hi('Identifier',   s:l_fg,      s:none,      'none')
  call <sid>hi('Keyword',      s:l_fg,      s:none,      'none')
  call <sid>hi('Label',        s:l_fg,      s:none,      'none')
  call <sid>hi('NonText',      s:l_muted,   s:none,      'none')
  call <sid>hi('Number',       s:l_fg,      s:none,      'none')
  call <sid>hi('Operator',     s:l_fg,      s:none,      'none')
  call <sid>hi('PreProc',      s:l_fg,      s:none,      'none')
  call <sid>hi('Special',      s:l_fg,      s:none,      'none')
  call <sid>hi('SpecialKey',   s:l_fg,      s:none,      'none')
  call <sid>hi('SpellBad',     s:l_danger,  s:none,      'italic,undercurl')
  call <sid>hi('SpellCap',     s:l_fg,      s:none,      'italic,undercurl')
  call <sid>hi('SpellLocal',   s:l_fg,      s:none,      'undercurl')
  call <sid>hi('Statement',    s:l_fg,      s:none,      'none')
  call <sid>hi('StorageClass', s:l_fg,      s:none,      'none')
  call <sid>hi('String',       s:l_fg,      s:none,      'none')
  call <sid>hi('Tag',          s:l_fg,      s:none,      'none')
  call <sid>hi('Title',        s:none,      s:none,      'bold')
  call <sid>hi('Todo',         s:l_muted,   s:none,      'inverse,bold')
  call <sid>hi('Type',         s:none,      s:none,      'none')
  call <sid>hi('Underlined',   s:none,      s:none,      'underline')
  call <sid>hi('WarningMsg',   s:l_bg,      s:l_accent,  'none')

  " Diff
  call <sid>hi('DiffAdd',      s:l_fg,      s:l_surface, 'none')
  call <sid>hi('DiffChange',   s:l_fg,      s:l_accent,  'none')
  call <sid>hi('DiffDelete',   s:l_danger,  s:l_surface, 'none')
  call <sid>hi('DiffText',     s:l_bg,      s:l_muted,   'none')

  " Plugins (ejemplos)
  call <sid>hi('TodoContext',  s:l_fg,      s:none,      'none')
  call <sid>hi('TodoDate',     s:l_fg,      s:none,      'none')
  call <sid>hi('TodoDone',     s:l_muted,   s:none,      'none')
  call <sid>hi('BufTabLineActive',  s:l_fg,    s:l_surface, 'none')
  call <sid>hi('BufTabLineCurrent', s:l_bg,    s:l_accent,  'none')
  call <sid>hi('BufTabLineFill',    s:l_fg,    s:l_bg,      'none')
  call <sid>hi('BufTabLineHidden',  s:l_muted, s:l_surface, 'none')
else
  " Editor
  call <sid>hi('Normal',       s:d_fg,      s:d_bg,      'none')
  call <sid>hi('ColorColumn',  s:none,      s:d_surface, 'none')
  call <sid>hi('Cursor',       s:d_bg,      s:d_accent,  'none')
  call <sid>hi('CursorColumn', s:none,      s:d_surface, 'none')
  call <sid>hi('CursorLine',   s:none,      s:d_surface, 'none')
  call <sid>hi('Directory',    s:d_fg,      s:none,      'none')
  call <sid>hi('FoldColumn',   s:d_muted,   s:d_bg,      'none')
  call <sid>hi('Folded',       s:d_muted,   s:d_surface, 'none')
  call <sid>hi('IncSearch',    s:d_bg,      s:d_accent,  'none')
  call <sid>hi('Search',       s:d_bg,      s:d_accent,  'none')

  " regla numerica
  call <sid>hi('LineNr',       s:d_bg,   s:d_accent,  'none')
  call <sid>hi('CursorLineNr', s:d_accent,      s:d_bg, 'none')

  call <sid>hi('MatchParen',   s:d_bg,      s:d_accent,  'bold')
  call <sid>hi('Pmenu',        s:d_fg,      s:d_surface, 'none')
  call <sid>hi('PmenuSel',     s:d_bg,      s:d_accent,  'none')
  call <sid>hi('SignColumn',   s:none,      s:d_bg,      'none')
  call <sid>hi('StatusLine',   s:d_bg,      s:d_accent,  'none')
  call <sid>hi('StatusLineNC', s:d_muted,   s:d_surface, 'none')
  call <sid>hi('VertSplit',    s:d_muted,   s:d_bg,      'none')
  call <sid>hi('Visual',       s:none,      s:d_surface, 'none')

  " Sintaxis general
  call <sid>hi('Boolean',      s:d_fg,      s:none,      'none')
  call <sid>hi('Character',    s:d_fg,      s:none,      'none')
  call <sid>hi('Comment',      s:d_muted,   s:none,      'italic')
  call <sid>hi('Conditional',  s:d_fg,      s:none,      'none')
  call <sid>hi('Constant',     s:d_fg,      s:none,      'none')
  call <sid>hi('Define',       s:d_fg,      s:none,      'none')
  call <sid>hi('ErrorMsg',     s:d_bg,      s:d_danger,  'none')
  call <sid>hi('Float',        s:d_fg,      s:none,      'none')
  call <sid>hi('Function',     s:d_fg,      s:none,      'none')
  call <sid>hi('Identifier',   s:d_fg,      s:none,      'none')
  call <sid>hi('Keyword',      s:d_fg,      s:none,      'none')
  call <sid>hi('Label',        s:d_fg,      s:none,      'none')
  call <sid>hi('NonText',      s:d_muted,   s:none,      'none')
  call <sid>hi('Number',       s:d_fg,      s:none,      'none')
  call <sid>hi('Operator',     s:d_fg,      s:none,      'none')
  call <sid>hi('PreProc',      s:d_fg,      s:none,      'none')
  call <sid>hi('Special',      s:d_fg,      s:none,      'none')
  call <sid>hi('SpecialKey',   s:d_fg,      s:none,      'none')
  call <sid>hi('SpellBad',     s:d_danger,  s:none,      'italic,undercurl')
  call <sid>hi('SpellCap',     s:d_fg,      s:none,      'italic,undercurl')
  call <sid>hi('SpellLocal',   s:d_fg,      s:none,      'undercurl')
  call <sid>hi('Statement',    s:d_fg,      s:none,      'none')
  call <sid>hi('StorageClass', s:d_fg,      s:none,      'none')
  call <sid>hi('String',       s:d_fg,      s:none,      'none')
  call <sid>hi('Tag',          s:d_fg,      s:none,      'none')
  call <sid>hi('Title',        s:none,      s:none,      'bold')
  call <sid>hi('Todo',         s:d_muted,   s:none,      'inverse,bold')
  call <sid>hi('Type',         s:none,      s:none,      'none')
  call <sid>hi('Underlined',   s:none,      s:none,      'underline')
  call <sid>hi('WarningMsg',   s:d_bg,      s:d_accent,  'none')

  " Diff
  call <sid>hi('DiffAdd',      s:d_fg,      s:d_surface, 'none')
  call <sid>hi('DiffChange',   s:d_fg,      s:d_accent,  'none')
  call <sid>hi('DiffDelete',   s:d_danger,  s:d_surface, 'none')
  call <sid>hi('DiffText',     s:d_bg,      s:d_muted,   'none')

  " Plugins (ejemplos)
  call <sid>hi('TodoContext',  s:d_fg,      s:none,      'none')
  call <sid>hi('TodoDate',     s:d_fg,      s:none,      'none')
  call <sid>hi('TodoDone',     s:d_muted,   s:none,      'none')
  call <sid>hi('BufTabLineActive',  s:d_fg,    s:d_surface, 'none')
  call <sid>hi('BufTabLineCurrent', s:d_bg,    s:d_accent,  'none')
  call <sid>hi('BufTabLineFill',    s:d_fg,    s:d_bg,      'none')
  call <sid>hi('BufTabLineHidden',  s:d_muted, s:d_surface, 'none')
endif

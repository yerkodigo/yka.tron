"
"
"      ███████╗██╗  ██╗   ██╗███╗   ██╗███╗   ██╗
"      ██╔════╝██║  ╚██╗ ██╔╝████╗  ██║████╗  ██║
"      █████╗  ██║   ╚████╔╝ ██╔██╗ ██║██╔██╗ ██║
"      ██╔══╝  ██║    ╚██╔╝  ██║╚██╗██║██║╚██╗██║
"      ██║     ███████╗██║   ██║ ╚████║██║ ╚████║
"      ╚═╝     ╚══════╝╚═╝   ╚═╝  ╚═══╝╚═╝  ╚═══╝
"                                
" File:       flynn.vim
" Maintainer: Yerko Cortes <yerkodigo@gmail.com>
" Repository: https://github.com/yerkodigo/yka.tron
" License:    MIT

scriptencoding utf-8

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="flynn"

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
" Color Variables - Light Monochrome Theme
" ==========================
let s:fg       = {'gui': '#051f30', 'cterm256': '235'}  " Azul muy oscuro
let s:bg       = {'gui': '#eff4f6', 'cterm256': '117'}  " Azul claro brillante
let s:surface  = {'gui': '#bdd3db', 'cterm256': '110'}  " Superficie más oscura para contraste
let s:none     = {'gui': 'NONE', 'cterm256': 'NONE'}

" ==========================
" Definiciones - Retro Terminal Style
" ==========================
" Editor UI
call <sid>hi('Normal',       s:fg,      s:bg,      'none')
call <sid>hi('ColorColumn',  s:fg,      s:surface, 'none')
call <sid>hi('Cursor',       s:bg,      s:fg,      'none')
call <sid>hi('CursorColumn', s:fg,      s:surface, 'none')
call <sid>hi('CursorLine',   s:fg,      s:surface, 'none')
call <sid>hi('CursorLineNr', s:fg,      s:surface, 'bold')
call <sid>hi('Directory',    s:fg,      s:bg,      'bold')
call <sid>hi('FoldColumn',   s:fg,      s:bg,      'none')
call <sid>hi('Folded',       s:fg,      s:surface, 'italic')
call <sid>hi('IncSearch',    s:bg,      s:fg,      'bold')
call <sid>hi('Search',       s:bg,      s:fg,      'none')
call <sid>hi('LineNr',       s:fg,      s:bg,      'none')
call <sid>hi('MatchParen',   s:bg,      s:fg,      'bold')
call <sid>hi('Pmenu',        s:fg,      s:surface, 'none')
call <sid>hi('PmenuSel',     s:bg,      s:fg,      'bold')
call <sid>hi('SignColumn',   s:fg,      s:bg,      'none')
call <sid>hi('StatusLine',   s:bg,      s:fg,      'bold')
call <sid>hi('StatusLineNC', s:fg,      s:surface, 'none')
call <sid>hi('VertSplit',    s:fg,      s:bg,      'none')
call <sid>hi('Visual',       s:fg,      s:surface, 'none')

" Sintaxis - Jerarquía con estilos tipográficos
call <sid>hi('Comment',      s:fg,      s:bg,      'italic,bold')

" Palabras reservadas y estructuras de control
call <sid>hi('Conditional',  s:fg,      s:bg,      'bold')
call <sid>hi('Keyword',      s:fg,      s:bg,      'bold')
call <sid>hi('Statement',    s:fg,      s:bg,      'bold')
call <sid>hi('Repeat',       s:fg,      s:bg,      'bold')
call <sid>hi('Label',        s:fg,      s:bg,      'bold')

" Funciones e identificadores
call <sid>hi('Function',     s:fg,      s:bg,      'bold')
call <sid>hi('Identifier',   s:fg,      s:bg,      'bold')

" Tipos y clases
call <sid>hi('Type',         s:fg,      s:bg,      'bold')
call <sid>hi('StorageClass', s:fg,      s:bg,      'bold')
call <sid>hi('Structure',    s:fg,      s:bg,      'bold')
call <sid>hi('Typedef',      s:fg,      s:bg,      'bold')

" Constantes y valores
call <sid>hi('Boolean',      s:fg,      s:bg,      'none')
call <sid>hi('Character',    s:fg,      s:bg,      'none')
call <sid>hi('Constant',     s:fg,      s:bg,      'none')
call <sid>hi('Float',        s:fg,      s:bg,      'none')
call <sid>hi('Number',       s:fg,      s:bg,      'none')
call <sid>hi('String',       s:fg,      s:bg,      'none')

" Preprocessor y especiales
call <sid>hi('Define',       s:fg,      s:bg,      'bold')
call <sid>hi('Include',      s:fg,      s:bg,      'bold')
call <sid>hi('Macro',        s:fg,      s:bg,      'bold')
call <sid>hi('PreCondit',    s:fg,      s:bg,      'bold')
call <sid>hi('PreProc',      s:fg,      s:bg,      'bold')

" Operadores y otros
call <sid>hi('Operator',     s:fg,      s:bg,      'none')
call <sid>hi('Special',      s:fg,      s:bg,      'none')
call <sid>hi('SpecialChar',  s:fg,      s:bg,      'bold')
call <sid>hi('SpecialKey',   s:fg,      s:bg,      'none')
call <sid>hi('Tag',          s:fg,      s:bg,      'bold')
call <sid>hi('Delimiter',    s:fg,      s:bg,      'none')

" Elementos de UI y mensajes
call <sid>hi('Title',        s:fg,      s:bg,      'bold,underline')
call <sid>hi('Todo',         s:fg,      s:bg,      'inverse,bold')
call <sid>hi('Underlined',   s:fg,      s:bg,      'underline')
call <sid>hi('ErrorMsg',     s:fg,      s:bg,      'inverse,bold')
call <sid>hi('WarningMsg',   s:fg,      s:bg,      'inverse')
call <sid>hi('NonText',      s:fg,      s:bg,      'none')

" Spell checking
call <sid>hi('SpellBad',     s:fg,      s:bg,      'italic,undercurl')
call <sid>hi('SpellCap',     s:fg,      s:bg,      'italic,undercurl')
call <sid>hi('SpellLocal',   s:fg,      s:bg,      'undercurl')
call <sid>hi('SpellRare',    s:fg,      s:bg,      'undercurl')

" Diff
call <sid>hi('DiffAdd',      s:fg,      s:surface, 'bold')
call <sid>hi('DiffChange',   s:fg,      s:surface, 'none')
call <sid>hi('DiffDelete',   s:fg,      s:surface, 'inverse')
call <sid>hi('DiffText',     s:fg,      s:surface, 'bold,underline')

" Plugins
call <sid>hi('TodoContext',  s:fg,      s:bg,      'none')
call <sid>hi('TodoDate',     s:fg,      s:bg,      'bold')
call <sid>hi('TodoDone',     s:fg,      s:bg,      'italic')
call <sid>hi('BufTabLineActive',  s:fg,    s:surface, 'bold')
call <sid>hi('BufTabLineCurrent', s:bg,    s:fg,      'bold')
call <sid>hi('BufTabLineFill',    s:fg,    s:bg,      'none')
call <sid>hi('BufTabLineHidden',  s:fg,    s:surface, 'none')

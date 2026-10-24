" lightline statusline palette for the Dracula theme, ported from dracula/vim's
" autoload/lightline/colorscheme/dracula.vim with hardcoded hex values so it
" doesn't depend on g:dracula#palette (which only dracula/vim defines) -- we
" use Mofiqul/dracula.nvim as the actual colorscheme instead, to avoid two
" plugins fighting over `:colorscheme dracula`.

" Each color is [guicolor, ctermcolor] -- lightline#colorscheme#flatten()
" below pulls both out of these pairs, so a bare hex string isn't enough.
let s:black    = ['#282A36', 236]
let s:gray     = ['#44475A', 238]
let s:white    = ['#F8F8F2', 253]
let s:darkblue = ['#6272A4', 61]
let s:cyan     = ['#8BE9FD', 117]
let s:green    = ['#50fa7b', 84]
let s:orange   = ['#FFB86C', 215]
let s:purple   = ['#BD93F9', 141]
let s:red      = ['#FF5555', 203]
let s:yellow   = ['#F1FA8C', 228]

if exists('g:lightline')

  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
  let s:p.normal.left = [ [ s:black, s:purple ], [ s:cyan, s:gray ] ]
  let s:p.normal.right = [ [ s:black, s:purple ], [ s:white, s:darkblue ] ]
  let s:p.inactive.right = [ [ s:black, s:darkblue ], [ s:white, s:black ] ]
  let s:p.inactive.left =  [ [ s:cyan, s:black ], [ s:white, s:black ] ]
  let s:p.insert.left = [ [ s:black, s:green ], [ s:cyan, s:gray ] ]
  let s:p.replace.left = [ [ s:black, s:red ], [ s:cyan, s:gray ] ]
  let s:p.visual.left = [ [ s:black, s:orange ], [ s:cyan, s:gray ] ]
  let s:p.normal.middle = [ [ s:white, s:gray ] ]
  let s:p.inactive.middle = [ [ s:white, s:gray ] ]
  let s:p.tabline.left = [ [ s:darkblue, s:gray ] ]
  let s:p.tabline.tabsel = [ [ s:cyan, s:black ] ]
  let s:p.tabline.middle = [ [ s:darkblue, s:gray ] ]
  let s:p.tabline.right = copy(s:p.normal.right)
  let s:p.normal.error = [ [ s:red, s:black ] ]
  let s:p.normal.warning = [ [ s:yellow, s:black ] ]

  let g:lightline#colorscheme#dracula#palette = lightline#colorscheme#flatten(s:p)

endif

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:

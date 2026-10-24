" catppuccin macchiato colorscheme for lightline
" catppuccin/nvim doesn't ship this integration, so it's hand-rolled here
" using the official macchiato palette (https://catppuccin.com/palette).

let s:base   = [ '#24273a', 235 ]
let s:mantle = [ '#1e2030', 234 ]
let s:surface0 = [ '#363a4f', 236 ]
let s:surface1 = [ '#494d64', 238 ]
let s:surface2 = [ '#5b6078', 240 ]
let s:text   = [ '#cad3f5', 189 ]
let s:subtext1 = [ '#b8c0e0', 146 ]
let s:blue   = [ '#8aadf4', 111 ]
let s:green  = [ '#a6da95', 150 ]
let s:mauve  = [ '#c6a0f6', 183 ]
let s:red    = [ '#ed8796', 210 ]
let s:yellow = [ '#eed49f', 223 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ s:base, s:blue, 'bold' ], [ s:text, s:surface0 ] ]
let s:p.normal.right = [ [ s:base, s:subtext1 ], [ s:surface2, s:surface0 ] ]
let s:p.normal.middle = [ [ s:text, s:mantle ] ]
let s:p.normal.error = [ [ s:base, s:red ] ]
let s:p.normal.warning = [ [ s:base, s:yellow ] ]

let s:p.inactive.left =  [ [ s:surface2, s:mantle ], [ s:surface2, s:mantle ] ]
let s:p.inactive.right = [ [ s:surface2, s:mantle ], [ s:surface2, s:mantle ] ]
let s:p.inactive.middle = [ [ s:surface2, s:mantle ] ]

let s:p.insert.left = [ [ s:base, s:green, 'bold' ], [ s:text, s:surface0 ] ]
let s:p.insert.right = copy(s:p.normal.right)
let s:p.insert.middle = copy(s:p.normal.middle)

let s:p.replace.left = [ [ s:base, s:red, 'bold' ], [ s:text, s:surface0 ] ]
let s:p.replace.right = copy(s:p.normal.right)
let s:p.replace.middle = copy(s:p.normal.middle)

let s:p.visual.left = [ [ s:base, s:mauve, 'bold' ], [ s:text, s:surface0 ] ]
let s:p.visual.right = copy(s:p.normal.right)
let s:p.visual.middle = copy(s:p.normal.middle)

let s:p.tabline.left = [ [ s:text, s:surface0 ] ]
let s:p.tabline.tabsel = [ [ s:base, s:blue ] ]
let s:p.tabline.middle = [ [ s:text, s:mantle ] ]
let s:p.tabline.right = [ [ s:text, s:surface0 ] ]

let g:lightline#colorscheme#catppuccin_macchiato#palette = lightline#colorscheme#flatten(s:p)

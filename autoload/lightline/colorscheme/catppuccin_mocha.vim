" catppuccin mocha colorscheme for lightline
" catppuccin/nvim doesn't ship this integration, so it's hand-rolled here
" using the official mocha palette (https://catppuccin.com/palette).

let s:base   = [ '#1e1e2e', 235 ]
let s:mantle = [ '#181825', 234 ]
let s:surface0 = [ '#313244', 236 ]
let s:surface1 = [ '#45475a', 238 ]
let s:surface2 = [ '#585b70', 240 ]
let s:text   = [ '#cdd6f4', 189 ]
let s:subtext1 = [ '#bac2de', 146 ]
let s:blue   = [ '#89b4fa', 111 ]
let s:green  = [ '#a6e3a1', 150 ]
let s:mauve  = [ '#cba6f7', 183 ]
let s:red    = [ '#f38ba8', 210 ]
let s:yellow = [ '#f9e2af', 223 ]

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

let g:lightline#colorscheme#catppuccin_mocha#palette = lightline#colorscheme#flatten(s:p)

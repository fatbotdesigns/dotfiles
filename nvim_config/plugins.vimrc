filetype plugin indent on

" fzf config
set rtp+=~/.fzf
let g:fzf_nvim_statusline = 0 " disable statusline overwriting

" Neomake config
let fileTypesToIgnoreForNeomake = ['haskell']
autocmd! BufWritePost * if index(fileTypesToIgnoreForNeomake, &ft) < 0 | Neomake | endif
let g:neomake_error_sign = {
  \ 'text': '✗',
  \ 'texthl': 'Error',
  \ }

let g:neomake_warning_sign = {
  \ 'text': '⚠',
  \ 'texthl': 'Error',
  \ }

let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_javascript_standard_maker = {
  \ 'args': ['-f', 'compact', '--parser', 'babel-eslint', '-v'],
  \ 'errorformat': '  %f:%l:%c: %m'
  \ }

let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }

" Deoplete
let g:deoplete#enable_at_startup = 1

" Color scheme
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "hard"
syntax on
set background=dark
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" use \ for fzf search
if !exists(":Ag")
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

" delimitMate options
let delimitMate_expand_cr=1

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

" JS
let g:jsx_ext_required = 0

" Airline
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 0

" Vim Surround
"" Django
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

" on save, strip whitespace
autocmd BufWritePre * StripWhitespace

" filetype
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim


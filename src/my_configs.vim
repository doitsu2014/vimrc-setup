packloadall
syntax enable
colorscheme dracula

set encoding=UTF-8
set number
set numberwidth=2
set cpoptions+=n

set splitbelow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'python': ['flake8'],
\   'vim': ['vim-language-server'],
\   'rust': ['rustc', 'analyzer'],
\   'sh': ['language_server'],
\   'markdown': ['mdl']
\}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'json': ['prettier'],
\   'html': ['prettier'],
\   'yaml': ['prettier'],
\   'vim': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'markdown': ['pandoc']
\}

let g:ale_fix_on_save=1
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
nmap <silent> <leader>gd <Plug>(ale_go_to_definition_in_tab)
nmap <silent> <leader>fr <Plug>(ale_find_references)

"==========================Setting of Vimspector==================================
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>dtl :VimspectorToggleLog<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval"
let g:vimspector_install_gadgets = ['vscode-cpptools', 'CodeLLDB']
"=========================+++++++++++++++++++++===================================
"
nnoremap <silent> <Leader>szu :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>szd :exe "resize " . (winheight(0) * 2/3)<CR>

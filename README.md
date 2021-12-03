# Introduction
This is a bootstrap setting up Vim with many modern plugins.<br/>
You can execute below commands to boost your workspace:
```
cd ./src
bash all-in-one.sh
```

# Features
- Modern GUI
- Debuggable on Rust, C, C++

# Settings

## Key Mappings

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) is `,`, so whenever you see `<leader>` it means `,`.


### Normal mode mappings

Fast saving of a buffer (`<leader>w`):

	nmap <leader>w :w!<cr>
	
Map `<Space>` to `/` (search) and `<Ctrl>+<Space>` to `?` (backwards search):
	
	map <space> /
	map <C-space> ?
	map <silent> <leader><cr> :noh<cr>

Disable highlights when you press `<leader><cr>`:
	
	map <silent> <leader><cr> :noh<cr>

Smart way to move between windows (`<ctrl>j` etc.):
	
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

Closing of the current buffer(s) (`<leader>bd` and (`<leader>ba`)):
	
	" Close current buffer
	map <leader>bd :Bclose<cr>
	
	" Close all buffers
	map <leader>ba :1,1000 bd!<cr>
	
Useful mappings for managing tabs:
	
	map <leader>tn :tabnew<cr>
	map <leader>to :tabonly<cr>
	map <leader>tc :tabclose<cr>
	map <leader>tm :tabmove 
	
	" Opens a new tab with the current buffer's path
	" Super useful when editing files in the same directory
	map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
	
Switch [CWD](http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file) to the directory of the open buffer:
	
	map <leader>cd :cd %:p:h<cr>:pwd<cr>
	
Open `ack.vim` for fast search:
	
	map <leader>g :Ack 

Quickly open a buffer for scripbble:
	
	map <leader>q :e ~/buffer<cr>

Toggle paste mode on and off:
	
	map <leader>pp :setlocal paste!<cr>


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>

When you press gv you `Ack.vim` after the selected text:

	vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

When you press `<leader>r` you can search and replace the selected text:

	vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

Surround the visual selection in parenthesis/brackets/etc.:

    vnoremap $1 <esc>`>a)<esc>`<i(<esc>
    vnoremap $2 <esc>`>a]<esc>`<i[<esc>
    vnoremap $3 <esc>`>a}<esc>`<i{<esc>
    vnoremap $$ <esc>`>a"<esc>`<i"<esc>
    vnoremap $q <esc>`>a'<esc>`<i'<esc>
    vnoremap $e <esc>`>a`<esc>`<i`<esc>


### Insert mode mappings

Quickly insert parenthesis/brackets/etc.:

    inoremap $1 ()<esc>i
    inoremap $2 []<esc>i
    inoremap $3 {}<esc>i
    inoremap $4 {<esc>o}<esc>O
    inoremap $q ''<esc>i
    inoremap $e ""<esc>i
    inoremap $t <><esc>i

Insert the current date and time (useful for timestamps):

    iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


### Command line mappings

$q is super useful when browsing on the command line. It deletes everything until the last slash:

    cno $q <C-\>eDeleteTillSlash()<cr>

Bash like keys for the command line:

    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

Write the file as sudo (works only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 


### Plugin related mappings

Open [bufexplorer](https://github.com/vim-scripts/bufexplorer.zip) to see and manage the current buffers (`<leader>o`):
    
    map <leader>o :BufExplorer<cr>

Open [ctrlp.vim](https://github.com/kien/ctrlp.vim) plugin to quickly find a file or a buffer (`<leader>j` or `<ctrl>f`):

    " Quickly find and open a file in the CWD
    let g:ctrlp_map = '<C-f>'

    " Quickly find and open a recently opened file
    map <leader>f :MRU<CR>

    " Quickly find and open a buffer
    map <leader>b :CtrlPBuffer<cr>

[NERD Tree](https://github.com/preservim/nerdtree) mappings:

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nb :NERDTreeFromBookmark 
    map <leader>nf :NERDTreeFind<cr>

[goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2) lets you only focus on one thing at a time. It removes all the distractions and centers the content. It has a special look when editing Markdown, reStructuredText and textfiles. It only has one mapping. (`<leader>z`)

    map <leader>z :Goyo<cr>

[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) mappings to manage multiple cursors at once:

    let g:multi_cursor_start_word_key      = '<C-s>'
    let g:multi_cursor_select_all_word_key = '<A-s>'
    let g:multi_cursor_start_key           = 'g<C-s>'
    let g:multi_cursor_select_all_key      = 'g<A-s>'
    let g:multi_cursor_next_key            = '<C-s>'
    let g:multi_cursor_prev_key            = '<C-p>'
    let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'

[vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack) mappings to manage the kill-ring (clipboard):

    nmap <C-p> <Plug>yankstack_substitute_older_paste
    nmap <C-n> <Plug>yankstack_substitute_newer_paste

[ctrl-p](https://github.com/ctrlpvim/ctrlp.vim) mappings to easily find and open a file, buffer, etc.:

    let g:ctrlp_map = '<C-f>'
    map <leader>j :CtrlP<cr>
    map <C-b> :CtrlPBuffer<cr>

[vim-snipmate](https://github.com/garbas/vim-snipmate) mappings to autocomplete via snippets:

    ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
    snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>

[vim-surround](https://github.com/tpope/vim-surround) mappings to easily surround a string with `_()` gettext annotation:

    vmap Si S(i_<esc>f)
    au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

[ale](https://github.com/dense-analysis/ale) to easily go to the next Ale syntax/lint error:

    nmap <silent> <leader>a <Plug>(ale_next_wrap)

[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) the default mapping to toggle the plugin is (`<leader>ig`)

    You can also use the following commands inside Vim:
    :IndentGuidesEnable
    :IndentGuidesDisable
    :IndentGuidesToggle

[vim-fugitive](https://github.com/tpope/vim-fugitive) to copy the link to the line of a Git repository to the clipboard:

    nnoremap <leader>v :.GBrowse!<CR>
    xnoremap <leader>v :'<'>GBrowse!<CR>


### Spell checking
Pressing `<leader>ss` will toggle spell checking:

    map <leader>ss :setlocal spell!<cr>

Shortcuts using `<leader>` instead of special characters:

    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=

### Running Code
To run code directly from vim, press `F5`. The currently open code will execute without you having to type anything.

Can be used to execute code written in C, C++, Java, Python, Go, Octave, Bash scripts and HTML. To edit how you want your code to be executed, make changes in the file 
```
~/vim_runtime/vimrcs/extended.vim
```

### Cope
Query `:help cope` if you are unsure what cope is. It's super useful!

When you search with `Ack.vim`, display your results in cope by doing:
`<leader>cc`

To go to the next search result do:
`<leader>n`

To go to the previous search results do:
`<leader>p`

Cope mappings:

    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>



# References
- [The Ultimate vimrc](https://github.com/amix/vimrc)
- [The Ultimate vimrc by me](https://github.com/doitsu2014/vimrc)

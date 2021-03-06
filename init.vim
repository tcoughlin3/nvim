" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/goyo.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'connorholyday/vim-snazzy'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/csv.vim'

call plug#end()

let g:gruvbox_italic=1
set termguicolors

let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'medium'

syntax enable
colorscheme one 
set background=light

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:ag_working_path_mode="r"
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#config_precedence = 'file-override'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_open_list = 1
" let g:ale_set_quickfix = 1
let g:csv_highlight_column = 'y'

let NERDTreeShowHidden = 1

let g:coc_global_extensions = [ 'coc-tsserver' ]

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


let g:lightline = {
      \ 'colorscheme': 'one',
     \ }

set noshowmode

let g:one_allow_italics = 1 
highlight Comment cterm=italic gui=italic

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['flow']
\}

highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
" let g:ale_sign_error = 'X' " could use emoji
" let g:ale_sign_warning = '?' " could use emoji

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" https://rietta.com/blog/hide-gitignored-files-fzf-vim/
" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
nnoremap <expr> <leader>f (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
nnoremap <Leader>s :Ack!<Space>

"Paste in visual mode without copying
xnoremap p pgvy

set expandtab
set shiftwidth=2
set softtabstop=2

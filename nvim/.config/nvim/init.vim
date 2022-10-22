syntax on
set relativenumber
set autoindent


call plug#begin('~/.vim/plugged')

" Airline plugin.
Plug 'vim-airline/vim-airline'

" Color scheme plugin.
Plug 'morhetz/gruvbox'

" Nerd tree.
Plug 'preservim/nerdtree'

" Auto completeion + LSP features
Plug 'neoclide/coc.nvim', {'branch':'release'}

" FZF to find files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Options for Ctrl+P plugin
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP' " map ctrl+p keys to plugin
" let g:ctrlp_working_path_mode = 'ra' " go up to ancestor with .git
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Make FZF performs more like CtrlP
nnoremap <C-p> :Files<CR>

" Options for coc vim plugin
" Tab for auto completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Copied from gruvbox installation wiki.
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

autocmd vimenter * ++nested colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'


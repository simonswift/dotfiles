execute pathogen#infect()
execute pathogen#helptags()

set nocp
set nocompatible                  " Must come first because it changes other options.

syntax on
filetype plugin indent on

set t_Co=256
set background=dark
colorscheme badwolf

autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeShowHidden=1

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set incsearch                     " Show match when typing
set hlsearch                      " Highlight all search matches
set laststatus=2                  " Always show status bar
set lazyredraw                    " Dont redraw between marcos
set timeoutlen=500                " Time to wait for second key press

set backspace=indent,eol,start    " Intuitive backspacing.
set foldmethod=manual

set number
set hidden
set autoindent

set wrap                            " Turn on line wrapping.
"set scrolloff=3                    " Show 3 lines of context around the cursor.

" Do I want to keep these? Or should I let vim handle backups?
set nobackup
"set backup
"set backupdir=~/.vim/backup
set noswapfile

set pastetoggle=<F2>

set mouse=a
set clipboard=unnamed
noremap ; :

nnoremap j gj
nnoremap k gk

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set cursorline
set ai
set ts=2
set softtabstop=2

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

set showmatch "show matching brackets

set list
" Set line endings to show as ¬ instead of $ when viewing in :set list mode
set lcs=eol:¬

" Map leader to , and \
map , \

" Tab mappings.
" map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove
nmap <leader>b :call InsertDebugger()<CR>
nmap <leader>dd :call InsertDebugger()<CR>
nmap <silent><leader>gb :call GitBlame()<CR>
nmap <silent><leader>f :NERDTreeToggle<CR>

" Syntax checking for Ruby files hitting F9
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

" CTRL + n = remove blank space at the end of lines
nnoremap <silent> <C-n> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Set file type to Ruby for common files such as ui files and Gemfiles
au BufRead,BufNewFile *.ui set filetype=ruby
au BufRead,BufNewFile *.mustache set filetype=javascript
au BufNewFile,BufRead *.ctp set filetype=html
au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead Rakefile set filetype=ruby
au BufNewFile,BufRead Fudgefile set filetype=ruby

" Run test on the whole file
nmap <silent><leader>tf :call RunTest(' -- '. @%)<CR>

" Run tests on the current line
nmap <silent><leader>tt :call TestLine()<CR>

function! ExecCmd(command)
  silent !clear
  execute "!echo " . a:command . " && " . a:command
endfunction

function! TestLine()
  let l:command =  "-f documentation -l " . line(".") . ' ' . @%
  call RunTest(l:command)
endfunction

function! RunTest(command)
  let g:command = (system("pgrep zeus") != '') ? "zeus " : "bundle exec "

  if filereadable("./bin/rspec")
    let g:command = "./bin/"
  endif

  let g:command .= 'rspec  ' . a:command
  call ExecCmd(g:command)
endfunction

function! InsertDebugger()
  if(&filetype == 'ruby')
    :normal orequire 'pry'; binding.pry
  else
    :normal odebugger
  endif
  :normal ==
endfunction

function! GitBlame()
  let l:p = -3 + line('.')
  let l:n = 3 + line('.')
  let l:command = "git blame " . @% . " -w -L " . l:p . "," . l:n
  echo system(l:command)
endfunction

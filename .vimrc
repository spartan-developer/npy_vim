set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
set nowrap
filetype plugin indent on
color xoria256
set guifont=Monaco:h14
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set guioptions-=T


let mapleader="\\"

autocmd FileType ruby set omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
"let g:rubycomplete_rails = 1

"if has("autocmd")
    "autocmd FileType ruby set omnifunc=rubycomplete#Complete
    "autocmd FileType ruby let g:rubycomplete_buffer_loading=1
    "autocmd FileType ruby let g:rubycomplete_classes_in_global=1
"endif

" online documentation search
function! OnlineDoc()
  if &ft =~ "ruby"
    let s:urlTemplate = "http://railsapi.com/doc/rails-v3.2.3/?q=%"
  else
    return
  endif
  let s:wordUnderCursor = expand("<cword>")
  let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
  let s:cmd = "!open \"" . s:url . "\""
  execute s:cmd
endfunction

map <silent> <leader>d :call OnlineDoc()<CR>
imap <leader>s <Esc>:w<CR>
nmap <leader>s :w<CR>
" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>

let g:ruby_debugger_progname = 'mvim'
"let g:ruby_debugger_builtin_sender = 0


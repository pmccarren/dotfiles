syntax on
set viminfo='1000000,\"1000000
set nocompatible        " Use Vim defaults (much better!)
set bs=indent,eol,start " allow backspacing over everything in insert mode
set history=200         " keep 50 lines of command line history
set ruler
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set showcmd
set noexpandtab

" if (&term == "iterm") || (&term == "putty") || (&term == 'xterm') || (&term == 'xterm-color')
  set background=dark
  color peachpuff
" endif

" set position to last known, except when ft includes 'commit'
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" PHP lint check (CTRL-L)
:autocmd FileType php noremap <F7> :!clear; php -l %<CR>
" git diff in new buffer
:map <F8> :new<CR>:set syntax=diff buftype=nofile<CR>:read !git diff #:p<CR>gg
" git blame in new buffer
:map <F9> :new<CR>:set syntax=php buftype=nofile<CR>:read !git blame #:p<CR>gg
" insert logger line
:map <C-L> oLog::message('', LOG_LEVEL_INFO);<C-O>18h

" set insert mode for gitcommit messages
autocmd FileType gitcommit startinsert!

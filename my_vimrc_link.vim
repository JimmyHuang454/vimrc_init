let s:startup_start    = reltimefloat(reltime())
let s:current_file_dir = expand('<sfile>:p:h')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               load plug.vim                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:plug_path  = s:current_file_dir . '/plug.vim'
exe 'so ' s:plug_path

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    find and load plugin dir of plug.vim                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:plugin_dir = get(g:,'plugin_dir', s:current_file_dir . '/Plugins/')

silent! call plug#begin(g:plugin_dir)
  Plug 'lifepillar/vim-solarized8'
call plug#end()
let g:using_color_scheme = get(g:, 'using_color_scheme', 'solarized8')
try
  exe printf('colorscheme %s', g:using_color_scheme)
catch 
  echo "unknow color: " . g:using_color_scheme
endtry

silent! call plug#begin(g:plugin_dir)

  try
    let s:myvimrc_file_1 = g:plugin_dir . 'MyVimfiles/plugin/my_vimrc.vim'
    exe 'so ' . s:myvimrc_file_1
    let s:myvimrc_file_2 = g:plugin_dir . 'MyVimfiles/autoload/main.vim'
    exe 'so ' . s:myvimrc_file_2
  catch
    echo "Can't find/load myvimrc, Install it firstly.\n" . v:exception . '\n' . v:throwpoint
  endtry

  Plug 'JimmyHuang454/MyVimfiles'
call plug#end()

let s:startup_end     = reltimefloat(reltime())
let g:my_startup_time = s:startup_end - s:startup_start

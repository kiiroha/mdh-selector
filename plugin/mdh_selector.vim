let s:save_cpo = &cpo
set cpo&vim

command! MarkdownHeaderSelector call mdh_selector#popup()

let &cpo = s:save_cpo
unlet s:save_cpo

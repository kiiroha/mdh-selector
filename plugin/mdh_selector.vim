let s:save_cpo = &cpo
set cpo&vim

command! MarkdownHeaderSelect call mdh_selector#popup()

let &cpo = s:save_cpo
unlet s:save_cpo

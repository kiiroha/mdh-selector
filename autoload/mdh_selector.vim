function! s:get_markdown_header() abort

    let lines = []
    let line_number = 0

    " TODO #, ## ではなく ツリー表示などだとわかりやすそう
    for line in getline(1, "$")

        let l:line_number = l:line_number + 1

        if line[0] == "#"
            call add(lines, {'number': l:line_number, 'line': line})
        endif
    endfor

    return lines

endfunction

function! s:change_cursor(id, selected_number, headers) abort

    call cursor(a:headers[a:selected_number - 1].number, 0)

endfunction

function! mdh_selector#popup() abort

    let headers = s:get_markdown_header()

    let l:callback = {'arg': headers}
    function l:callback.funcall(id, selected) dict
        call s:change_cursor(a:id, a:selected, self.arg)
    endfunction

    if empty(headers)
        echo "There is no header."
    else
        let header_list = []

        for header in headers
            call add(header_list, header.line)
        endfor

        call popup_menu(header_list,
                        \ #{ callback: l:callback.funcall })
    endif

endfunction


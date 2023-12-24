
function! s:get_markdown_header() abort
    let lines = []
    let line_number = 0

    " TODO #, ## ではなく | ─ のツリー表示だとわかりやすそう
    for line in getline(1, "$")

        let line_number += 1

        if line[0] == "f"
            call add(lines, {'number': line_number, 'line': line})
        endif
    endfor

    return lines

endfunction

function! s:change_cursor(id, result) abort

    if a:result > -1

        let row = search(s:headers[a:result - 1], "cn")

        if row > 0
            call cursor(row, 0)
        endif
    endif
endfunction

function! mdh_selector#popup() abort
    let s:headers = s:get_markdown_header()

    call popup_menu(s:headers['line'],
                    \ #{ callback: 's:change_cursor' })

endfunction


function! s:get_markdown_header() abort
    let lines = []

    " TODO #, ## ではなく | ─ のツリー表示だとわかりやすそう
    for line in getline(1, "$")
        if line[0] == "#"
            call add(lines, line)
        endif
    endfor

    return lines
endfunction


function! mdh_selector#popup() abort
    let s:headers = s:get_markdown_header()

    call popup_menu(s:headers,
                    \ #{ callback: 's:change_cursor' })

endfunction

function! s:change_cursor(id, result) abort

    if a:result > -1

        let row = search(s:headers[a:result - 1], "cn")

        if row > 0
            call cursor(row, 0)
        endif
    endif
endfunction

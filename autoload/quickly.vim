if exists("b:did_autoload_quickly")
    finish
endif
let b:did_autoload_quickly = 1

function! s:quickly_filename(snippetname)
    return fnamemodify(g:quicklyPath . "/" . a:snippetname . ".js", ":p")
endfunction

function! Quickly#Edit(snippetname) abort
    let filepath = s:quickly_filename(a:snippetname)

    let prev_not_existed = !filereadable(filepath) && bufwinnr(filepath) == -1

    execute "sp " . filepath

    if prev_not_existed
	call nvim_put(["const snippet = (args) => {", "\treturn `Hello world`;", "};", "", "process.stdout.write(snippet(process.argv.slice(2)));"], 'c', v:false, v:true)
    endif
endfunction

function! Quickly#Snippet(snippetname, ...)
    let filepath = s:quickly_filename(a:snippetname)

    if !filereadable(filepath)
	throw "Snippet `" . a:snippetname . "` does not exist"
    endif

    let output = system("node " . filepath . " " . join(a:000))

    call nvim_put(split(output, '\n'), 'l', v:true, v:true)
endfunction

function! Quickly#SnippetCompletion(ArgLead, CmdLine, CursorPos)
    let files = map(split(globpath(g:quicklyPath, '**/*'), '\n'), 'fnamemodify(v:val, ":t:r")')
    return filter(files, 'v:val =~ "^'. a:ArgLead .'"')
endfunction

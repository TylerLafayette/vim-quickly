if exists("b:did_plugin_quickly")
	finish
endif
let b:did_plugin_quickly = 1

let g:quicklyPath = "~/.quickly-snippets"

command! -bang -complete=customlist,Quickly#SnippetCompletion -nargs=* QuicklyEdit call Quickly#Edit(<f-args>)
command! -bang -complete=customlist,Quickly#SnippetCompletion -nargs=* QuicklySnippet call Quickly#Snippet(<f-args>)

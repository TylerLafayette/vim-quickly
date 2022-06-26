# vim-quickly

Use JavaScript scripts as snippets in vim.

## Note

This is my first vim plugin, and my Vimscript knowledge is _very_ limited. This plugin is more of a prototype than anything and I made it to use as a personal tool so it may be buggy, badly optimized, not secure, badly documented etc.

This plugin also simply calls `node`, so make sure you have node installed and in the PATH.

## How to use

Run `:QuicklyEdit <snippet-name>` to open a buffer with the default "Hello world" snippet in it. A snippet is simply a script that transforms CLI args and outputs some text to stdout. A typical snippet may look like this:

```js
const snippet = (args) => {
	// This snippet just outputs a formatted array of the args provided to it.
	// For example:
	// 	:QuicklySnippet this-snippet Hello world
	// 	-> ["Hello", "world"]

	return `[${args.map(arg => `"${arg}"`).join(", ")}]`;
};

process.stdout.write(snippet(process.argv.slice(2)));
```

Once you have a snippet ready, run `:QuicklySnippet <snippet-name> <args...>` to run the snippet and insert the result into the current buffer.

# Config

You can set `g:quicklyPath` to set the location of the snippet files.

# 2html.sh

Do HTML code syntax highlighting of files using vim's `TOhtml` feature

This allows you to generate HTML of highlighted code from the command line or
in a shell script, using only vim and this short shell script. It is a little
slow (about 170ms on my computer to highlight this README file) but it works,
depends only on vim, and allows for using vim's wide range of
syntaxes/languages and themes.

If you run `:help 2html` in vim you can learn more about the TOhtml feature.
You will find a command in there to do the conversion in one line. The 2html.sh
script here basically wraps that command, while running in a temp directory
(because I had problems earlier with 2html.vim and conflicting swap files) and
allowing for extracting the body or CSS from the resulting HTML.

## Usage

`2html.sh [options] files...`

### Options

- `-b` `--body`: output only the body of the produced html. default is to
output an entire html file
- `-c` `--css`: output the generated CSS rules separately on fd 3.

## Example

	#!/bin/sh
	cat <<-EOF
		<html>
			<head>
				<link rel="stylesheet" href="syntax.css">
			</head>
		<body>
	EOF
	2html.sh --body --css coolfile.c 3>syntax.css
	echo '</body></html>'

## License

MIT

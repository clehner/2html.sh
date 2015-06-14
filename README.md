# 2html.sh

Do HTML code syntax highlighting of files using vim's `TOhtml` feature

This allows you to generate HTML of highlighted code from the command line or
in a shell script, using only vim and this short shell script. It is a little
slow (about 170ms on my computer to highlight this README file) but it works,
depends only on vim, and allows for using vim's wide range of
syntaxes/languages and color schemes.

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
- `-c file` `--css file`: output the generated CSS rules separately to the
  given file
- `-o theme` `--colorscheme theme`: use the given color scheme
- `-s file` `--source file`: source the given file before rendering

The `--source` option is provided mainly as an alternative for `--colorscheme`
for colorschemes that are not in vim's default runtime path, since we skip
loading your .vimrc and plugins to improve performance. So to use a
non-built-in colorscheme, use e.g. `--source ~/.vim/colors/coolscheme.vim`


## Example

	cat >coolfile.html <<EOF
		<html>
			<head>
				<link rel="stylesheet" href="syntax.css">
			</head>
		<body>
			$(2html.sh --body --css syntax.css coolfile.c)
		</body>
	</html>
	EOF

## License

MIT

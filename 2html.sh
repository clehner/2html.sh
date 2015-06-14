#!/bin/sh
# 2html - render a file as html using 2html.vim

opt_body=
opt_css=

file2html() {
	local srcfile="$tmpdir/$(basename "$1")"
	cp "$1" "$srcfile"

	vim -E -s -c "let g:html_no_progress=1" -c "syntax on" \
		-c "colo github" \
		-c "runtime syntax/2html.vim" \
		-cwqa "$srcfile" >&-

	if test -n "$opt_body"
	then sed -n '/<pre/,/<\/pre>/p'
	else cat
	fi <"$srcfile.html"

	if test -n "$opt_css"
	then sed -n '0,/<style/d; /^<!--/d; /^-->/q; p' <"$srcfile.html" >&3
	fi

	rm "$srcfile" "$srcfile.html"
}

# move to a temp dir so that existing swap files don't interfere
tmpdir=$(mktemp -d)
test -d "$tmpdir" || exit 1
trap "rm -rf $tmpdir" 0 1 2 3 15

for arg
do case "$arg" in
	-b|--body) opt_body=1;;
	-c|--css) opt_css=1;;
	*) file2html "$arg";;
esac done

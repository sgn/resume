#!/bin/sh
CDPATH=
export CDPATH
BASEDIR=$(dirname "$0")
cd "$BASEDIR"
grep -ohr 'class=\(["'"'"']\)org\(-[[:alnum:]]\+\)\+\1' ../_posts \
	| sed "s/'/\"/g" \
	| cut -d'"' -f2 \
	| sort | uniq \
	| xargs printf '/^\.%s[[:space:]]/,/^}/p\n' \
	| tee patterns.sed

sed -nf patterns.sed syntax.css > ../_assets/css/syntax.scss

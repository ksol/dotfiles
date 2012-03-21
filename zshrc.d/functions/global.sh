#! /usr/bin/env zsh

# Search recursively in parent dir
function findup()
{
	arg="$1"
	if test -z "$arg"; then exit 1; fi

	while ! test -e "$arg"; do
    cd ..
    if test "$PWD" = "/"; then
      exit 1
    fi
  done

	echo $PWD/$arg
}

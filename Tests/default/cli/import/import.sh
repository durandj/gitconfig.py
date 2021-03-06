#!/usr/bin/env bash
{ set +x; } 2>/dev/null 

IFS=
[[ -n ${#BASH_SOURCE[@]} ]] && [[ $((${#BASH_SOURCE[@]}*$SHLVL)) == 1 ]] && {
	{ set -x; cd "${BASH_SOURCE[0]%/*/*/*/*/*}"; { set +x; } 2>/dev/null; }
}

! [ -e setup.py ] && echo "ERROR: setup.py NOT EXISTS" && exit 0

[[ $PWD != *.py ]] && exit 0

name="${PWD##*/}"
name="${name/.py/}"
( set -x; python -c "import $name" ) || exit
# raise AttributeError if invalid __all__
( set -x; python -c "from $name import *" ) || exit

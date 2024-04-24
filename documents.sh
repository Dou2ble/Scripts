#!/bin/sh

cd ~/Documents/ || exit 1

document="$(ls | dmenu -p 'Document')"

reader="$(printf 'zathura\nokular\nlibreoffice\nimv' | dmenu -p 'Reader')"
"$reader" "$document"

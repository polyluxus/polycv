#!/bin/bash

if [[ ${PWD##*/} != "examples" ]] ; then
  echo "$PWD is probably not the right examples directory."
  exit 2
fi

for example in * ; do 
  [[ -d "$example" ]] || continue
  pushd "$example" || exit 1
  if [[ -r 'main.tex' ]] ; then
    pdflatex main 
    biber main
    pdflatex main 
    pdflatex main 
    [[ -r "main.pdf" ]] && pdftoppm main.pdf main.page -png
    popd || exit 1
  fi
done

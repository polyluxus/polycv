#!/bin/bash

if [[ ${PWD##*/} != "latex" ]] ; then
  echo "$PWD is probably not the directory with the source file."
  exit 2
fi

src_dtx="polycv.dtx"
src_ins="polycv.ins"
if [[ ! -r "$src_dtx" ]] ; then
  echo "Source file '$src_dtx' missing or not readable."
  exit 1
fi
if [[ ! -r "$src_ins" ]] ; then
  echo "Source file '$src_ins' missing or not readable."
  exit 1
fi

echo "Building package."
pdflatex "$src_ins"
echo "Building Documentation"
pdflatex "$src_dtx" 
makeindex -s gind.ist -o "${src_dtx%.*}.ind" "${src_dtx%.*}.idx"
makeindex -s gglo.ist -o "${src_dtx%.*}.gls" "${src_dtx%.*}.glo"
pdflatex "$src_dtx" 
pdflatex "$src_dtx" 
pdflatex "$src_dtx" 


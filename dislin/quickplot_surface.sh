#!/bin/bash
#
gfortran -c -g quickplot_surface.f >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling quickplot_surface.f"
  exit
fi
rm compiler.txt
#
gfortran quickplot_surface.o -L/usr/local/dislin -ldislin -L/opt/local/lib -lXm
if [ $? -ne 0 ]; then
  echo "Errors linking and loading quickplot_surface.o."
  exit
fi
#
rm quickplot_surface.o
#
mv a.out quickplot_surface
./quickplot_surface > quickplot_surface_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running quickplot_surface."
  exit
fi
rm quickplot_surface
#
echo "Program output written to quickplot_surface_output.txt"

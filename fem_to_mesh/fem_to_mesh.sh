#!/bin/bash
#
gfortran -c fem_to_mesh.f90 >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling fem_to_mesh.f90"
  exit
fi
rm compiler.txt
#
gfortran fem_to_mesh.o
if [ $? -ne 0 ]; then
  echo "Errors linking and loading fem_to_mesh.o"
  exit
fi
#
rm fem_to_mesh.o
#
chmod ugo+x a.out
mv a.out ~/bin/$ARCH/fem_to_mesh
#
echo "Program installed as ~/bin/$ARCH/fem_to_mesh"

#!/bin/sh
home_path=`pwd`
SH=$(command -v sh);
$SH $home_path/gerar-jar-file.sh
$SH $home_path/gerar-getstat.sh
$SH $home_path/gerar-loadsys.sh

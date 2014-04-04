#!/bin/sh
mainClass="br.com.rubens.ifsp.ic.dinamica.MemoryAnalizer"
homePath=`pwd`
cd $homePath/MemoryAnalizer/bin/
touch Manifest.txt
echo "Main-Class: $mainClass" > Manifest.txt
jar -cfm $homePath/bin/MemoryAnalizer.jar Manifest.txt br/
cd $homePath

#!/bin/bash 
#Genel sorgu fonsiyonu 
genelSorgu(){

    result =$(dpkg -l | wc -l )
    echo "Sistemde yüklü paket sayısı $result"

}

#if package is installed or not

paketSorgulama(){

isPackageInstalled= $(dpkg -s $1 2>&1)
isInstalled=$(echo $isPackageInstalled | grep "is not installed")
#if-else packet condition
dependsCount=$(apt-cache depends $1 | grep "Depends:" | wc -l)
echo "depends :$dependsCount"

#----
#----
}





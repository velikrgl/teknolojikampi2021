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
if [ ${#isInstalled} -eq 0 ]
echo "Paket sistemde var"
else
echo "Paket sistemde yok "
#cut ile ':' sembolüne kadar olan kısmıları kesip 2. kısmı alıyorum
depends_packages =$(apt-cache depends $1 | grep "Depends:" | cut -d ":" -f 2)




dependsCount=$(apt-cache depends $1 | grep "Depends:" | wc -l)
echo "depends sayısı :$dependsCount"

#----
#----
}





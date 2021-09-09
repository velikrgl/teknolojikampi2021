#!/bin/bash 
#Genel sorgu fonsiyonu 
genelSorgu(){

    result =$(dpkg -l | wc -l )
    echo "Sistemde yüklü paket sayısı $result"

}

paketSorgulama(){

installedDepends=() 
NotInstalledDepends=()
isPackageInstalled= $(dpkg -s $1 2>&1)
isInstalled=$(echo $isPackageInstalled | grep "is not installed")

#if-else packet condition
if [ ${#isInstalled} -eq 0 ]
    echo "Paket sistemde var"
else
        echo "Paket sistemde yok "
        #cut ile ':' sembolüne kadar olan kısmıları kesip 2. kısmı alıyorum
        depends_packages =$(apt-cache depends $1 | grep "Depends:" | cut -d ":" -f 2)
        #bağımlılıkların sayısı
        dependsCount=$(apt-cache depends $1 | grep "Depends:" | wc -l)
        echo "depends sayısı :$dependsCount"

        for word in $depends_packages
        do 

        ListofDepends+=($word)  
        packageControl=$(dpkg -s $word 2>&1)
        isInstalledFlag=$(echo $packageControl | grep "is not installed")

        if [${#isInstalledFlag} -eq 0]
        installedDepends+=($word) #kurulu olan bağımlılıklar ,bu arrayin sayısı yüklü olan bağımlıların sayısıdır

        else
        NotInstalledDepends+=($word) #kurulu olmayan bağımlılıklar,bu array ise yüklü olmayan bağımlıları tutar
        fi

        done
 echo "Bağımlılıklar:"
        for (( i = 0 ; i < ${#ListofDepends[@]} ; i++ )); do               
            echo ${ListofDepends[i]}                                       
        done 
       
        echo "Sistemde yüklü olan bağımlılıklar:"
        for (( i = 0 ; i < ${#installedDepends[@]} ; i++ )); do               
            echo ${installedDepends[i]}                                       
        done
        
        echo "Sistemde yüklü olmayan ve indirilecek olan bağımlılıklar:"
        for (( i = 0 ; i < ${#NotInstalledDepends[@]} ; i++ )); do               
            echo ${NotInstalledDepends[i]}                                       
        done

        echo "Yüklenecek bağımlılıkların sayısı:${#NotInstalledDepends[@]}"
    fi









}





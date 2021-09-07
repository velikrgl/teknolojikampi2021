#!/bin/bash 
#Genel sorgu fonsiyonu 
genelSorgu(){

    result = $(dpkg -l | wc -l )
    echo "Sistemde yüklü paket sayısı $result"

}
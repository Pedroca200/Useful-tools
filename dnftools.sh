#!/bin/bash


echo "Atualizando os programas existentes..."
sudo dnf update -y #de inicio ele vai  atulaizar o sistema

clear

basic_programs = ("git" "wget" "curl" "fastfetch")


for basic_programs in "${basic_program[@]}";do
    if ! dnf list intalled "$basic_programs" & /dev/null; then
        echo "Instalando $basic_programs"
        sudo dnf install -y "$basic_programs"
    
    else
        echo "$basic_progrmas já existe"
    fi
done

# Programs uteis que caho na minha opnião
flatpk = ("VSCodium" "Brave" "VlC")

## O VSCodium ele é uma versão sem telemetria do VScode original, mas se decidir de se vai ou não instalar 

## O brave é ta ai para ser como um navegador secundário 

## O VLC ta ai para quem quiser 

## Vai verificar se o flathub esta instalado 
if flatpak remote-list | grep -q "flathub"; then
    echo "Flathub está instalado."

else
    echo "Instale o Flathub."
    exit 1  
fi

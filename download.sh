#!/bin/bash

    echo "Sistema Bibliotech iniciando..."
java -version >/dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Cliente possui Java instalado. Verificando versão..."
    version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo "Versão do Java instalada: $version"
else
    echo "Cliente não possui Java instalado. Instalando Java 17..."
    sudo apt update  # Atualizar repositórios (apenas para sistemas baseados em Debian)
    sudo apt install -y openjdk-17-jdk  # Instalar o JDK do Java 17 (ajuste para sua distribuição)

    if [ $? -eq 0 ]; then
        echo "Java 17 instalado com sucesso!"
        version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
        echo "Versão do Java instalada: $version"
    else
        echo "Falha ao instalar o Java 17. Verifique se os repositórios estão configurados corretamente."
        exit 1
    fi
fi

echo "Baixando e executando a aplicação Java..."

wget -O app.jar https://github.com/Grupo-5-2ADS-C/Bibliotech-app/raw/main/app.jar


if [ $? -eq 0 ]; then
    echo "Arquivo JAR baixado com sucesso!"
    java -jar app.jar
else
    echo "Falha ao baixar o arquivo JAR. Verifique o URL do repositório."
    exit 1
fi


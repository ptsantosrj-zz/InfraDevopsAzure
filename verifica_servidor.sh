#!/bin/bash
#adicionar script ao cron: */1 * * * * bash /scripts/verifica_servidor.sh
#Salvar na pasta script
codigo_http=$(curl --write-out %{http_code} --silent --output /dev/null www.site.com.br)

if [ $codigo_http -ne 200 ]; then

    echo "Houve um problema com o servidor, tentando reiniciá-lo  $(date +%F\ %T)" >> /logs/servidor.log

    systemctl restart httpd

fi

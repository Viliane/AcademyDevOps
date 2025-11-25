#!/bin/bash
# Espera o SQL Server inicializar
sleep 20

SA_PASSWORD="${SA_PASSWORD:-}"
if [ -z "$SA_PASSWORD" ]; then
	echo "ERROR: SA_PASSWORD is not set. Set SA_PASSWORD as an environment variable."
	exit 1
fi

# Executa o script SQL para criar DB e importar dados
/opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P "$SA_PASSWORD" \
    -d master -i /usr/work/criar-banco-dados.sql -C
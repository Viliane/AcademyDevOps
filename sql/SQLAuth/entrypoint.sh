#!/bin/bash
set -e

# Executa o script de importação em background
/usr/work/import-data.sh &

# Inicia o SQL Server em foreground (mantém o container ativo)
exec /opt/mssql/bin/sqlservr

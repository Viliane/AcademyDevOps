# Imagem base: Microsoft SQL Server 2019 no RHEL 8 com CU1
# Isso fornece os binários do SQL Server e o ambiente de tempo de execução.
FROM mcr.microsoft.com/mssql/server:2022-latest

# Variáveis de ambiente obrigatórias
ENV ACCEPT_EULA="Y"
ENV SA_PASSWORD="MeuDB@123"

# Copia os scripts para dentro do container
COPY ./SQLAuth/entrypoint.sh /usr/work/entrypoint.sh
COPY ./SQLAuth/import-data.sh /usr/work/import-data.sh
COPY ./SQLAuth/criar-banco-dados.sql /usr/work/criar-banco-dados.sql

# Dá permissão de execução
USER root
RUN chmod +x /usr/work/entrypoint.sh /usr/work/import-data.sh
USER mssql

# Define o entrypoint
ENTRYPOINT ["/usr/work/entrypoint.sh"]
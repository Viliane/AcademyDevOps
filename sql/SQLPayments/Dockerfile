# Isso fornece os binários do SQL Server e o ambiente de tempo de execução.
FROM mcr.microsoft.com/mssql/server:2022-latest

# Variáveis de ambiente obrigatórias
ENV ACCEPT_EULA="Y"
ENV SA_PASSWORD="MeuDB@123"

# Copia os scripts para dentro do container
COPY ./SQLPayments/entrypoint.sh /usr/work/entrypoint.sh
COPY ./SQLPayments/import-data.sh /usr/work/import-data.sh
COPY ./SQLPayments/criar-banco-dados-pagamentos.sql /usr/work/criar-banco-dados-pagamentos.sql

# Dá permissão de execução
USER root
RUN chmod +x /usr/work/entrypoint.sh /usr/work/import-data.sh
USER mssql

# Define o entrypoint
ENTRYPOINT ["/usr/work/entrypoint.sh"]
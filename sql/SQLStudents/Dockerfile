# Isso fornece os binários do SQL Server e o ambiente de tempo de execução.
FROM mcr.microsoft.com/mssql/server:2022-latest

# Variáveis de ambiente obrigatórias
ENV ACCEPT_EULA="Y"
ENV SA_PASSWORD="MeuDB@123"

# Copia os scripts para dentro do container
COPY ./SQLStudents/entrypoint.sh /usr/work/entrypoint.sh
COPY ./SQLStudents/import-data.sh /usr/work/import-data.sh
COPY ./SQLStudents/criar-banco-dados-estudantes.sql /usr/work/criar-banco-dados-estudantes.sql

# Dá permissão de execução
USER root
RUN chmod +x /usr/work/entrypoint.sh /usr/work/import-data.sh
USER mssql

# Define o entrypoint
ENTRYPOINT ["/usr/work/entrypoint.sh"]
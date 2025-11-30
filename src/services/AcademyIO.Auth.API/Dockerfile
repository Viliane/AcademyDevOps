# --------------------------
# 1. Base runtime
# --------------------------
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

# Força a aplicação a ouvir na porta 5077
ENV ASPNETCORE_URLS=http://+:5077
EXPOSE 5077

# --------------------------
# 2. Build
# --------------------------
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["./services/AcademyIO.Auth.API/AcademyIO.Auth.API.csproj", "services/AcademyIO.Auth.API/"]
COPY ["./building-blocks/AcademyIO.Core/AcademyIO.Core.csproj", "building-blocks/AcademyIO.Core/"]
COPY ["./building-blocks/AcademyIO.WebAPI.Core/AcademyIO.WebAPI.Core.csproj", "building-blocks/AcademyIO.WebAPI.Core/"]
COPY ["./building-blocks/AcademyIO.MessageBus/AcademyIO.MessageBus.csproj", "building-blocks/AcademyIO.MessageBus/"]

# Restaura depend�ncias
RUN dotnet restore "services/AcademyIO.Auth.API/AcademyIO.Auth.API.csproj"
COPY . .
WORKDIR "services/AcademyIO.Auth.API"
RUN dotnet build "AcademyIO.Auth.API.csproj" -c Release -o /app/build

# --------------------------
# 3. Publish
# --------------------------
FROM build AS publish
RUN dotnet publish "AcademyIO.Auth.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

# --------------------------
# 4. Final
# --------------------------
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AcademyIO.Auth.API.dll"]

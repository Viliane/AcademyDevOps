# --------------------------
# 1. Base runtime
# --------------------------
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# --------------------------
# 2. Build
# --------------------------
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["./services/AcademyIO.Payments.API/AcademyIO.Payments.API.csproj", "services/AcademyIO.Payments.API/"]
COPY ["./building-blocks/AcademyIO.Core/AcademyIO.Core.csproj", "building-blocks/AcademyIO.Core/"]
COPY ["./building-blocks/AcademyIO.WebAPI.Core/AcademyIO.WebAPI.Core.csproj", "building-blocks/AcademyIO.WebAPI.Core/"]

# Restaura dependências
RUN dotnet restore "services/AcademyIO.Payments.API/AcademyIO.Payments.API.csproj"
COPY . .
WORKDIR "services/AcademyIO.Payments.API"
RUN dotnet build "AcademyIO.Payments.API.csproj" -c Release -o /app/build

# --------------------------
# 3. Publish
# --------------------------
FROM build AS publish
RUN dotnet publish "AcademyIO.Payments.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

# --------------------------
# 4. Final
# --------------------------
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AcademyIO.Payments.API.dll"]

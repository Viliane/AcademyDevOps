[![Build Project](https://github.com/Viliane/AcademyDevOps/actions/workflows/build.yml/badge.svg)](https://github.com/Viliane/AcademyDevOps/actions/workflows/build.yml)

## 🏦 AcademyIO – Plataforma de Educação Online

Bem-vindo ao **AcademyDevOps**, um projeto desenvolvido no **MBA DevXpert Full Stack .NET** (Módulo 5) com foco em arquitetura moderna, escalabilidade e boas práticas de desenvolvimento.  
O AcademyDevOps é uma plataforma de ensino digital que permite aos usuários gerenciar cursos, matrículas, pagamentos e certificados por meio de uma **API RESTful robusta, segura e bem documentada**.

---

### 🚀 Sobre o Projeto

Construído com uma abordagem baseada em microsserviços e princípios de **Domain-Driven Design (DDD)**, o AcademyDevOps oferece uma experiência integrada e segura para alunos e administradores, com funcionalidades como:

- 📚 **Cadastro e gestão de cursos**
- 💳 **Processamento de pagamentos e faturamento**
- 🔒 **Autenticação e autorização seguras com JWT e ASP.NET Core Identity**
- 👥 **Registro, listagem e busca de alunos por curso**
- 📄 **Emissão e acompanhamento de certificados**

---

### 👥 Equipe de Desenvolvimento

- Viliane Oliveira

---

### 🛠️ Tecnologias Utilizadas

**Back-End:**

- C# 12
- ASP.NET Core Web API (.NET 8.0)
- Entity Framework Core 8.0.10
- SQL Server / SQLite
- ASP.NET Core Identity + JWT
- RabbitMQ (comunicação assíncrona via message bus)
- GitActions
- Docker
- Kubertenes

**Documentação:**

- Swagger/OpenAPI – disponível em `http://localhost:5005/swagge`

### 📂 Estrutura do Projeto

```
academyio/
├── 📁 src/
│   ├── 📁 ApiGateways/
│   │   └── 📁 AcademyIO.Bff/              # 🌉 API Gateway (Backend for Frontend)
│   │
│   ├── 📁 BuildingBlocks/                 # 🧱 Blocos reutilizáveis
│   │   ├── 📁 Core/
│   │   │   └── 📁 AcademyIO.Core/         # 📐 Entidades base, interfaces, validações
│   │   ├── 📁 MessageBus/
│   │   │   └── 📁 AcademyIO.MessageBus/   # 📨 Comunicação assíncrona (RabbitMQ)
│   │   └── 📁 Services/
│   │       └── 📁 AcademyIO.WebAPI.Core/  # ⚙️ Middlewares, Identity, extensões comuns
│   │
│   ├── 📁 Services/                        # 🧩 Microsserviços independentes
│   │   ├── 📁 Auth/
│   │   │   └── 📁 AcademyIO.Auth.API/     # 🔐 Autenticação e autorização (JWT + Identity)
│   │   ├── 📁 Courses/
│   │   │   └── 📁 AcademyIO.Courses.API/  # 📚 Gestão de cursos
│   │   ├── 📁 Payments/
│   │   │   └── 📁 AcademyIO.Payments.API/ # 💳 Processamento de pagamentos
│   │   └── 📁 Students/
│   │       └── 📁 AcademyIO.Students.API/ # 👥 Gestão de alunos e matrículas
│
├── 📄 README.md                            # 📖 Documentação principal
├── 📄 FEEDBACK.md                          # 💬 Feedback do instrutor
└── 📄 .gitignore                           # 🚫 Arquivos ignorados pelo Git

```
 
 📄 FEEDBACK.md    💬 Feedback do instrutor
## ▶️ Como Executar o Projeto

### 📌 Pré-requisitos

- [.NET SDK 8.0 ou superior](https://dotnet.microsoft.com/download/dotnet/8.0)
- [SQL Server ou SQLite](https://www.sqlite.org/index.html)
- [Git](https://git-scm.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (com WSL2 habilitado, se estiver no Windows) — necessário para o RabbitMQ e Portainer
### 💻 Passos para Execução

#### 1️⃣ Clone o Repositório

```
git clone https://github.com/Viliane/AcademyDevOps.git
```

#### 2️⃣ Configure o Banco de Dados

- Acesse os arquivos `appsettings.json` dos microsserviços (`Auth`, `Courses`, `Payments`, `Students`) e do `BFF`.
- Defina a string de conexão para **SQL Server**, conforme sua preferência.
- Ao executar o projeto pela primeira vez, o **Entity Framework Core** aplicará as migrações e executará o **Seed** automaticamente.
#### 3️⃣ Suba os Serviços de Mensageria (RabbitMQ)

```
docker run -d --hostname rabbit-host --name rabbit-academyio -p 15672:15672 -p 5672:5672 rabbitmq:management
```

- Painel Web: [http://localhost:15672](http://localhost:15672/)
	- Usuário: `guest`
	- Senha: `guest`
_(Opcional)_ Se quiser gerenciar os containers visualmente.

🔌 Conexão AMQP (aplicação): amqp://guest:guest@localhost:5672/
### 4️⃣ Execute as APIs (.NET 8.0)
O projeto é composto por vários microsserviços e um **BFF (Backend for Frontend)**. Você pode executá-los de duas formas:
```

Ambas as abordagens exigem que:
- O **banco de dados** esteja configurado corretamente (SQL Server).
- O **RabbitMQ** esteja em execução (caso utilize funcionalidades baseadas em mensageria).

## 👥 Credenciais de Acesso

| Perfil         | Nome        | E-mail                 | Senha       |
|----------------|-------------|------------------------|-------------|
| Administrador  | Admin       | admin@academyio.com    | Teste@123   |
| Aluno          | Student1    | aluno1@academyio.com   | Teste@123   |
| Aluno          | Student2    | aluno2@academyio.com   | Teste@123   |

📌 **Considerações Finais** Este projeto faz parte de um curso acadêmico e não aceita contribuições externas. Para dúvidas ou feedbacks, utilize a aba Issues do repositório. O arquivo FEEDBACK.md contém avaliações do instrutor e deve ser modificado apenas por ele.
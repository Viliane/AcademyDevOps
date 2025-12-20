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

#### 2️⃣ Configuração de GitHub Actions Runner no Windows

- Acesse o repositório no GitHub.
- Vá em Settings > Actions > Runners.
- Clique em New self-hosted runner.
- Escolha o sistema operacional Windows.
- Copie os comandos fornecidos pelo GitHub (eles variam conforme o repositório).
- Após configuração verificar onde o arquivo run.cmd foi salvo e executar para que o self-hosted local seja iniciado

#### 3️⃣ 🚀 Executando Minikube no Windows

Este guia mostra como parar, excluir e reiniciar o **Minikube** em sua máquina local.

---

## 📌 Pré-requisitos
- [Minikube](https://minikube.sigs.k8s.io/docs/start/) instalado
- [kubectl](https://kubernetes.io/docs/tasks/tools/) configurado
- Virtualização habilitada (Hyper-V, Docker ou outro driver compatível)

---

## ⚙️ Comandos básicos
Se você quiser reiniciar o ambiente do zero, execute os comandos na seguinte ordem:
```powershell
minikube stop
minikube delete
minikube start

-Abrir o Docker Desktop para verificar o minikube rodando 

### 4️⃣ Execute as APIs (.NET 8.0)
O projeto é composto por vários microsserviços e um **BFF (Backend for Frontend)**. Você pode executá-los:
- Verificar os pods rodando com o comando kubectl get pods

# usar o pod retornado (exemplo:)
# kubectl port-forward pod/identidade-deployment-6d4d45595b-2hxd8 5077:5077

- Expor localmente com port-forward (acesso via localhost:5077):
kubectl port-forward pod/<nome pod> <porta>:<porta>
# agora acesse: http://localhost:5077/ (endpoint da API)

-- BBF        -> http://localhost:5018/swagger/index.html
-- Identidade -> http://localhost:5077/swagger/index.html
-- Curso      -> http://localhost:5078/swagger/index.html
-- Estudante  -> http://localhost:5275/swagger/index.html
-- Pagamento  -> http://localhost:5272/swagger/index.html

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

- Painel Web: [http://localhost:15672](http://localhost:15672/)
	- Usuário: `guest`
	- Senha: `guest`
_(Opcional)_ Se quiser gerenciar os containers visualmente.

📌 **Considerações Finais** Este projeto faz parte de um curso acadêmico e não aceita contribuições externas. Para dúvidas ou feedbacks, utilize a aba Issues do repositório. O arquivo FEEDBACK.md contém avaliações do instrutor e deve ser modificado apenas por ele.
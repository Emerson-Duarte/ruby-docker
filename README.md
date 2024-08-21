# Projeto Ruby on Rails com Docker

Este é um projeto básico de Ruby on Rails configurado para rodar em um ambiente Docker. O projeto inclui uma aplicação Rails conectada a um banco de dados PostgreSQL e um serviço Redis, facilitando a configuração e execução do ambiente em qualquer máquina.

## Requisitos

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Configuração do Projeto

### 1. Clonar o Repositório

Primeiro, clone o repositório para o seu ambiente local:

```bash
git clone https://github.com/seu-usuario/seu-projeto.git
cd seu-projeto
```

### 2. Configurar as Variáveis de Ambiente

Crie um arquivo .env baseado no .env.example e ajuste as variáveis de ambiente conforme necessário:

```
cp .env.example .env
```

Certifique-se de que as variáveis no .env estão configuradas corretamente, lembrando de trocar por valores referentes a sua máquina:
```
DATABASE_NAME: ${DATABASE_NAME}
DATABASE_USERNAME: ${DATABASE_USERNAME}
DATABASE_PASSWORD: ${DATABASE_PASSWORD}
REDIS_URL=redis://redis:6379/1
POSTGRES_USER: ${POSTGRES_USER}
POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
```

### 3. Construir e Iniciar os Containers

Com tudo configurado, construa a imagem Docker e inicie os containers:
```
docker-compose up --build
```

Isso irá:

- Baixar as imagens necessárias.
- Construir a imagem para a aplicação Rails.
- Iniciar os serviços do PostgreSQL, Redis e o servidor Rails.

### 4. Configurar o Banco de Dados

Após os containers estarem rodando, você precisará configurar o banco de dados. Execute as migrações do banco de dados com o seguinte comando:
```
docker-compose run web rails db:create db:migrate
```

### 5. Acessar a Aplicação

Uma vez que tudo estiver configurado, você pode acessar a aplicação Rails no seu navegador:
`http://localhost:3000`

### Comandos Úteis

#### Parar a Aplicação

Para parar a aplicação e remover os containers, use:
```
docker-compose down
```

Entrar no Console Rails
Se você precisar acessar o console do Rails para depuração, pode usar:
```
docker-compose run web rails console
```

#### Rodar Testes
Para rodar a suíte de testes do Rails, você pode executar:
```
docker-compose run web rails test
```

#### Verificar Logs
Você pode verificar os logs de qualquer serviço Docker usando:
```
docker-compose logs <nome-do-serviço>
```

#### Estrutura do Projeto
Aqui está uma visão geral dos arquivos e diretórios mais importantes neste projeto:

- Dockerfile: Contém as instruções para construir a imagem Docker da aplicação Rails.
- docker-compose.yml: Define e configura os serviços (web, db, redis) usados no projeto.
- Gemfile: Lista as dependências de gems do projeto.
- Gemfile.lock: Registra as versões exatas das gems instaladas.
- config/database.yml: Configura as conexões com o banco de dados.
- .env.example: Exemplo de arquivo de configuração de variáveis de ambiente.







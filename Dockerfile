# Use uma imagem base oficial do Ruby
FROM ruby:3.2

# Instale dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Configura o diretório de trabalho dentro do container
WORKDIR /myapp

# Copia o Gemfile e o Gemfile.lock para o container
COPY Gemfile Gemfile.lock ./

# Instala as gems
RUN bundle install --path vendor/bundle

# Copia o restante do código da aplicação
COPY . .

# Expõe a porta 3000 para o servidor Rails
EXPOSE 3000

# Comando padrão para iniciar o servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]

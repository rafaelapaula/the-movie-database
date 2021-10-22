# Criação de um novo projeto de uma aplicação iOS/tvOS

Esse projeto vai utilizar a API do The Movie Database. Para saber mais, clique [aqui](https://developers.themoviedb.org/3/getting-started/introduction).

## O que é necessário ter no mac antes de iniciar a criação do projeto?

- [Homebrew](https://brew.sh/): Gerenciador de dependencias do mac.
- [Mint](https://github.com/yonaskolb/Mint): Gerenciador de dependencias auxiliar ao homebrew que possibilita adicionar versões locais das dependencias para diferentes projetos.
- [XCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12): IDE para desenvolvimento das aplicações Apple.
- [rbenv](https://github.com/rbenv/rbenv): Sugestão para gerenciamento da versão ruby.

## Iniciando o projeto (passo a passo)

- Criar o `.gitignore`. É posivel pegar a base do arquivo no site [gitignore.io](https://www.toptal.com/developers/gitignore). Além disso, é necessário adicionar os arquivos `.xcworkspace` e `.xcodeproj`. Como vamos utilizar o `Xcodegem`, não será necessário versionar esses arquivos.
- Setar o [bundle](https://bundler.io/man/bundle-config.1.html) path na pasta base do projeto. O bundler fornece um ambiente consistente para projetos Ruby rastreando e instalando as gems (libs) e versões exatas que são necessárias.
````
bundle config set --local path 'vendor' 

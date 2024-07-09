

# RobotFramework API Testing SERVEREST 🧪

Este repositório contém testes automatizados para a API ServerRest, desenvolvidos usando RobotFramework. A API ServerRest está disponível no [site oficial](https://serverest.dev/) e o repositório no GitHub pode ser encontrado [aqui](https://github.com/ServeRest/ServeRest). Os testes foram divididos em quatro cenários principais.

## Índice 📚

- [Introdução](#introdução)
- [Pré-requisitos](#pré-requisitos)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Como Executar os Testes](#como-executar-os-testes)
- [Contribuição](#contribuição)

## Introdução 🌟

Este projeto foi criado para demonstrar habilidades em automação de testes de API usando RobotFramework. A API ServerRest foi utilizada como base para os testes, os quais foram divididos nos seguintes cenários:

- **Cenário 01**: Cadastrar Novo Usuário
- **Cenário 02**: Cadastrar um usuário já existente
- **Cenário 03**: Consultar os dados de um usuário
- **Cenário 04**: Logar com o novo usuário criado

## Pré-requisitos ✅

Antes de começar, você vai precisar ter o seguinte instalado em sua máquina:

- Python 3.x
- RobotFramework
- RequestsLibrary para RobotFramework


## Estrutura do Projeto 📁

```plaintext
robotframework-api-testing/
├──Testes/
│   ├── api_testing_usuarios.robot
├── resources/
│   ├── keywordapi_testing_resources.robots
├── results/
│   ├── log.html
│   ├── report.html
│   ├── output.xml
├── README.md
├── 
```

- **Testes/**: Contém os arquivos de teste para cada cenário.
- **resources/**: Contém os recursos reutilizáveis como keywords e variáveis.
- **results/**: Contém os relatórios gerados após a execução dos testes.

## Como Executar os Testes ▶️

Para executar todos os testes, use o seguinte comando no diretório raiz do projeto:

```sh
robot -d /results Testes/
```

Os relatórios e logs de execução dos testes serão gerados na pasta `results/`.

## Contribuição 🤝

Contribuições são bem-vindas! Por favor, abra um problema ou envie um pull request para discutir mudanças que você gostaria de fazer.


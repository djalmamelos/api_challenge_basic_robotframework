*** Settings ***
Documentation    API SERVEREST
Resource        ../Resources/api_testing_resources.robot



*** Test Cases ***

Cenário 01 : Cadastrar Novo Usuário com Sucesso na SERVERST
    Criar um Usuário Novo
    Cadastrar o Usuário criado na SERVERST    email=${Email_Test}    status_code_desejado=201
    Conferir se o Usuário foi cadastrado com Sucesso!

Cenário 02 : Cadastrar um usuário já existente
    Criar um Usuário Novo
    Cadastrar o Usuário criado na SERVERST    email=${Email_Test}    status_code_desejado=201
    Vou repetir o cadastro do usuário     
    Vou verificar se a API não permitiu o cadastro ser criado

Cenário 03 : Consultar os dados de um usuário cadastrado
    Criar um Usuário Novo
    Cadastrar o Usuário criado na SERVERST    email=${Email_Test}    status_code_desejado=201
    Consultar os dados do novo usuário
    Conferir os dados retornados

Cenário 04: Logar com o novo usuário criado
    Criar um usuário novo
    Cadastrar o Usuário criado na SERVERST   email=${Email_Test}  status_code_desejado=201
    Realizar Login com o usuário
    Conferir se o Login ocorreu com sucesso



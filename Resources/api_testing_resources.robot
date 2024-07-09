*** Settings ***
Library     RequestsLibrary
Library     String
Library    Collections


*** Keywords ***
Criar um Usuário Novo
    ${Palavra_Aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${Palavra_Aleatoria}    Convert To Lower Case    ${Palavra_Aleatoria}
    Log    Minha palavra aleatoria ${Palavra_Aleatoria}@emailteste.com
    Set Test Variable    ${Email_Test}    ${Palavra_Aleatoria}@emailteste.com
    Log    ${Email_Test}  

Cadastrar o Usuário criado na SERVERST
    [Arguments]    ${email}     ${status_code_desejado}
    ${body}    Create Dictionary
    ...    nome=Fulano da Silva
    ...    email=${email}
    ...    password=1234
    ...    administrador=true
    
    Log    ${body}
    Criar Sessão na SERVERST

    ${resposta}    POST On Session  
    ...            alias=SERVERST
    ...            url=/usuarios
    ...            json=${body}
    ...            expected_status=${status_code_desejado}
    log    ${resposta.json()}
    IF    ${resposta.status_code} == 201
         Set Test Variable    ${ID_USUARIO}    ${resposta.json()["_id"]}
    END
    Set Test Variable    ${Resposta1}    ${resposta.json()}

Criar Sessão na SERVERST
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json    
    Create Session    alias=SERVERST    url=https://serverest.dev   headers=${headers}

Conferir se o Usuário foi cadastrado com Sucesso!
    Log    ${Resposta1}
    Dictionary Should Contain Item    ${Resposta1}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${Resposta1}    _id

Vou repetir o cadastro do usuário
    Cadastrar o Usuário criado na SERVERST      email=${Email_Test}    status_code_desejado=400   

Vou verificar se a API não permitiu o cadastro ser criado
    Dictionary Should Contain Item    ${Resposta1}    message    Este email já está sendo usado

Consultar os dados do novo usuário
    ${resposta_consulta}    GET On Session    alias=SERVERST    url=/usuarios/${ID_USUARIO}    expected_status=200
    
    Log    ${resposta_consulta.status_code}
    Log    ${resposta_consulta.reason}
    Log    ${resposta_consulta.headers}
    Log    ${resposta_consulta.elapsed}
    Log    ${resposta_consulta.text}
    Log    ${resposta_consulta.json()}
    Set Test Variable    ${resp_cons}    ${resposta_consulta.json()}

 Conferir os dados retornados
     Log    ${resp_cons}
     Dictionary Should Contain Item    ${resp_cons}    nome              Fulano da Silva
     Dictionary Should Contain Item    ${resp_cons}    email             ${Email_Test}
     Dictionary Should Contain Item    ${resp_cons}    password          1234
     Dictionary Should Contain Item    ${resp_cons}    administrador     true
     Dictionary Should Contain Item    ${resp_cons}    _id               ${ID_USUARIO}



Realizar Login com o usuário
    ${body}    Create Dictionary    email=${Email_Test}
    ...    password=1234
        
    ${login_certo}    POST On Session    alias=SERVERST    url=/login    json=${body}
    Log    ${login_certo.json()}
     Set Test Variable    ${Login_Certo}    ${login_certo.json()}
Conferir se o Login ocorreu com sucesso
    Dictionary Should Contain Item    ${Login_Certo}    message    Login realizado com sucesso
    

    
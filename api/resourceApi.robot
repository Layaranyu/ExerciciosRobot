***Settings***
Library         RequestsLibrary
Library         SeleniumLibrary        
Library         Collections
Library         String

***Variables***
${URL_API}      https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_15}      id=${15}
...             title=Book 15
...             pageCount=${1500}
&{BOOK_POST}    id=${222}
...             title=Teste
...             pageCount=${1200}

&{ACTIVITIES_POST}          id=${201}
...                        title=Activities 201
...                        completed=False
***Keywords***
Conectar a minha API
    Create Session   Fakeapi   ${URL_API}

Requisitar todos os livros  
    ${RESPOSTA}  Get On Session  Fakeapi  Books
    Log  ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}  Get On Session  Fakeapi  Books/${ID_LIVRO}
    Log  ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Conferir o status code 
    [Arguments]        ${STATUS_DESEJADO}
    Should Be Equal As Strings   ${RESPOSTA.status_code}   ${STATUS_DESEJADO}
  
Conferir o reason  
    [Arguments]        ${REASON_DESEJADO}
    Should Be Equal As Strings      ${RESPOSTA.reason}      ${REASON_DESEJADO}

Conferir se retorna uma lista de "${QTDE_LIVROS}" livros
    Length Should Be   ${RESPOSTA.json()}     ${QTDE_LIVROS}    
    
Conferir se retorna todos os dados corretos do livro 15
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id   ${BOOK_15.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title   ${BOOK_15.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}   pageCount   ${BOOK_15.pageCount}
    Should Not Be Empty   ${RESPOSTA.json()["description"]}

Cadastrar um novo livro
    ${HEADER}   Create Dictionary    content-type=application/json
    ${RESPOSTA}  POST On Session  Fakeapi  Books
    ...                             data={"id": 222,"title": "Teste","description": "Teste","pageCount": 1200,"excerpt": "teste","publishDate": "2022-12-15T17:36:35.039Z"}
    ...                             headers=${HEADER}   
    Log  ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Conferir se retorna todos os dados corretos do livro 
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id   ${BOOK_POST.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title   ${BOOK_POST.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount   ${BOOK_POST.pageCount}

Alterar um livro (put)
    ${PUT}   Create Dictionary    content-type=application/json
    ${RESPOSTA}  PUT On Session   Fakeapi  Books/${200}
    ...                             data={"id": 200,"title": "Teste2","description": "Teste2","pageCount": 1200,"excerpt": "teste2","publishDate": "2022-12-15T17:36:35.039Z"}
    ...                             headers=${PUT}   
    Log  ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Deletar um livro "5"
    ${RESPOSTA}  DELETE On Session    Fakeapi  Books/${5}
    Log  ${RESPOSTA}
    Set Test Variable   ${RESPOSTA}
    Should Be Empty    ${RESPOSTA.text}

### Activities
Requisitar todos os Activities
    ${RESPOSTA_1}    GET On Session        Fakeapi       Activities
    Log  ${RESPOSTA_1.text}
    Set Test Variable   ${RESPOSTA_1}
Requisitar o Activities numero "${ID_1}"
    ${RESPOSTA_1}    GET On Session        Fakeapi       Activities/${ID_1}
    Log  ${RESPOSTA_1.text}
    Set Test Variable   ${RESPOSTA_1}

Cadastrar nova Activities
    ${HEADER_1}  Create Dictionary     content-type=application/json
    ${RESPOSTA_1}  POST On Session   Fakeapi  Activities
    ...                             data={"id": 201,"title": "Activities 201","completed":false}
    ...                             headers=${HEADER_1}
    Log  ${RESPOSTA_1.text}
    Set Test Variable   ${RESPOSTA_1}

Conferir se retorna a nova Activities
    Dictionary Should Contain Item    ${RESPOSTA_1.json()}    id   ${ACTIVITIES_POST.id}
    Dictionary Should Contain Item    ${RESPOSTA_1.json()}    title   ${ACTIVITIES_POST.title}
    Dictionary Should Contain Item    ${RESPOSTA_1.json()}    completed   ${ACTIVITIES_POST.completed}
    Log  ${ACTIVITIES_POST}

Alterar Activities
    ${PUT_1}   Create Dictionary    content-type=application/json
    ${RESPOSTA_1}  PUT On Session   Fakeapi  Activities/${155}
    ...                             data={"id": 155,"title": "Activities 158","completed":true}
    ...                             headers=${PUT_1}   
    Log  ${RESPOSTA_1.text}
    Set Test Variable   ${RESPOSTA_1}

Deletar Activities 
    ${RESPOSTA_1}  DELETE On Session    Fakeapi  Activities/${24}
    Log  ${RESPOSTA_1}
    Set Test Variable   ${RESPOSTA_1}
    Should Be Empty    ${RESPOSTA_1.text}
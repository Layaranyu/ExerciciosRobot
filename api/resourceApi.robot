***Settings***
Library         RequestsLibrary
Library         SeleniumLibrary        
Library    Collections
Library    String

***Variables***
${URL_API}      https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_15}      id=${15}
...             title=Book 15
...             pageCount=${1500}

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
    
***Settings***
Documentation   Suite para exemplificar o uso de IF nos testes 
Library         SeleniumLibrary

***Variables***
#variable de lista
@{FRUTAS}       Banana  Maçã  Uva  Pera  Morango

***Test Cases***
Caso de teste 1
    Rodando uma keywords dada uma condição = true
    Rodando uma keywords dada uma condição = false
    Armazenando um valor em uma variável dada a uma condição

***Keywords***
Rodando uma keywords dada uma condição = true
    Run Keyword If  '${FRUTAS[0]}'== 'Banana'   Log    O item é Banana!

Rodando uma keywords dada uma condição = false
    Run Keyword If  '${FRUTAS[1]}' =='Uva'     Log   O item não é uma uva!

Armazenando um valor em uma variável dada a uma condição
    ${VAR}   Set Variable If  '${FRUTAS[1]}' == 'Maçã'   Maçã
    log    Minha variável é ${VAR}



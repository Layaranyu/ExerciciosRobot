***Settings***

Documentation   Documentação de API:  https://fakerestapi.azurewebsites.net/index.html
Resource        resourceApi.robot
Suite Setup     Conectar a minha API

***Test Cases***
Buscar a listagem de todos os livros
    Requisitar todos os livros
    Conferir o status code  200
    Conferir o reason      OK
    Conferir se retorna uma lista de "200" livros
Buscar um livro especifico 
    Requisitar o livro "15"
    Conferir se retorna todos os dados corretos do livro 15

Cadastrar um novo livro (post)
    Cadastrar um novo livro
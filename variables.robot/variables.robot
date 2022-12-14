***Settings***
Library        SeleniumLibrary
Library        FakerLibrary
Library        String
Documentation

***Variables***
&{DADOSPESSOAIS}    Nome=Layara   sobrenome=Santos
@{MESES}    Janeiro  Fevereiro  Março  Abril  Maio  Junho  Julho  Agosto  Setembro  Outubro  Novembro Dezembro
&{DIASEMESES}   Janeiro=30  Fevereiro=28  Março=31  Abril=30  Maio=31 Junho=30  Julho=31  Agosto=31 Setembro=30  Outubro=31  Novembro=30  Dezembro=31
${PALAVRAALEATORIA}     
***Test Cases***
qualquer 1s
    qualquer 1s

caso de teste 1
    Criando email aleatorio

***Keywords***
qualquer 1s
    Log  Mes 1: ${MESES[0]} e Mes 3: ${MESES[2]}

    Log To Console   Mês e dias:${DIASEMESES}
    Log  Mês e dias:${DIASEMESES}  

Criando email aleatorio
    palavra aleatoria
    nome + sobrenome + palavra aleatória + @testerobot.com  ${DADOSPESSOAIS.Nome}   ${DADOSPESSOAIS.sobrenome}

palavra aleatoria
    ${PALAVRAALEATORIA}=     Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Set Global Variable  ${PALAVRAALEATORIA}  ${PALAVRAALEATORIA}

nome + sobrenome + palavra aleatória + @testerobot.com  
    [Arguments]     ${NOME}   ${SOBRENOME}
    ${EMAIL}    Catenate    ${NOME}  ${SOBRENOME}  ${PALAVRAALEATORIA}  @testerobot.com
    ${EMAIL}    Remove String  ${EMAIL}  ${SPACE}
    Log  ${EMAIL} 

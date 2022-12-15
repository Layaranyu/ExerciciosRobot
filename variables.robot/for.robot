***Settings***
Documentation   Suite para exemplificar o uso de FOR nos testes
Library         SeleniumLibrary


***Variables***
#variable de lista
@{NUMERO}       1  2  3  4  5  6  7  8  9  10

***Test Cases***
caso de teste 1
    Testando FOR

***Keywords***
Testando FOR
    Log To Console  ${\n}
    FOR     ${NUMERO_ATUAL}  IN  @{NUMERO}
        IF   '${NUMERO_ATUAL}' == '5' 
            Log To Console  meu numero é ${NUMERO_ATUAL} !  
        ELSE IF   '${NUMERO_ATUAL}' == '10'
            Log To Console  meu numero é ${NUMERO_ATUAL} !
        ELSE 
            Log  "Eu não sou o número 5 e nem o 10!"

        END
        
    END

*** Settings ***
Resource  ../Main.robot

*** Variables ***
${URL}                                      http://localhost:3000/
${CAMPO_NOME}                               id:form-nome
${CAMPO_CARGO}                              id:form-cargo
${CAMPO_IMAGEM}                             id:form-imagem
${CAMPO_TIME}                               class:lista-suspensa
${BOTAO_CARD}                               id:form-botao
${MSG_NOME_DEVE_SER_PREENCHIDO}             id:form-nome-erro
${MSG_CARGO_DEVE_SER_PREENCHIDO}            id:form-cargo-erro
${MSG_SELECIONE_UM_TIME_PARA_ESSA_PESSOA}   id:form-times-erro 
@{Seleciona_Times}
...     //option[contains(.,'Programação')]
...     //option[contains(.,'Front-End')]
...     //option[contains(.,'Data Science')]
...     //option[contains(.,'Devops')] 
...     //option[contains(.,'UX e Design')]
...     //option[contains(.,'Mobile')]
...     //option[contains(.,'Inovação e Gestão')]
${BOTAO_CARD}                               id:form-botao
${MSG_NOME_DEVE_SER_PREENCHIDO}             id:form-nome-erro
${MSG_CARGO_DEVE_SER_PREENCHIDO}            id:form-cargo-erro
${MSG_SELECIONE_UM_TIME_PARA_ESSA_PESSOA}   id:form-times-erro 


*** Keywords ***
Given prencho os campos do formulario   
    #varivel 
    ${Nome}   First name          
    #Inserindo informações
    Input Text     ${CAMPO_NOME}              ${Nome}
    #Varivavel 
    ${Cargo}  Job
    Input Text     ${CAMPO_CARGO}             ${Cargo} 

    ${IMG}    Image Url  
    Input Text     ${CAMPO_IMAGEM}            ${IMG}
      
    #Clicando  no combobox    
    Click Element  ${CAMPO_TIME}      
    Click Element  xpath=${Seleciona_Times[0]}

    #Aguardando alguns segundo na tela     
    Sleep    10s    
When clico em criar card     
    #clicando no botão     
    Click Element   ${BOTAO_CARD}    
Then o sistema criar o card na area correta    
   #Validando informação na tela e aguardando 5s     
    Wait Until Element Is Visible    class:colaborador    5s
    Click Element    class:colaborador
Then o sistema criar os tres cards nos time esperado
    FOR    ${i}    IN RANGE              1    3
        Given prencho os campos do formulario
        When clico em criar card 
    END
    Sleep    10s 
Then criar e indentificar card de cada time disponivel 
    FOR    ${time}    IN    @{Seleciona_Times}
        Given prencho os campos do formulario
        Click Element    ${CAMPO_TIME}
        Click Element    xpath=${time}
        When clico em criar card
        Then o sistema criar o card na area correta
    END

    Sleep    10s







Given clico no botão criar card 
    Click Element    ${BOTAO_CARD}
Then o sistema apresenta apresenta as mensagens de campos obrigatoriosa a serem preenchindo
    Element Should Be Visible    ${MSG_CARGO_DEVE_SER_PREENCHIDO}
    Element Should Be Visible    ${MSG_NOME_DEVE_SER_PREENCHIDO}
    Element Should Be Visible    ${MSG_SELECIONE_UM_TIME_PARA_ESSA_PESSOA}
    Sleep    10s    
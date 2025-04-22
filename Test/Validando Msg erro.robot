*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                                      http://localhost:3000/
${BOTAO_CARD}                               id:form-botao
${MSG_NOME_DEVE_SER_PREENCHIDO}             id:form-nome-erro
${MSG_CARGO_DEVE_SER_PREENCHIDO}            id:form-cargo-erro
${MSG_SELECIONE_UM_TIME_PARA_ESSA_PESSOA}   id:form-times-erro    

*** Test Cases ***
Verificar envio de formularios sem os campos esta preenchindo 
    Given que estou no organo
    When clico no botão criar card 
    Then o sistema apresenta apresenta as mensagens de campos obrigatorios


*** Keywords ***
Given que estou no organo
    Open Browser    ${URL}    browser=Chrome
When clico no botão criar card 
    Click Element    ${BOTAO_CARD}
Then o sistema apresenta apresenta as mensagens de campos obrigatorios
    Element Should Be Visible    ${MSG_CARGO_DEVE_SER_PREENCHIDO}
    Element Should Be Visible    ${MSG_NOME_DEVE_SER_PREENCHIDO}
    Element Should Be Visible    ${MSG_SELECIONE_UM_TIME_PARA_ESSA_PESSOA}
    Sleep    10s
    Close Browser
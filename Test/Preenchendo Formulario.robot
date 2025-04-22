*** Settings ***
Library    SeleniumLibrary


#varivel seria como um PageObject do java com selenium so que no mesmo arquivo em vez de preencher o id no codigo direto
#fazemos diretamente nas variaveis com a nomeclartura em CAIXA ALTA e organiza no codigo 
*** Variables ***
${URL}                                      http://localhost:3000/
${CAMPO_NOME}                               id:form-nome
${CAMPO_CARGO}                              id:form-cargo
${CAMPO_IMAGEM}                             id:form-imagem
${OPCAO_PROGRAMACAO}                        //option[contains(.,'Programação')]
${OPCAO_FRONT}                              //option[contains(.,'Front-End')]
${OPCAO_DADOS}                              //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}                             //option[contains(.,'Devops')] 
${OPCAO_UX}                                 //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}                             //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}                           //option[contains(.,'Inovação e Gestão')]
${CAMPO_TIME}                               class:lista-suspensa
${BOTAO_CARD}                               id:form-botao
${MSG_NOME_DEVE_SER_PREENCHIDO}             id:form-nome-erro
${MSG_CARGO_DEVE_SER_PREENCHIDO}            id:form-cargo-erro
${MSG_SELECIONE_UM_TIME_PARA_ESSA_PESSOA}   id:form-times-erro                      

#seção de teste para ser utilizados.
*** Test Cases ***
Verificar se acessar o site o card e criado corretamente na aréa correta.   
    Given que acesso o ORGANO 
    When prencho os campos do formulario            
    And clico em criar card     
    Then o sistema criar o card na area correta    
*** Keywords ***
Given que acesso o ORGANO 
    #Abrir o navegador
    Open Browser  ${URL}  browser=Chrome  
When prencho os campos do formulario            
    #Inserindo informações
    Input Text     ${CAMPO_NOME}              Gustavo Rocha
    Input Text     ${CAMPO_CARGO}             analista de sistema 
    Input Text     ${CAMPO_IMAGEM}            https://picsum.photos/id/1/200/300
      
    #Clicando  no combobox    
    Click Element  ${CAMPO_TIME}      
    Click Element  ${OPCAO_DADOS}
    #Aguardando alguns segundo na tela     
    Sleep    10s    
And clico em criar card     
    #clicando no botão     
    Click Element   ${BOTAO_CARD}    
Then o sistema criar o card na area correta    
   #Validando informação na tela e aguardando 5s 
   Element Should Be Visible   class:colaborador
   Sleep    5s
   Close Browser
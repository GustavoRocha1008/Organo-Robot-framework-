
#biblioteca que podemos utilizar dentro de settings 
*** Settings ***
Library    SeleniumLibrary
#seção de teste para ser utilizados.
*** Test Cases ***

Abrir o navegador e acessar site do organo
#Abrir o navegador
    Open Browser  url=http://localhost:3000/  browser=Chrome    

Preencher formulario 
    Input Text     id:form-nome              Gustavo Rocha
    Input Text     id:form-cargo             analista de sistema 
    Input Text     id:form-imagem            https://picsum.photos/id/1/200/300
    Click Element  class:lista-suspensa      
    Click Element  //option[contains(.,'Programação')]
    Sleep    10s
    Click Element   id=form-botao
    Element Should Be Visible   class:colaborador
    Sleep    5s

#biblioteca que podemos utilizar dentro de settings 
*** Settings ***
Library    SeleniumLibrary


#seção de teste para ser utilizados.
*** Test Cases ***

Abrir o navegador e acessar site do organo
#Abrir o navegador
    Open Browser  url=http://localhost:3000/  browser=Chrome    
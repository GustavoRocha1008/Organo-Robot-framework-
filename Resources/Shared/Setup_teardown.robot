*** Settings ***
Library    SeleniumLibrary
Resource    ../Main.robot

*** Keywords ***
Given que estou no organo
    Open Browser  url=http://localhost:3000/    browser=Chrome

Fechar o navegador 
    Close Browser    

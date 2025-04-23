*** Settings ***
Resource    ../Resources/Main.robot
Library       FakerLibrary
Test Setup       Given que estou no organo
Test Teardown    Fechar o navegador
   
*** Test Cases ***
Verificar envio de formularios sem os campos esta preenchindo 
    Given clico no botão criar card 
    Then o sistema apresenta apresenta as mensagens de campos obrigatoriosa a serem preenchindo
*** Settings ***
Resource         ../Resources/Main.robot
Library          FakerLibrary
Test Setup       Given que estou no organo
Test Teardown    Fechar o navegador  

#seção de teste para ser utilizados.
*** Test Cases ***
Verificar se acessar o site o card e criado corretamente na aréa correta.   
    Given prencho os campos do formulario            
    When clico em criar card     
    Then o sistema criar o card na area correta   

Verificar se os sistema cria os 03 cards necessarios  
    Given prencho os campos do formulario
    When clico em criar card
    Then o sistema criar os tres cards nos time esperado

Verificar se o sistema deixa incluir colaboradores para cada time disponivel 
    Given prencho os campos do formulario
    Then criar e indentificar card de cada time disponivel 
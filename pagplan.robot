*** Settings ***
Library         SeleniumLibrary
Resource        ./pagplan.resource
Test Teardown    Close Browser

*** Test Case ***
Processo de pagamento com cartao invalido
  Abrir o site do Portal Pagplan
  Fazer login
  Efetuar pagamento de conta utilizando um cartão inválido
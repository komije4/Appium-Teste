*** Settings ***
Documentation  Teste webmotors - Abertura do app e listagem de veiculos
Library  AppiumLibrary  run_on_failure=AppiumLibrary.CapturePageScreenshot
Resource  variables.resource
Resource  Keywords.resource

*** Test Cases ***
Validar a listagem de veiculos do aplicativo
  Dado que esteja com o app da webmotors aberto
  Então devo ver a listagem de veiculos
  E validar conteudo de um item da listagem
*** Settings ***
Documentation  Teste webmotors - listagem de veiculos
Library  AppiumLibrary  run_on_failure=AppiumLibrary.CapturePageScreenshot
Resource  variables.resource
Resource  Keywords.resource
Suite Teardown  Fechar o app

*** Test Cases ***
Validar detalhes do veiculo
  Quando clicar no primeiro veiculo da listagem
  Então o detalhe do veiculo deve ser exibido com todas as informações preenchidas

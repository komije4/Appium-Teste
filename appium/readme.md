# Teste Webmotors - Appium + robot
Teste usando Appium + robot + docker + devcontainers    
Foi utilizado devcontainers e o docker para facilitar a configuração e execução.

## dependencias vscode + docker
 * utilizando os devcontainers, deve se abrir o projeto dentro do [devcontainer](https://code.visualstudio.com/docs/remote/containers), com isso vai ser utilizado um container python para o robot + appium e outro container com a imagem do appium server e o emulador de android.

## rodando
```bash
#dentro do devcontainer.
#para instalar as dependencias do python
make
#rodar os testes e tendo o resultado na pasta output.
make clean-test
```

## acompanhando a execução dos testes
 * Acessando http://localhost:6080/ é possivel ver o que está acontecendo no emulador
 * o resultado fica na pasta output (no zip já tem o conteudo de uma execução)
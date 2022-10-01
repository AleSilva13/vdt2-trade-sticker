*** Settings ***
Documentation        Login tests

Resource        ../resources/main.resource

Test Setup        Start Test
Test Teardown     Finish Test

*** Test Cases ***
Deve logar com sucesso
    Go To Login Page
    Submit Credentials          papito@gmail.com    vaibrasil
    User Logged In

Não deve logar com senha incorreta
    Go To Login Page
    Submit Credentials          papito@gmail.com    abc123
    Toast Message Should Be     Credenciais inválidas, tente novamente!

Deve exibir notificação toaster se a senha não for preenchida
    Go To Login Page
    Submit Only Email           papito@gmail.com
    Toast Message Should Be     Por favor, informe a sua senha secreta!

Deve exibir notificação toaster se o e-mail não for preenchido
    Go To Login Page
    Submit Only Password        vaibrasil
    Toast Message Should Be     Por favor, informe o seu email!

Deve exibir notificação toaster se e-mail e senha não forem preenchidos
    Go To Login Page
    Submit Without Email And Password
    Toast Message Should Be     Por favor, informe suas credenciais!
*** Variables ***
${SITE}                     https://portal.pagplan.com.br/home
${NAVEGADOR}                Chrome
${BOTAO_LOGIN}              css=body > app-root > app-home > div > mat-toolbar > mat-toolbar-row > div > button:nth-child(6)
${CAMPO_USUARIO}            name=username
${CAMPO_SENHA}              name=password
${BOTAO_ENTRAR}             css=body > app-root > app-auth-layout > app-signin > div > div.session-form-hold > mat-card > mat-card-content > form > button
${PAGAR_CONTAS}             css=#scroll-area > app-sidenav > div > ul > li:nth-child(2)
${COD_BARRAS}               css=body > app-root > app-user-layout > div > mat-sidenav-container > mat-sidenav-content > div.main-content-wrap > div > app-bills-serach > div.pay-bill-area > div > input
${PESQUSAR}                 css=body > app-root > app-user-layout > div > mat-sidenav-container > mat-sidenav-content > div.main-content-wrap > div > app-bills-serach > div.pay-bill-area > div > button
${BOTAO_CONTINUAR}          css=#mat-dialog-2 > bills-processable-dialog > div.mat-dialog-actions > button:nth-child(2)
${PAGAR}                    css=#mat-tab-content-0-0 > div > div > div > div.payment-area > div > a
${NOME_TITULAR}             css=#mat-input-4
${VALIDADE}                 css=#mat-input-5
${NUMERO_CARTAO}            css=#cardno
${CVV}                      css=#mat-input-7
${SALVAR_CARTAO}            css=#mat-checkbox-1 > label > div
${CARTAO_FAVORITO}          css=#mat-checkbox-2 > label > div
${CPF_CARTAO}               css=#mat-input-8
${PARCELAS}                 css=#mat-select-1 > div > div.mat-select-value > span
${CREDITO_1}                css=#mat-option-4 > span
${CONFIRMA_PAGAMENTO}       css=#mat-tab-content-0-1 > div > div > div.flex-container.ng-tns-c25-13.ng-trigger.ng-trigger-animate.ng-star-inserted > div.footer-info > div.conf-btn > mat-card-actions > button.color-orange.mat-raised-button.mat-button-base
${TERMO}                    css=#mat-radio-1 > label > div.mat-radio-container
${CONFIRMA_TERMO}           css=#mat-dialog-5 > bill-single-dialog > div.float-right.mat-dialog-actions > button.color-orange.mat-raised-button.mat-button-base
${ERRO_PAGAMENTO}           css=#cdk-step-content-0-0 > div > p:nth-child(2) > span
${MSG_ERRO_PAGAMENTO}       Erro ao efetuar transação de crédito - Transacao nao processada. - ERRO NO CARTAO – NAO TENTE NOVAMENTE [ECOM - 82]

*** Keywords ***
Abrir o site do Portal Pagplan
  Open Browser                         ${SITE}        ${NAVEGADOR}
  Maximize Browser Window
  Wait and Click                       ${BOTAO_LOGIN} 

Fazer login
  Wait and Input Text          ${CAMPO_USUARIO}       vmoraeslima@yahoo.com.br          
  Wait and Input Text          ${CAMPO_SENHA}         Bebelly@10
  Wait and Click               ${BOTAO_ENTRAR}

Efetuar pagamento de conta utilizando um cartão inválido
  Wait and Click                       ${PAGAR_CONTAS}
  Wait and Input Text                  ${COD_BARRAS}               836800000025 126900052831 811366110542 136611021116
  Wait and Click                       ${PESQUSAR}
  Wait and Click                       ${BOTAO_CONTINUAR}
  Wait and Click                       ${PAGAR}
  Wait and Input Text                  ${NOME_TITULAR}             VINICIUS M LIMA
  Wait and Input Text                  ${VALIDADE}                 1223
  Wait and Input Text                  ${NUMERO_CARTAO}            5547735182923011
  Wait and Input Text                  ${CVV}                      884
  Wait and Click                       ${SALVAR_CARTAO}
  Wait and Click                       ${CARTAO_FAVORITO}
  Wait and Input Text                  ${CPF_CARTAO}               00446251119
  Wait and Click                       ${PARCELAS}
  Wait and Click                       ${CREDITO_1}                
  Wait and Click                       ${CONFIRMA_PAGAMENTO}
  Wait and Click                       ${TERMO}
  Wait and Click                       ${CONFIRMA_TERMO}
  Wait Until Element is Visible        ${ERRO_PAGAMENTO}           30
  Element Should Contain               ${ERRO_PAGAMENTO}           ${MSG_ERRO_PAGAMENTO}

Wait and Click
  [Arguments]                          ${ELEMENTO}
  Wait Until Element is Visible        ${ELEMENTO}
  Wait Until Element is Enabled        ${ELEMENTO}
  Scroll Element Into View             ${ELEMENTO}
  Click Element                        ${ELEMENTO}

Wait and Input Text
  [Arguments]                          ${CAMPO}  ${TEXTO}
  Wait Until Element is Visible        ${CAMPO}
  Wait Until Element is Enabled        ${CAMPO}
  Scroll Element Into View             ${CAMPO}
  Input Text                           ${CAMPO}  ${TEXTO}
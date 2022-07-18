*** Keywords ***
#atalho para os bdd
Dado ${keyword}
    Run keyword    ${keyword}
Quando ${keyword}
    Run keyword    ${keyword}
Então ${keyword}
    Run keyword    ${keyword}
E ${keyword}
    Run keyword    ${keyword}

que esteja com o app da webmotors aberto
  Open Application  http://android-emu:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  app=${ANDROID_APP} 
  Start Screen Recording
  Capture Page Screenshot  openapp.png

devo ver a listagem de veiculos
    Wait Until Element Is Visible    //*[@class="androidx.recyclerview.widget.RecyclerView" and @package="${APP_PACKAGE}"]    timeout=30
    ${count} =  Get Matching Xpath Count    //*[@class="android.widget.ImageView" and @package="br.com.siatiquosque.webmotorstest" and @resource-id="br.com.siatiquosque.webmotorstest:id/imgCar"]
    Should Be True  ${count} >= 2
    Capture Page Screenshot  listing.png

validar conteudo de um item da listagem
    Wait Until Element Is Visible    //*[@class="android.widget.TextView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/tvValue"]    timeout=30
    #valida se tem preco
    Element Should Contain Text    //*[@class="android.widget.TextView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/tvValue"]    expected=R$
    #valida se tem o nome
    Element Attribute Should Match    //*[@class="android.widget.TextView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/tvCarName"]    attr_name=text    match_pattern=\\w+    regexp=true
    #valida ano
    Element Attribute Should Match    //*[@class="android.widget.TextView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/tvYearKm"]    attr_name=text    match_pattern=20[0-9]{2}    regexp=true
    #valida ano
    Element Should Contain Text    //*[@class="android.widget.TextView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/tvYearKm"]    expected=KM

clicar no primeiro veiculo da listagem
    Tap    //*[@class="android.widget.ImageView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/imgCar"]
    Wait Until Element Is Visible    //*[@class="android.widget.TextView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/tvColorValue"]    timeout=30
    Capture Page Screenshot  vehicle_detail.png

o detalhe do veiculo deve ser exibido com todas as informações preenchidas
    #valida se tem foto
    Element Should Be Visible    //*[@class="android.widget.ImageView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/imgCar"]
    #valida se tem o nome
    Element Attribute Should Match    //*[@class="android.widget.TextView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/tvCarName"]    attr_name=text    match_pattern=\\w+    regexp=true
    #valida se tem descrição
    Element Attribute Should Match    //*[@class="android.widget.TextView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/tvCarDesc"]    attr_name=text    match_pattern=\\w+    regexp=true
    #valida se tem valor
    Element Attribute Should Match    //*[@class="android.widget.TextView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/tvValue"]    attr_name=text    match_pattern=R.*    regexp=true
    #valida ano
    Element Attribute Should Match    //*[@class="android.widget.TextView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/tvYearValue"]    attr_name=text    match_pattern=20[0-9]{2}    regexp=true
    #valida cor
    Element Attribute Should Match    //*[@class="android.widget.TextView" and @package="${APP_PACKAGE}" and @resource-id="br.com.siatiquosque.webmotorstest:id/tvColorValue"]    attr_name=text    match_pattern=\\w+    regexp=true
    
Fechar o app
    Stop Screen Recording    filename=webmotors
    Close All Applications

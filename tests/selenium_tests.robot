*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/selenium_locators.robot
   
Documentation   This is a test suite documentation.
 
 
*** Variables ***
${BROWSER}              chrome
${URL}                  https://demoqa.com/
${VALID_USERNAME}       user
${VALID_PASSWORD}       pass123
@{USER_ROLES}           Admin    Editor    Viewer
&{LOGIN_DATA}           username=admin    password=secret
 
*** Test Cases ***
# Valid Text Box
#     [Documentation]
#     [Tags]             
#     Open The Application  text-box
#     Input Text  id:userName  Jan Kowalski
#     Input Text  id:userEmail  jkowalski@gmail.com
#     Input Text  id:currentAddress  Szczecin, ul. Poludniowa 27
#     Input Text  id:permanentAddress  Poznan, ul. Pilsudzka 10a
#     Click Button  id:submit
#     Page Should Contain  Jan Kowalski
#     Page Should Contain  jkowalski@gmail.com
#     Page Should Contain  Szczecin, ul. Poludniowa 27
#     Page Should Contain  Poznan, ul. Pilsudzka 10a

# Valid Check Box
#     [Documentation]
#     [Tags]
#     Open The Application  checkbox
#     Click Button  //*[@id="tree-node"]/ol/li/span/button
#     Click Button  //*[@id="tree-node"]/ol/li/ol/li[3]/span/button
#     Click Element  //*[@id="tree-node"]/ol/li/ol/li[3]/ol/li[1]/span/label/span[1]
#     Page Should Contain  You have selected :
#     Page Should Contain  wordFile

Valid Radio Button
    [Documentation]
    [Tags]
    Open The Application  radio-button

*** Keywords ***
Open The Application 
    [Arguments]  ${endpoint}
    Open Browser    ${URL}${endpoint}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2s
    
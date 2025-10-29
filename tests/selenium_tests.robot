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
Validate Text Box
    [Documentation]
    [Tags]             
    Open The Application  text-box
    Input Text            userName  Jan Kowalski
    Input Text            userEmail  jkowalski@gmail.com
    Input Text            currentAddress  Szczecin, ul. Poludniowa 27
    Input Text            permanentAddress  Poznan, ul. Pilsudzka 10a
    Click Button          submit
    Page Should Contain   Jan Kowalski
    Page Should Contain   jkowalski@gmail.com
    Page Should Contain   Szczecin, ul. Poludniowa 27
    Page Should Contain   Poznan, ul. Pilsudzka 10a

Validate Check Box
    [Documentation]
    [Tags]
    Open The Application  checkbox
    Click Button          //*[@id="tree-node"]/ol/li/span/button
    Click Button          //*[@id="tree-node"]/ol/li/ol/li[3]/span/button
    Click Element         //*[@id="tree-node"]/ol/li/ol/li[3]/ol/li[1]/span/label/span[1]
    Page Should Contain   You have selected :
    Page Should Contain   wordFile

Validate Radio Button
    [Documentation]
    [Tags]
    Open The Application        radio-button
    Click Element               //label[@for='impressiveRadio']
    Element Should Contain      //p[@class='mt-3']  You have selected Impressive
    Element Should Be Disabled  noRadio
    
Validate WebTables
    [Documentation]
    [Tags]
    Open The Application              webtables
    Wait Until Page Contains Element  edit-record-2
    Click Element                     edit-record-2
    Wait Until Element Is Visible     //div[@class='modal-content']  timeout=5s
    Element Should Contain            //div[@class='modal-header']  Registration Form

*** Keywords ***
Open The Application 
    [Arguments]  ${endpoint}
    Open Browser    ${URL}${endpoint}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2s
    
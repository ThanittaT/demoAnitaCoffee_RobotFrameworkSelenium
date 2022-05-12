*** Settings ***
Documentation    mockup Anita Coffee Shop's website

Resource    ../Resources/AddressInfo.robot

Library    SeleniumLibrary

*** Variables ***
${OPEN_BROWSER} =   file:///C:/development/robot-script/demoRobotSelenium_mockAnitaCoffee/Resources/mockupDataTest/mock_webpage_Register.html

*** Keywords ***
SELECT_Checkbox_FavMenu
    select checkbox    reg_FavoriteMenu1
    select checkbox    xpath=//div//input[@id='_tellMenu3']


*** Test Cases ***
SCENARIO#1: Test System Register
    [Documentation]    1.Filling Personal Information Form
    [Tags]    Section#1:Personal Data-Register
    OPEN BROWSER   ${OPEN_BROWSER}    chrome
    MAXIMIZE BROWSER WINDOW
    WAIT UNTIL PAGE CONTAINS    mockup_Website for Automation Test- ROBOTFRAMEWORK SeleniumLibrary!

    LOG    LOG#1: --> This is log for 1.1 Start filling username&password
    input text  id=reg_username   Nonoka_Japan
    input text  xpath=//div/input[contains(@v,'reg_Password')]  P@ssw0rd

    LOG    LOG#2: -->This is log for 1.2 Start filling Personal Information
    input text  xpath=//div[label='Email : ']//input    nonoka.jp@demoEmail.com
    input text    xpath=//div[@class='_registerForm' and @id='4']//input    0991234567
    input text    xpath=//div[span[1]]//input   testNONOKA
    input text    xpath=//div//span[contains(@i,'lName')]/input   testJAPAN
    select radio button    reg_Gender2   Female
    capture element screenshot    xpath=//section//fieldset[1]    C:/development/robot-script/demoRobotSelenium_mockAnitaCoffee/Results/SCREENSHOT_RESULT/1. Personal_Information.png
    SLEEP    3s


    LOG    LOG#3: --> This is log for Filling Address information
    AddressInfo.Filling Address Form



    LOG    LOG#4: --> This is log for Questionaire after filling personal data
    select_checkbox_favmenu
    input text    xpath=//div[@m='menu' and @l='favBev' ]//input    Iced-Mocha
    input text    xpath=//div[@m='menu' and @n='favSnack' ]//input  Strawberry Pancakes

    capture element screenshot  xpath=//div[@class='_registerForm' and @id='12']    C:/development/robot-script/demoRobotSelenium_mockAnitaCoffee/Results/SCREENSHOT_RESULT/3. Questionaire-FavoriteMenu.png

    LOG    LOG#5: -->Completed filling Register's Form and prepare to submit-button
    click button    xpath=//div[span[@b='reg_btnSubmit']]//button
    sleep    2s

    #Handle Pop-up
    alert should be present    Success Register! Thank you for joining Anita Coffee Shop!   action=ACCEPT
    sleep    2s

    #Page CaptureScreen before Close
    capture page screenshot     C:/development/robot-script/demoRobotSelenium_mockAnitaCoffee/Results/SCREENSHOT_RESULT/4. CaptureScreen-once completed Form.png


    SLEEP    2s
    CLOSE BROWSER
*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Filling Address Form
    LOG    2.1 Fill address detail
    input text  xpath=//div[@class='_registerForm' and @id=8]//input  No.1 Sathorn City Tower-Building,Block#2,Floor-8th

    LOG    2.2 Log for "Select DropDown-list"
    select from list by value    subLocation    Bangkok
    input text    id=reg_Zipcode    10120
    input text    xpath=//div//input[@id='reg_PointOfInterest']    Opposite the StandardCharter's Bank,Chongnosi-Intersection

    capture page screenshot    C:/development/robot-script/demoRobotSelenium_mockAnitaCoffee/Results/SCREENSHOT_RESULT/2. AddressInfo-resource.png

    SLEEP    3s
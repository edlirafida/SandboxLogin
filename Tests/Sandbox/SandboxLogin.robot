*** Settings ***

Documentation  Test
Library  SeleniumLibrary
Library		String
Library		DateTime

*** Variables ***
${HasAjax}		1
${browser}  chrome
${url}  https://qa-sandbox.ni.htec.rs/

*** Keywords ***

Start TestCase

    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Finish TestCase
    Sleep  4s
    Close Browser

Delete Test Case ${TestCaseName}
    Wait until page contains element  //a[@class='landing-buttons--btn btn btn-primary']  10s
    Press keys  //a[@class='landing-buttons--btn btn btn-primary']    [return]
    Wait until page contains element  //input[@name='email']  10s
    wait until page contains element  //input[@name='password']  10s
    wait until page contains element  //div[@class='react-switch-bg']  10s
    wait until page contains element  //button[@class='full-width-btn']  10s
    Input text  //input[@name='email']  edlirafida@hotmail.com
    Input text  //input[@name='password']  Amirrita1
    Press Keys  //button[@class='full-width-btn']  [return]    [return]
    wait until page contains element  //a[@href='/testcases']
    press keys  //a[@href='/testcases']    [return]

    #Delete test case
    wait until page contains element   //div[@class='preview-card-title']/child::div[text()='${TestCaseName}']
    press keys   //div[@class='preview-card-title']/child::div[text()='${TestCaseName}']    [return]
    press keys  //i[@class='far fa-trash-alt']    [return]
    press keys  //div[text()='Remove']    [return]
    wait until page does not contain element  //div[@class='preview-card-title']/child::div[text()='${TestCaseName}']




*** Test Cases ***
#Test Case 0: Delete Test Cases
    #Start TestCase
    #Delete Test Case [Log in to Sandbox as unregistered user]
    #Finish TestCase

    #Start TestCase
    #Delete Test Case [Log in to Sandbox with invalid password]
    #Finish TestCase

    #Start TestCase
    #Delete Test Case [Confirm that password is case sensitive]
    #Finish TestCase

    #Start TestCase
    #Delete Test Case [Log in to Sandbox from the Login button at the top right. Don't select "Remember me]
    #Finish TestCase

    #Start TestCase
    #Delete Test Case [Log in to Sandbox from the Login button at the center of the page (body). Select Remember me]
    #Finish TestCase

Test Case 1: Log in to Sandbox as unregistered user

    [Documentation]  Sandbox Login
    [Tags]  Login  Negative

    Start TestCase

    Wait until page contains element  //div[@class='nav-links--link']//child::a[@href='/login']  10s
    Press keys  //div[@class='nav-links--link']//child::a[@href='/login']  [return]
    Wait until page contains element  //input[@name='email']  10s
    wait until page contains element  //input[@name='password']  10s
    wait until page contains element  //div[@class='react-switch-bg']  10s
    wait until page contains element  //button[@class='full-width-btn']  10s
    Input text  //input[@name='email']  test@test.com
    Input text  //input[@name='password']  123abc
    Press Keys  //button[@class='full-width-btn']  [return]
    Wait until page contains element  //label[@id='validation-msg']   10s

    Finish TestCase

Test Case 2: Log in to Sandbox with invalid password

    [Documentation]  Sandbox Login
    [Tags]  Login  Negative

    Start TestCase

    Wait until page contains element  //a[@class='landing-buttons--btn btn btn-primary']  10s
    Press keys  //a[@class='landing-buttons--btn btn btn-primary']  [return]
    Wait until page contains element  //input[@name='email']  10s
    wait until page contains element  //input[@name='password']  10s
    wait until page contains element  //div[@class='react-switch-bg']  10s
    wait until page contains element  //button[@class='full-width-btn']  10s
    Input text  //input[@name='email']  edlirafida@hotmail.com
    Input text  //input[@name='password']  123abc
    Press Keys  //button[@class='full-width-btn']  [return]
    Wait until page contains element  //label[@id='validation-msg']   10s

    Finish TestCase

Test Case 3: Confirm that password is case sensitive

    [Documentation]  Sandbox Login
    [Tags]  Login  Negative

    Start TestCase

    Wait until page contains element  //div[@class='nav-links--link']//child::a[@href='/login']  10s
    Press keys  //div[@class='nav-links--link']//child::a[@href='/login']  [return]
    Wait until page contains element  //input[@name='email']  10s
    wait until page contains element  //input[@name='password']  10s
    wait until page contains element  //div[@class='react-switch-bg']  10s
    wait until page contains element  //button[@class='full-width-btn']  10s
    Input text  //input[@name='email']  edlirafida@hotmail.com
    Input text  //input[@name='password']  aMIRRITA1
    Press Keys  //button[@class='full-width-btn']  [return]
    Wait until page contains element  //label[@id='validation-msg']   10s

    Finish TestCase

Test Case 4: Log in to Sandbox from the Login button at the top right. Don't select "Remember me"

    [Documentation]  Sandbox Login
    [Tags]  Login

    Start TestCase

    Wait until page contains element  //div[@class='nav-links--link']//child::a[@href='/login']  10s
    Press keys  //div[@class='nav-links--link']//child::a[@href='/login']  [return]
    Wait until page contains element  //input[@name='email']  10s
    wait until page contains element  //input[@name='password']  10s
    wait until page contains element  //div[@class='react-switch-bg']  10s
    wait until page contains element  //button[@class='full-width-btn']  10s
    Input text  //input[@name='email']  edlirafida@hotmail.com
    Input text  //input[@name='password']  Amirrita1
    Press Keys  //button[@class='full-width-btn']  [return]
    wait until page contains element  //div[@class='navigate-left-title']
    wait until page contains element  //a[@href='/dashboard']/parent::div[@class='nav-links--link']
    press keys  //a[@href='/dashboard']/parent::div[@class='nav-links--link']  [return]
    wait until page contains element  //div[@class='confirmation-dialog--buttons--confirm']
    press keys  //div[@class='confirmation-dialog--buttons--confirm']  [return]
    wait until page contains element  //input[@value='' and @name='email']
    wait until page contains element  //input[@value='' and @name='password']

    Finish TestCase


Test Case 5: Log in to Sandbox from the Login button at the center of the page (body). Select "Remember me"


    [Documentation]  Sandbox Login
    [Tags]  Login

    Start TestCase

    Wait until page contains element  //a[@class='landing-buttons--btn btn btn-primary']  10s
    Press keys  //a[@class='landing-buttons--btn btn btn-primary']  [return]
    Wait until page contains element  //input[@name='email']  10s
    wait until page contains element  //input[@name='password']  10s
    wait until page contains element  //div[@class='react-switch-bg']  10s
    wait until page contains element  //button[@class='full-width-btn']  10s
    Input text  //input[@name='email']  edlirafida@hotmail.com
    Input text  //input[@name='password']  Amirrita1
    Press keys  //div[@class='react-switch-bg']  [return]
    Press Keys  //button[@class='full-width-btn']  [return]
    wait until page contains element  //div[@class='navigate-left-title']
    wait until page contains element  //a[@href='/dashboard']/parent::div[@class='nav-links--link']
    press keys  //a[@href='/dashboard']/parent::div[@class='nav-links--link']  [return]
    wait until page contains element  //div[@class='confirmation-dialog--buttons--confirm']
    press keys  //div[@class='confirmation-dialog--buttons--confirm']  [return]
    wait until page contains element  //input[@value='edlirafida@hotmail.com' and @name='email']
    wait until page contains element  //input[@value='Amirrita1' and @name='password']

    Finish TestCase


    #Not finished as I haven't felt well for the last couple of days. 
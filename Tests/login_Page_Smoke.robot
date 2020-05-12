*** Settings ***
Documentation  A test suite for PMDB login page.
Library  SeleniumLibrary
Resource  ../Resources/login_Resource.robot
Variables  ../Variables/login_Variables.py
Test Teardown  Close Browser
*** Test Cases ***
#### Thist test checks feature that is not ready (no documentation added)
Clicking "Documentation" button should redirect to documentation
    Given Browser is opened to login page
    When User clicks Documentation button
    Then Documentation is shwon
    And Close Browser

#### Thist test checks feature that is not ready (no contact details/ form)
Clicking "Contact" button should redirect to contact form/ data
    Given Browser is opened to login page
    When User clicks Contact button
    Then Contact form/ data is shown
    And Close Browser

Should be able to login with correct login and password
    Given Browser is opened to login page
    When User provides valid password and username
    Then Project page should be opened
    And Close Browser

#### Thist test checks feature that is not ready (notification for empty username field)
Should not be able to login without login and password
    Given Browser is opened to login page
    When User provides no password and no username
    Then Show login error
    And Close Browser

Should not be able to login with invalid login and incorrect password
    Given Browser is opened to login page
    When User provides invalid password and invalid username
    Then Show login error
    And Close Browser

Should be able to add account with Sign up
    Given Browser is opened to login page
    When User clicks Sign up
    And User provides account data
    Then User submits Sign up data
    And Close Browser
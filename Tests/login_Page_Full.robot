*** Settings ***
Documentation  A test suite for PMDB login page.
Library  SeleniumLibrary
Resource  ../Resources/login_Resource.robot
Variables  ../Variables/login_Variables.py
Test Teardown  Close Browser
*** Variables ***
*** Test Cases ***
### Thist test checks feature that is not ready (no documentation added)
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

Should be albe to login with correct login and password
    Given Browser is opened to login page
    When User provides valid password and username
    Then Project page should be opened
    And Close Browser

Should not be able to login with ivalid login and correct password
    Given Browser is opened to login page
    When User provides valid password and invalid username
    Then Show login error
    And Close Browser

Should not be able to login with valid login and incorrect password
    Given Browser is opened to login page
    When User provides invalid password and valid username
    Then Show login error
    And Close Browser

#### Thist test checks feature that is not ready (standarized notification for empty username field)
Should not be able to login without login and without password
    Given Browser is opened to login page
    When User provides no password and no username
    Then Show login error
    And Close Browser

#### Thist test checks feature that is not ready standarized notification for empty username field)
Should not be able to login with password only
    Given Browser is opened to login page
    When User provides password and no username
    Then Show login error
    And Close Browser

##### Thist test checks feature that is not ready (standarized notification for empty password)
Should not be able to login with login only
    Given Browser is opened to login page
    When User provides no password and username
    Then Show login error
    And Close Browser

Should not be able to login with invalid login and incorrect password
    Given Browser is opened to login page
    When User provides invalid password and invalid username
    Then Show login error
    And Close Browser

##### Thist test checks feature that is not ready (password recovery page)
Should redirect to password recovery when clicking Forgot Password
    Given Browser is opened to login page
    When User clicks Forgot Password?
    Then Show password recovery
    And Close Browser

##### Thist test checks feature that is not ready (new account creation)
Should be able to add account with Create an account in Sign in
    Given Browser is opened to login page
    When User clicks Create an account
    Then Show create account form
    And Close Browser

##### Thist test checks feature that is not ready (new account creation)
Should be able to add account with Sign up
    Given Browser is opened to login page
    When User clicks Sign up
    And User provides account data
    Then User submits Sign up data
    And Close Browser

#### Thist test checks feature that is not ready (new account creation)
Should be impossible to create new account with no First Name
    Given Browser is opened to login page
    When User clicks Sign up
    And User provides account data (no First Name)
    Then User submits Sign up data
    And Close Browser

#### Thist test checks feature that is not ready (new account creation)
Should be impossible to create new account with no Last Name
    Given Browser is opened to login page
    When User clicks Sign up
    And User provides account data (no Last Name)
    Then User submits Sign up data
    And Close Browser

#### Thist test checks feature that is not ready (new account creation)
Should be impossible to create new account with no Email
    Given Browser is opened to login page
    When User clicks Sign up
    And User provides account data (no Email)
    Then User submits Sign up data
    And Close Browser

#### Thist test checks feature that is not ready (new account creation)
Should be impossible to create new account with no Password
    Given Browser is opened to login page
    When User clicks Sign up
    And User provides account data(no Password)
    Then User submits Sign up data
    And Close Browser

#### Thist test checks feature that is not ready (new account creation)
Should be impossible to create new account with no Password Confirmation
    Given Browser is opened to login page
    When User clicks Sign up
    And User provides account data (no Confirm Password)
    Then User submits Sign up data
    And Close Browser

*** Keywords ***
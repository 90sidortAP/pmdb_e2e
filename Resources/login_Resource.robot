*** Settings ***
Documentation  A resource file with reusable keywords and variables.
Library  SeleniumLibrary
Variables  ../Variables/login_Variables.py
*** Keywords ***
###### User actions ######
### Simple ###
User clicks Documentation button
    Element Should Be Visible  ${BUTTON_DOC}
    Click Element  ${BUTTON_DOC}

User clicks Contact button
    Element Should Be Visible  ${BUTTON_CONTACT}
    Click Element  ${BUTTON_CONTACT}

User opens Login Tab
    Element Should Be Visible  ${BUTTON_SIGNIN}
    Click Element  ${BUTTON_SIGNIN}

User provides Valid Username
    Element Should Be Visible  ${INPUT_USER}
    Input Text  ${INPUT_USER}  ${VALID_USER}

User provides Valid Password
    Element Should Be Visible  ${INPUT_PASS}
    Input Text  ${INPUT_PASS}  ${VALID_PASSWORD}

User provides Invalid Username
    Element Should Be Visible  ${INPUT_USER}
    Input Text  ${INPUT_USER}  ${INVALID_USER}

User provides Invalid Password
    Element Should Be Visible  ${INPUT_PASS}
    Input Text  ${INPUT_PASS}  ${INVALID_PASSWORD}

User submits credentials
    Element Should Be Visible  ${BUTTON_LOGIN}
    Click Element  ${BUTTON_LOGIN}

User clicks Sign up
    Element Should Be Visible  ${BUTTON_SIGNUP}
    Click Element  ${BUTTON_SIGNUP}

User submits Sign up data
    Element Should Be visible  ${BUTTON_SIGNUP2}
    Click Element  ${BUTTON_SIGNUP2}

### Sign in ###
User provides valid password and username
    User opens Login Tab
    User provides Valid Username
    User provides Valid Password
    User submits credentials

User provides valid password and invalid username
    User opens Login Tab
    User provides Invalid Username
    User provides Valid Password
    User submits credentials

User provides invalid password and valid username
    User opens Login Tab
    User provides Valid Username
    User provides Invalid Password
    User submits credentials

User provides invalid password and invalid username
    User opens Login Tab
    User provides Invalid Username
    User provides Invalid Password
    User submits credentials

User provides no password and no username
    User opens Login Tab
    User submits credentials

User provides password and no username
    User opens Login Tab
    User provides Valid Password
    User submits credentials

User provides no password and username
    User opens Login Tab
    User provides Valid Username
    User submits credentials

User clicks Forgot Password?
    User opens Login Tab
    Element Should Be Visible  ${A_FORGOT}
    Click Element  ${A_FORGOT}

User clicks Create an account
    User opens Login Tab
    Element Should Be Visible  ${A_CREATE}
    Click Element  ${A_CREATE}

### Create account ###
User provides First Name for new account
    Element Should Be Visible  ${INPUT_FNAME}
    Input Text  ${INPUT_FNAME}  ${NEW_USER_NAME}

User provides Last Name for new account
    Element Should Be Visible  ${INPUT_LNAME}
    Input Text  ${INPUT_LNAME}  ${NEW_USER_LAST_NAME}

User provides Email for new account
    Element Should Be Visible  ${INPUT_EMAIL}
    Input Text  ${INPUT_EMAIL}  ${NEW_USER_EMAIL}

User provides Password for new account
    Click Element  ${INPUT_EMAIL}
    Press Keys  None  TAB
    Press Keys  None  TAB
    Press Keys  None  ${NEW_USER_PASS}

User provides Confirm Password for new account
    Click Element  ${INPUT_EMAIL}
    Press Keys  None  TAB
    Press Keys  None  TAB
    Press Keys  None  TAB
    Press Keys  None  TAB
    Press Keys  None  ${NEW_USER_PASS}

User provides account data (no First Name)
    User provides Last Name for new account
    User provides Email for new account
    User provides Password for new account
    User provides Confirm Password for new account

User provides account data (no Last Name)
    User provides First Name for new account
    User provides Email for new account
    User provides Password for new account
    User provides Confirm Password for new account

User provides account data(no Email)
    User provides First Name for new account
    User provides Last Name for new account
    User provides Password for new account
    User provides Confirm Password for new account

User provides account data(no Password)
    User provides First Name for new account
    User provides Last Name for new account
    User provides Email for new account
    User provides Confirm Password for new account

User provides account data (no Confirm Password)
    User provides First Name for new account
    User provides Last Name for new account
    User provides Email for new account
    User provides Password for new account

User provides account data
    User provides First Name for new account
    User provides Last Name for new account
    User provides Email for new account
    User provides Password for new account
    User provides Confirm Password for new account

###### App Actions ######
### Simple ###

Show create account form
    Element Should Not Be Visible  ${A_CREATE}

Browser is opened to login page
    Open Browser To Login Page

Show login error
    Element Should Be Visible  ${DIV_ALERT}

Project page should be opened
    Element Should Be Visible  ${IMG_PROJECTS}

Documentation is shwon
    Element Should Be Visible  ${BUTTON_DOC}

Contact form/ data is shown
    Element Should Be Visible  ${BUTTON_CONTACT}

Show password recovery
    Element Should Be Visible  ${A_FORGOT}
### Complex ###
Open Browser To Login Page
    Open Browser  ${LOGIN_URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed   ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be  ${TITLE}
    Element Should Be Visible  ${H1_PMDB}
    ${H1 TEXT}  Get text  ${H1_PMDB}
    Should Be Equal As Strings  ${HEADER}  ${H1_TEXT}
    ${P TEXT}  Get text  ${P_DESC}
    Should Be Equal As Strings  ${DESCRIPTION}  ${P_TEXT}

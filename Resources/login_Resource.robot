*** Settings ***
Documentation  A resource file with reusable keywords and variables.
Library  SeleniumLibrary
Variables  ../Variables/login_Variables.py
*** Keywords ***
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

User clicks Documentation button
    Element Should Be Visible  ${BUTTON_DOC}
    Click Element  ${BUTTON_DOC}

User clicks Contact button
    Element Should Be Visible  ${BUTTON_CONTACT}
    Click Element  ${BUTTON_CONTACT}

Open Login Tab
    Element Should Be Visible  ${BUTTON_SIGNIN}
    Click Element  ${BUTTON_SIGNIN}

Input Valid Username
    Element Should Be Visible  ${INPUT_USER}
    Input Text  ${INPUT_USER}  ${VALID_USER}

Input Valid Password
    Element Should Be Visible  ${INPUT_PASS}
    Input Text  ${INPUT_PASS}  ${VALID_PASSWORD}

Input Invalid Username
    Element Should Be Visible  ${INPUT_USER}
    Input Text  ${INPUT_USER}  ${INVALID_USER}

Input Invalid Password
    Element Should Be Visible  ${INPUT_PASS}
    Input Text  ${INPUT_PASS}  ${INVALID_PASSWORD}

Submit Credentials
    Element Should Be Visible  ${BUTTON_LOGIN}
    Click Element  ${BUTTON_LOGIN}

Show login error
    Element Should Be Visible  ${DIV_ALERT}

Project page should be opened
    Element Should Be Visible  ${IMG_PROJECTS}

Documentation is shwon
    Element Should Be Visible  ${BUTTON_DOC}

Contact form/ data is shown
    Element Should Be Visible  ${BUTTON_CONTACT}

User clicks Forgot Password?
    Open Login Tab
    Element Should Be Visible  ${A_FORGOT}
    Click Element  ${A_FORGOT}

User clicks Create an account
    Open Login Tab
    Element Should Be Visible  ${A_CREATE}
    Click Element  ${A_CREATE}

Show password recovery
    Element Should Be Visible  ${A_FORGOT}

Input First Name for new account
    Element Should Be Visible  ${INPUT_FNAME}
    Input Text  ${INPUT_FNAME}  ${NEW_USER_NAME}

Input Last Name for new account
    Element Should Be Visible  ${INPUT_LNAME}
    Input Text  ${INPUT_LNAME}  ${NEW_USER_LAST_NAME}

Input Email for new account
    Element Should Be Visible  ${INPUT_EMAIL}
    Input Text  ${INPUT_EMAIL}  ${NEW_USER_EMAIL}

Input Password for new account
    Click Element  ${INPUT_EMAIL}
    Press Keys  None  TAB
    Press Keys  None  TAB
    Press Keys  None  ${NEW_USER_PASS}

Input Confirm Password for new account
    Click Element  ${INPUT_EMAIL}
    Press Keys  None  TAB
    Press Keys  None  TAB
    Press Keys  None  TAB
    Press Keys  None  TAB
    Press Keys  None  ${NEW_USER_PASS}

User provides account data (no First Name)
    Input Last Name for new account
    Input Email for new account
    Input Password for new account
    Input Confirm Password for new account

User provides account data (no Last Name)
    Input First Name for new account
    Input Email for new account
    Input Password for new account
    Input Confirm Password for new account

User provides account data(no Email)
    Input First Name for new account
    Input Last Name for new account
    Input Password for new account
    Input Confirm Password for new account

User provides account data(no Password)
    Input First Name for new account
    Input Last Name for new account
    Input Email for new account
    Input Confirm Password for new account

User provides account data (no Confirm Password)
    Input First Name for new account
    Input Last Name for new account
    Input Email for new account
    Input Password for new account

User provides account data
    Input First Name for new account
    Input Last Name for new account
    Input Email for new account
    Input Password for new account
    Input Confirm Password for new account

User clicks Sign up
    Element Should Be Visible  ${BUTTON_SIGNUP}
    Click Element  ${BUTTON_SIGNUP}

User submits Sign up data
    Element Should Be visible  ${BUTTON_SIGNUP2}
    Click Element  ${BUTTON_SIGNUP2}

Show create account form
    Element Should Not Be Visible  ${A_CREATE}

Browser is opened to login page
    Open Browser To Login Page

User provides valid password and username
    Open Login Tab
    Input Valid Username
    Input Valid Password
    Submit Credentials

User provides valid password and invalid username
    Open Login Tab
    Input Valid Username
    Input Invalid Password
    Submit Credentials

User provides invalid password and valid username
    Open Login Tab
    Input Valid Username
    Input Invalid Password
    Submit Credentials

User provides invalid password and invalid username
    Open Login Tab
    Input Valid Username
    Input Invalid Password
    Submit Credentials

User provides no password and no username
    Open Login Tab
    Submit Credentials

User provides password and no username
    Open Login Tab
    Input Valid Password
    Submit Credentials

User provides no password and username
    Open Login Tab
    Input Valid Username
    Submit Credentials
*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary

*** Variables ***
${SERVER}  http://127.0.0.1:8000/
${BROWSER}  chrome
${TITLE}  PMDB
${DELAY}  0
${VALID USER}  dabro
${VALID PASSWORD}  dupa123
${INVALID USER}  dabro123
${INVALID PASSWORD}  dupa321
${LOGIN URL}  ${SERVER}
${WELCOME URL}  http://${SERVER}/projects/
${HEADER}  Project Management Database
${DESCRIPTION}   Application for License-In and R&D projects, unified solution to collect data, manage harmonograms and budgets, track progress, archive data. All in one place.
${NEW USER NAME}  New
${NEW USER LAST NAME}  User
${NEW USER EMAIL}  new.user@adamed.com
${NEW USER PASS}  newadmin123

*** Keywords ***
Open Browser To Login Page
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed   ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    PMDB
    Element Should Be Visible  xpath: //h1[@class="header"]
    ${H1 TEXT}  Get text  xpath: //h1[@class="header"]
    Should Be Equal As Strings  ${HEADER}  ${H1 TEXT}
    ${P TEXT}  Get text  xpath: //p[@class="description"]
    Should Be Equal As Strings  ${DESCRIPTION}  ${P TEXT}

User clicks Documentation button
    Element Should Be Visible  xpath: //span[@class="icon documentation-icon"]/parent::button
    Click Element  xpath: //span[@class="icon documentation-icon"]/parent::button

User clicks Contact button
    Element Should Be Visible  xpath: //span[@class="icon contact-icon"]/parent::button
    Click Element  xpath: //span[@class="icon contact-icon"]/parent::button

Open Login Tab
    Click Element  xpath://button[@id="signInDropdownMenuButton"]

Input Valid Username
    Input Text  xpath://input[@id="id_username"]  ${VALID USER}

Input Valid Password
    Input Text    xpath://input[@id="id_password"]  ${VALID PASSWORD}

Input Invalid Username
    Input Text  xpath://input[@id="id_username"]  ${INVALID USER}

Input Invalid Password
    Input Text  xpath://input[@id="id_password"]  ${INVALID PASSWORD}

Submit Credentials
    Click Element  xpath: //*[contains(text(), "Log in")]

Show login error
    Element Should Be Visible  xpath://div[@class="alert alert-info"]

Project page should be opened
    Element Should Be Visible  xpath: //img[@title="Projects"]

Documentation is shwon
    Element Should Be Visible  xpath: //span[@class="icon documentation-icon"]/parent::button

Contact form/ data is shown
    Element Should Be Visible  xpath: //span[@class="icon contact-icon"]/parent::button

User clicks Forgot Password?
    Open Login Tab
    Element Should Be Visible  xpath: //*[contains(text(), "Forgot Password?")]
    Click Element  xpath: //*[contains(text(), "Forgot Password?")]

User clicks Create an account
    Open Login Tab
    Element Should Be Visible  xpath: //*[contains(text(), "Create an account")]
    Click Element  xpath: //*[contains(text(), "Create an account")]

Show password recovery
    Element Should Be Visible  xpath: //*[contains(text(), "Forgot Password?")]

Input First Name for new account
    Element Should Be Visible  xpath: //input[@placeholder='First Name']
    Input Text  xpath: //input[@placeholder='First Name']  ${NEW USER NAME}

Input Last Name for new account
    Element Should Be Visible  xpath: //input[@placeholder='Last Name']
    Input Text  xpath: //input[@placeholder='Last Name']  ${NEW USER LAST NAME}

Input Email for new account
    Element Should Be Visible  xpath: //input[@placeholder='Email']
    Input Text  xpath: //input[@placeholder='Email']  ${NEW USER EMAIL}

Input Password for new account
    Click Element  xpath: //input[@placeholder='Email']
    Press Keys  None  TAB
    Press Keys  None  TAB
    Press Keys  None  ${NEW USER PASS}

Input Confirm Password for new account
    Click Element  xpath: //input[@placeholder='Email']
    Press Keys  None  TAB
    Press Keys  None  TAB
    Press Keys  None  TAB
    Press Keys  None  TAB
    Press Keys  None  ${NEW USER PASS}

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
    Element Should Be Visible  xpath: //button[@id='signUpDropdownMenuButton']
    Click Element  xpath: //button[@id='signUpDropdownMenuButton']

User submits Sign up data
    Element Should Be visible  xpath: //button[@type='submit'][contains(text(), 'Sign up')]
    Click Element  xpath: //button[@type='submit'][contains(text(), 'Sign up')]

Show create account form
    Element Should Not Be Visible  xpath: //*[contains(text(), "Create an account")]

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
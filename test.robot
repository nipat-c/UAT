*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME DRIVER PATH}    /usr/bin/chromedriver
${URL}                   https://www.kku.ac.th

*** Test Cases ***
Open KKU Website
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    Create Webdriver    Chrome    options=${options}    executable_path=${CHROME DRIVER PATH}
    Go To    ${URL}
    Close Browser
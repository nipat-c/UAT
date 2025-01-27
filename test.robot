*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_DRIVER_PATH}    /usr/bin/chromedriver
${URL}                   https://www.kku.ac.th

*** Test Cases ***
Open KKU Website
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service('${CHROME_DRIVER_PATH}')    sys, selenium.webdriver
    Create Webdriver    Chrome    options=${options}    service=${service}
    Go To    ${URL}
    Close Browser
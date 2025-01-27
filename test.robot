*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    /Users/nipatchapakdee/SoftwareEN/Lab/Lab4/WebDemo-master/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing
${CHROME_DRIVER_PATH}     /usr/local/bin/chromedriver


*** Test Cases ***
Open KKU Website
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Set Variable    ${options.binary_location}    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service('${CHROME_DRIVER_PATH}')    sys, selenium.webdriver
    Create Webdriver    Chrome    options=${options}    service=${service}
    Go To    ${URL}
    Close Browser

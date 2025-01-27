*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}              https://www.kku.ac.th
${USER_DATA_DIR}    /tmp/chrome-user-data

*** Test Cases ***
Open KKU Website With Args
    Open Browser    ${URL}    Chrome
    ...    options={'args': [
    ...        '--no-sandbox',
    ...        '--disable-dev-shm-usage',
    ...        '--user-data-dir=' + str(${USER_DATA_DIR})
    ...    ]}
    Close Browser
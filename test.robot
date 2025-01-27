*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.kku.ac.th

*** Test Cases ***
Open KKU Website With Args
    @{args} =    Create List
    ...    --no-sandbox
    ...    --disable-dev-shm-usage
    ...    --user-data-dir=${USER_DATA_DIR}
    ${options} =    Create Dictionary    args=@{args}
    Open Browser    ${URL}    Chrome    options=${options}
    Close Browser
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SELENIUM GRID URL}    http://host.docker.internal:4444/wd/hub
${URL}                  https://www.kku.ac.th

*** Test Cases ***
Open KKU Website
    Open Browser    ${URL}    chrome    remote_url=${SELENIUM GRID URL}
    Close Browser
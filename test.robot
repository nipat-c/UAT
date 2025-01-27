*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem

*** Test Cases ***
Open KKU Website
    ${user_data_dir}=    Evaluate    "/tmp/chrome-user-data-" + __import__("uuid").uuid4().hex    modules=uuid
    Create Directory    ${user_data_dir}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --user-data-dir=${user_data_dir}
    Call Method    ${options}    add_argument    --headless=new  # ตัวอย่างเพิ่ม headless mode
    Open Browser    https://www.kku.ac.th    chrome    options=${options}
    [Teardown]    Run Keywords    Close Browser    AND    Remove Directory    ${user_data_dir}    recursive=True
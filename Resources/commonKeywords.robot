*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Begin web test
    open browser  about:blank  chrome
    Maximize Browser Window

End web test
    close browser
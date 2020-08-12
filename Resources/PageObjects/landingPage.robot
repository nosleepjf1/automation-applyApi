*** Settings ***
Documentation  The tests for the landing page of the site being tested
Library  SeleniumLibrary

*** Keywords ***
Open web page
    Go To  ${URL}

Click job
    Click Element  xpath://*[@id="job_listings"]/div/a[1]/div/h4
    Wait Until Page Contains  Apply for this Position
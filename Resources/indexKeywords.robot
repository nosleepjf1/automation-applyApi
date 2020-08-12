*** Settings ***
Resource  PageObjects/landingPage.robot
Resource  PageObjects/jobPage.robot
Resource  PageObjects/applyApi.robot
Library  DateTime
Library  SeleniumLibrary

*** Variables ***
${firstName} =  john
${lastName} =  doe
${phone} =  0000000000


*** Keywords ***
Open landing page
    landingPage.Open web page
    Wait Until Page Contains  Current Job Listings

Click job
    landingPage.Open web page
    landingPage.Click job

Fill job form
    indexKeywords.Click job
    jobPage.Enter first name
    jobPage.Enter last name
    jobPage.Enter email
    jobPage.Enter phone
    jobPage.Click checkbox
    jobPage.Click submit button

Select resume type
    indexKeywords.Fill job form
    jobPage.Click no thanks

Fill address
    indexKeywords.Select resume type
    jobPage.Enter address one
    jobPage.Enter address two
    jobPage.Enter state
    jobPage.Enter city
    jobPage.Enter zip
    jobPage.Click save and continue

Fill password
    indexKeywords.Fill address
    applyApi.Enter password
    applyApi.Check job questions
    applyApi.Check resume
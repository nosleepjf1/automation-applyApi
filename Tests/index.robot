*** Settings ***
Library  DateTime
Resource  ../Resources/commonKeywords.robot
Resource  ../Resources/indexKeywords.robot

Test Setup  commonKeywords.Begin web test
#Test Teardown  commonKeywords.End web test

#run test   robot -d Results -i current Tests/index.robot
*** Variables ***
${URL} =  https://lifestory.applicantpro.com/jobs/
${MICROSECONDS}

*** Test Cases ***
Time
    ${CurrentDate}=  Get Current Date  result_format=%Y-%m-%d %H:%M:%S.%f
    ${datetime} =	Convert Date  ${CurrentDate}  datetime
    ${MICROSECONDS}=  Set Variable   ${datetime.microsecond}
    Log  ${MICROSECONDS}

User can view the home page and see jobs
    indexKeywords.Open landing page
    log  hello

User can view a job
    indexKeywords.Click job

User can fill and submit basic job form
    indexKeywords.Fill job form

User can choose resume type
    indexKeywords.Select resume type

User can enter address
   indexKeywords.Fill address

User can enter password
    [Tags]  current
    indexKeywords.Fill password
*** Settings ***
Documentation  The tests for the job page
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
#basic info modal
Enter first name
    Input Text  id=first_name  ${firstName}
Enter last name
    ${CurrentDate}=  Get Current Date  result_format=%Y-%m-%d %H:%M:%S.%f
    ${datetime} =	Convert Date  ${CurrentDate}  datetime
    Input Text  id=last_name  ${lastName}${datetime.microsecond}
Enter email
    ${CurrentDate}=  Get Current Date  result_format=%Y-%m-%d %H:%M:%S.%f
    ${datetime} =	Convert Date  ${CurrentDate}  datetime
    Input Text  id=email  ${firstName}${lastName}${datetime.microsecond}@applicantpro.com
    Log  ${MICROSECONDS}
Enter phone
    Input Text  id=contact_number  ${phone}

Check communication policy
    ${c} =   Get Element Count  xpath=//*[@id="applicant_consent_approval"]
    Run Keyword If   ${c}>0    jobPage.Communication policy

Communication policy
    Select From List By Value  id=applicant_consent_approval  1

Click checkbox
    Click Element  id=info_use_consent

Click submit button
    Click Button  id=apply_button
    Wait Until Page Contains  Apply with Resume

#resume modal
Click no thanks
    Click Button  id=no_thanks_button
    Wait Until Page Contains  What is your current mailing address

#address modal
Enter address one
    Input Text  id=street1  321 east

Enter address two
    Input Text  id=street2  Jupiter Lane

Enter state
    Select From List By Value  id=state_id  45

Enter city
    Input Text  id=city  saratoga springs

Enter zip
    Input Text  id=zip  84045

Click save and continue
    Click Button  id=save_contact_info_button
    Wait Until Page Contains  Setup Password
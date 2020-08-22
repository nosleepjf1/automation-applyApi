*** Settings ***
Documentation  The tests for the apply api page
Library  SeleniumLibrary
Library  Dialogs

*** Variables ***


*** Keywords ***
Enter password
    Wait Until Page Contains  Choose Your Password
    Input Text  id=password  p
    Input Text  id=password_confirm  p
    Click Button  id=save_new_password
    Wait Until Page Contains   Password updated successfully

Check job questions
    #${c} will equal 1 if the xpath is present. If it is not present it will equal 0 and the keyword won't run
    ${c} =   Get Element Count   xpath=//*[@id="steps"]/a/span[text()="THISWONTWORK Job Questions"]
    Run Keyword If   ${c}>0    applyApi.Job questions

Job questions
    Click Element  xpath=//*[@id="steps"]/a/span[text()="Job Questions"]
    Execute Manual Step  Fill out Job Questions then click 'pass'

Check resume
    #${c} will equal 1 if the xpath is present. If it is not present it will equal 0 and the keyword won't run
    ${c} =   Get Element Count   xpath=//*[@id="steps"]/a/span[text()="Resume"]
    Run Keyword If   ${c}>0    applyApi.Resume

Resume
    Click Element  xpath=//*[@id="steps"]/a/span[text()="Resume"]
    Wait Until Page Contains  Copy/Paste Text
    Input Text  id=resume_text  my example resume
    Scroll Page To Location  0  2000
    Wait Until Element Is Visible  id=save_and_upload
    Click Button  id=save_and_upload
    Sleep  2


Employment History
    Click Element  xpath=//*[@id="steps"]/a/span[text()="Employment History"]
    Wait Until Page Contains  Add Employer
    Input Text  id=company  my example company
    Click Element  id=is_current_employer
    Select From List By Value  id=dates_employed_start_month  1
    Select From List By Value  id=dates_employed_start_year  2012
    Click Element  id=may_we_contact_no
    Click Button  id=submit_employment
    Sleep  2

Education
    Click Element  xpath=//*[@id="steps"]/a/span[text()="Education"]
    Wait Until Page Contains  Add Educational Experience
    Input Text  id=name  example high school
    Select From List By Value  id=type_id  1
    Click Element  id=did_graduate_yes
    Scroll Page To Location  0  2000
    Click Element  xpath=//*[@id="education_form"]/div[6]/div/input
    Sleep  2
    #Click Button  xpath=//*[@id="education_form"]/div[6]/div/input


Additional questions

Voluntary Disclosure

Submit Application


Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
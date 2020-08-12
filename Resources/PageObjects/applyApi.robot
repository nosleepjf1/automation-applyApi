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
    ${c} =   Get Element Count   xpath=//*[@id="steps"]/a/span[text()="asdfJob Questions"]
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
    Scroll Element Into View  id=save_and_upload
    Wait Until Element Is Visible  id=save_and_upload
    ##Click Button  id=save_and_upload


Additional questions

Voluntary Disclosure

Submit Application
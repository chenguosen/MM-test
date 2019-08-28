*** Settings ***
Library           XML
Library           Myimport
Resource          GlobalVariables.robot
Resource          basekeyword.robot

*** Keywords ***
CreateApplication
    [Arguments]    ${xml}
    setTransationidText    ${xml}
    setMd5Text    ${xml}

CreateProgram
    [Arguments]    ${xml}
    setTransationidText    ${xml}
    setMd5Text    ${xml}
    Set Element Text    ${xml}    ${contentid}    xpath=.//APPID

setTransationidText
    [Arguments]    ${xml}
    ${transationid}    transationid
    Set Elements Text    ${xml}    ${transationid}    xpath=.//TransactionId
    [Return]    ${transationid}

setMd5Text
    [Arguments]    ${xml}
    ${str}    catenate    ${transationid}#2015#wenruihong
    ${md5}    md5    ${str}
    Set Elements Text    ${xml}    ${md5}    xpath=.//MD5sign

CreatePayCode
    [Arguments]    ${xml}
    setTransationidText    ${xml}
    setMd5Text    ${xml}
    Set Element Text    ${xml}    ${contentid}    xpath=.//APPID

UploadProgram
    [Arguments]    ${xml}
    setTransationidText    ${xml}
    setMd5Text    ${xml}
    Set Element Text    ${xml}    ${contentid}    xpath=.//APPID
    Set Element Text    ${xml}    ${pid}    xpath=.//PID

TmsApplicationTest
    [Arguments]    ${xml}
    ${transationid}    transationid
    Set Elements Text    ${xml}    ${transationid}    xpath=.//TransactionID
    Set Element Text    ${xml}    ${transationid}    xpath=.//ProcessTime
    Set Element Text    ${xml}    ${contentid}    xpath=.//ContentID

tmsProgramTest
    [Arguments]    ${xml}
    TmsTestProgramData
    ${transationid}    transationid
    Set Elements Text    ${xml}    ${transationid}    xpath=.//TransactionID
    Set Element Text    ${xml}    ${transationid}    xpath=.//ProcessTime
    Set Element Text    ${xml}    ${contentid}    xpath=.//ContentID
    Set Element Text    ${xml}    ${pid}    xpath=.//ProgramID
    Set Element Text    ${xml}    ${ResourceId}    xpath=.//ResourceId
    Set Element Text    ${xml}    ${id}    xpath=.//id
    Set Element Text    ${xml}    ${DeviceId}    xpath=.//DeviceId

CheckOrderStatus
    [Arguments]    ${xml}
    ${transationid}    transationid
    Set Elements Text    ${xml}    ${transationid}    xpath=.//TransactionId
    Set Element Text    ${xml}    ${contentid}    xpath=.//APPID
    Set Element Text    ${xml}    ${contentid}01    xpath=.//PayCode

CheckAppInfomation
    [Arguments]    ${xml}
    ${transationid}    transationid
    Set Elements Text    ${xml}    ${transationid}    xpath=.//TransactionId
    Set Element Text    ${xml}    ${contentid}    xpath=.//APPID

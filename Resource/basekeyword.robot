*** Settings ***
Library           Collections
Library           String
Library           RequestsLibrary
Library           OperatingSystem
Library           XML
Library           DatabaseLibrary
Resource          GlobalVariables.robot
Library           FtpLibrary

*** Keywords ***
PostXml
    [Arguments]    ${xml}    ${url}    ${uri}
    ${body}    log element    ${xml}
    ${header}    Set Variable    <?xml version="1.0" encoding="UTF-8"?>
    ${request}    Set Variable    ${header}${body}
    ${dict}    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    Create Session    api    ${url}    ${dict}
    ${r}    Post Request    api    ${uri}    data=${request}
    ${a}    Replace String    ${r.text}    GBK    UTF-8
    ${response}    Get Variable Value    ${a.rstrip('\x00')}
    [Return]    ${response}

GetXmlFile
    [Arguments]    ${filename}
    ${b}    get File    ${filename}
    ${a}    Parse Xml    ${b}
    [Teardown]
    [Return]    ${a}

TestPayCode
    Connect To Database Using Custom Params    cx_Oracle    'rebuil_ppms','rebuil_ppms','10.12.3.135:1521/dev135'
    sleep    1
    Execute Sql String    call insert_ondemand_order_test111(${contentid})
    Disconnect From Database

TmsTestProgramData
    Connect To Database Using Custom Params    cx_Oracle    'rebuil_ppms','rebuil_ppms','10.12.3.135:1521/dev135'
    sleep    1
    ${a}    query    select c.contentid,a.pid,a.initialprogram,b.id,b.adapte_id from cm_ct_program_apply a, cm_ct_device_apply b, cm_content_apply c where a.contentid = b.contentid and a.contentid = '${contentid}' and c.contentid = a.contentid
    ${ResourceId}    Set Variable    ${a[0][2]}
    ${id}    Set Variable    ${a[0][3]}
    ${DeviceId}    Set Variable    ${a[0][4]}
    Set Test Variable    ${ResourceId}
    ${id}    evaluate    str(${id})
    Set Test Variable    ${id}
    ${DeviceId}    evaluate    str(${DeviceId})
    Set Test Variable    ${DeviceId}
    Disconnect From Database
    [Return]    ${ResourceId}    ${id}    ${DeviceId}

ConnectFtp
    Ftp Connect    ${ftphost}    ${ftpusername}    ${ftppassword}

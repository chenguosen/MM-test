*** Variables ***
${ApmsUrl}        http://10.12.8.240:48081
${createAppUri}    /oms/appContentAddOrUpdate
${ftphost}        10.1.3.223
${ftpusername}    huaweipg
${ftppassword}    2014@huawei
${CopyRightAttach}    d:/wenruihong/999.zip
${createProgramUri}    /oms/programAndSynchronizeMd5
${createPayCodeUri}    oms/appPayCodeApply
${uploadProgramUri}    oms/uploadProgramPackage
${Program}        d:/wenruihong/Yoo.apk
${LOGO}           d:/wenruihong/123u2.png
${Picture1}       d:/wenruihong/1431677576425.png
${Picture2}       d:/wenruihong/1431677578917.jpg
${KeyStore}       d:/wenruihong/img200910172057151.keystore
${PpmsUrl}        http://10.12.8.240:58081
${tmsApptestUri}    /oms/tmsAPPTest
${tmsProgramTestUri}    /oms/tmsPGTest
${checkOrderStatusUri}    /oms/TestOrder
${checkAppInfomationUri}    /oms/AppInformationQuery

*** Keywords ***
transationid
    ${time}    get time    epoch
    ${transationid}    evaluate    '2017' + str(${time})
    Set Test Variable    ${transationid}
    sleep    1
    [Return]    ${transationid}

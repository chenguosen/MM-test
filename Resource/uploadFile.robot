*** Settings ***
Library           FtpLibrary
Resource          GlobalVariables.robot

*** Keywords ***
uploadCreateAppFile
    Upload File    ${CopyRightAttach}

uploadProgramFile
    Upload File    ${Program}
    Upload File    ${LOGO}
    Upload File    ${Picture1}
    Upload File    ${Picture2}
    Upload File    ${KeyStore}

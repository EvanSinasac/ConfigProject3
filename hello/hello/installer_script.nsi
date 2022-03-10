# INFO6025 Configuration and Deployment (Project 3)
# This installer scrip will create an installer "hello_installer.exe"
# This installer will create a "Hello" folder on the desktop that contains hello.exe and hello.txt
# The installer will also create an uninstaller "hello_uninstaller.exe" that will clean up everything, including itself

!include "LogicLib.nsh"

# define the name of our installer
OutFile "hello_installer.exe"

Function InstallationCheck
    ${If} ${FileExists} "$DESKTOP\Hello"
        MessageBox MB_YESNO|MB_ICONSTOP "There is already a hello application installed!  \
        Do you want to overwrite it?" IDYES yes IDNO cancel
        yes: 
            DetailPrint "Installing over the existing hello"
            Goto next
        cancel:
            DetailPrint "Cancelling the installation"
            Quit
        next:
    ${EndIf}
FunctionEnd

# define the directory to install to.
InstallDir $DESKTOP

# start our default section
Section

Call InstallationCheck

CreateDirectory "$DESKTOP\Hello"

# define the output path for this file
SetOutPath "$INSTDIR\Hello"


# define what to install and put in the output path
File hello.txt
File hello.exe
# define uninstaller
WriteUninstaller "$INSTDIR\hello_uninstaller.exe"

# end our default section
SectionEnd

# now start our uninstaller section
# the section will always be "Uninstall"
Section "Uninstall"

Delete "$INSTDIR\hello_uninstaller.exe"

Delete "$INSTDIR\Hello\hello.txt"
Delete "$INSTDIR\Hello\hello.exe"

# delete the directory
RMDir "$INSTDIR\Hello"

# end the uninstaller section
SectionEnd
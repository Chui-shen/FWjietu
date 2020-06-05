; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "ɳ���ͼ"
!define PRODUCT_VERSION "0.03"
!define PRODUCT_PUBLISHER "���߸���"
!define PRODUCT_WEB_SITE "https://xl.lengku.cf"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\main.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "Screenshot_128px_538122_easyicon.net.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_LICENSEPAGE_RADIOBUTTONS
!insertmacro MUI_PAGE_LICENSE "build\main\warn-main.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Start menu page
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "ɳ���ͼ"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\main.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Setup.exe"
InstallDir "$PROGRAMFILES\ɳ���ͼ"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite try
  File "dist\main\base_library.zip"
  SetOutPath "$INSTDIR\Include"
  File "dist\main\Include\pyconfig.h"
  SetOutPath "$INSTDIR\lib2to3"
  File "dist\main\lib2to3\Grammar.txt"
  File "dist\main\lib2to3\Grammar3.6.8.final.0.pickle"
  File "dist\main\lib2to3\PatternGrammar.txt"
  File "dist\main\lib2to3\PatternGrammar3.6.8.final.0.pickle"
  SetOutPath "$INSTDIR\lib2to3\tests\data"
  File "dist\main\lib2to3\tests\data\README"
  SetOutPath "$INSTDIR"
  File "dist\main\libopenblas.CSRRD7HKRKC3T3YXA7VY7TAZGLSWDKW6.gfortran-win_amd64.dll"
  File "dist\main\main.exe"
  File "dist\main\main.exe.manifest"
  File "dist\main\mfc140u.dll"
  SetOutPath "$INSTDIR\numpy\core"
  File "dist\main\numpy\core\multiarray.cp36-win_amd64.pyd"
  File "dist\main\numpy\core\umath.cp36-win_amd64.pyd"
  File "dist\main\numpy\core\_multiarray_tests.cp36-win_amd64.pyd"
  SetOutPath "$INSTDIR\numpy\fft"
  File "dist\main\numpy\fft\fftpack_lite.cp36-win_amd64.pyd"
  SetOutPath "$INSTDIR\numpy\linalg"
  File "dist\main\numpy\linalg\lapack_lite.cp36-win_amd64.pyd"
  File "dist\main\numpy\linalg\_umath_linalg.cp36-win_amd64.pyd"
  SetOutPath "$INSTDIR\numpy\random"
  File "dist\main\numpy\random\mtrand.cp36-win_amd64.pyd"
  SetOutPath "$INSTDIR\PIL"
  File "dist\main\PIL\_imaging.cp36-win_amd64.pyd"
  File "dist\main\PIL\_imagingtk.cp36-win_amd64.pyd"
  File "dist\main\PIL\_webp.cp36-win_amd64.pyd"
  SetOutPath "$INSTDIR"
  File "dist\main\pyexpat.pyd"
  File "dist\main\python36.dll"
  File "dist\main\pythoncom36.dll"
  File "dist\main\pywintypes36.dll"
  File "dist\main\select.pyd"
  File "dist\main\unicodedata.pyd"
  File "dist\main\VCRUNTIME140.dll"
  File "dist\main\win32api.pyd"
  File "dist\main\win32clipboard.pyd"
  SetOutPath "$INSTDIR\win32com\shell"
  File "dist\main\win32com\shell\shell.pyd"
  SetOutPath "$INSTDIR"
  File "dist\main\win32gui.pyd"
  File "dist\main\win32pdh.pyd"
  File "dist\main\win32trace.pyd"
  File "dist\main\win32ui.pyd"
  File "dist\main\win32wnet.pyd"
  File "dist\main\_bz2.pyd"
  File "dist\main\_cpyHook.cp36-win_amd64.pyd"
  File "dist\main\_ctypes.pyd"
  File "dist\main\_decimal.pyd"
  File "dist\main\_distutils_findvs.pyd"
  File "dist\main\_hashlib.pyd"
  File "dist\main\_lzma.pyd"
  File "dist\main\_multiprocessing.pyd"
  File "dist\main\_socket.pyd"
  File "dist\main\_ssl.pyd"
  File "dist\main\_win32sysloader.pyd"

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\ɳ���ͼ.lnk" "$INSTDIR\main.exe"
  CreateShortCut "$DESKTOP\ɳ���ͼ.lnk" "$INSTDIR\main.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -AdditionalIcons
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk" "$INSTDIR\uninst.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\main.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\main.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) �ѳɹ��ش���ļ�����Ƴ���"
FunctionEnd

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��ȷʵҪ��ȫ�Ƴ� $(^Name) ���估���е������" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\_win32sysloader.pyd"
  Delete "$INSTDIR\_ssl.pyd"
  Delete "$INSTDIR\_socket.pyd"
  Delete "$INSTDIR\_multiprocessing.pyd"
  Delete "$INSTDIR\_lzma.pyd"
  Delete "$INSTDIR\_hashlib.pyd"
  Delete "$INSTDIR\_distutils_findvs.pyd"
  Delete "$INSTDIR\_decimal.pyd"
  Delete "$INSTDIR\_ctypes.pyd"
  Delete "$INSTDIR\_cpyHook.cp36-win_amd64.pyd"
  Delete "$INSTDIR\_bz2.pyd"
  Delete "$INSTDIR\win32wnet.pyd"
  Delete "$INSTDIR\win32ui.pyd"
  Delete "$INSTDIR\win32trace.pyd"
  Delete "$INSTDIR\win32pdh.pyd"
  Delete "$INSTDIR\win32gui.pyd"
  Delete "$INSTDIR\win32com\shell\shell.pyd"
  Delete "$INSTDIR\win32clipboard.pyd"
  Delete "$INSTDIR\win32api.pyd"
  Delete "$INSTDIR\VCRUNTIME140.dll"
  Delete "$INSTDIR\unicodedata.pyd"
  Delete "$INSTDIR\select.pyd"
  Delete "$INSTDIR\pywintypes36.dll"
  Delete "$INSTDIR\pythoncom36.dll"
  Delete "$INSTDIR\python36.dll"
  Delete "$INSTDIR\pyexpat.pyd"
  Delete "$INSTDIR\PIL\_webp.cp36-win_amd64.pyd"
  Delete "$INSTDIR\PIL\_imagingtk.cp36-win_amd64.pyd"
  Delete "$INSTDIR\PIL\_imaging.cp36-win_amd64.pyd"
  Delete "$INSTDIR\numpy\random\mtrand.cp36-win_amd64.pyd"
  Delete "$INSTDIR\numpy\linalg\_umath_linalg.cp36-win_amd64.pyd"
  Delete "$INSTDIR\numpy\linalg\lapack_lite.cp36-win_amd64.pyd"
  Delete "$INSTDIR\numpy\fft\fftpack_lite.cp36-win_amd64.pyd"
  Delete "$INSTDIR\numpy\core\_multiarray_tests.cp36-win_amd64.pyd"
  Delete "$INSTDIR\numpy\core\umath.cp36-win_amd64.pyd"
  Delete "$INSTDIR\numpy\core\multiarray.cp36-win_amd64.pyd"
  Delete "$INSTDIR\mfc140u.dll"
  Delete "$INSTDIR\main.exe.manifest"
  Delete "$INSTDIR\main.exe"
  Delete "$INSTDIR\libopenblas.CSRRD7HKRKC3T3YXA7VY7TAZGLSWDKW6.gfortran-win_amd64.dll"
  Delete "$INSTDIR\lib2to3\tests\data\README"
  Delete "$INSTDIR\lib2to3\PatternGrammar3.6.8.final.0.pickle"
  Delete "$INSTDIR\lib2to3\PatternGrammar.txt"
  Delete "$INSTDIR\lib2to3\Grammar3.6.8.final.0.pickle"
  Delete "$INSTDIR\lib2to3\Grammar.txt"
  Delete "$INSTDIR\Include\pyconfig.h"
  Delete "$INSTDIR\base_library.zip"

  Delete "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Website.lnk"
  Delete "$DESKTOP\ɳ���ͼ.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\ɳ���ͼ.lnk"

  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$INSTDIR\win32com\shell"
  RMDir "$INSTDIR\PIL"
  RMDir "$INSTDIR\numpy\random"
  RMDir "$INSTDIR\numpy\linalg"
  RMDir "$INSTDIR\numpy\fft"
  RMDir "$INSTDIR\numpy\core"
  RMDir "$INSTDIR\lib2to3\tests\data"
  RMDir "$INSTDIR\lib2to3"
  RMDir "$INSTDIR\Include"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
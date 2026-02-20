; ============================================
; mpv.net Inno Setup Script
; Supports x64 and arm64 (matrix compatible)
; ============================================

#define MyAppName "mpv.net"
#define MyAppPublisher "mpv.net"
#define MyAppURL "https://github.com/mpvnet-player/mpv.net"

; Values passed from GitHub Actions:
#define MyAppVersion GetStringParam("MyAppVersion", "0.0.0")
#define SourceDir GetStringParam("SourceDir", "")
#define Platform GetStringParam("Platform", "x64")

; ============================================
; Setup
; ============================================

[Setup]
AppId={{A7C5A9C1-6A63-4E8E-9F64-1D4F58A6A000}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}

DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}

OutputDir=Output
OutputBaseFilename=mpv.net-{#MyAppVersion}-{#Platform}-setup

Compression=lzma
SolidCompression=yes
WizardStyle=modern

ArchitecturesAllowed={#Platform}
ArchitecturesInstallIn64BitMode={#Platform}

DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\mpvnet.exe

; ============================================
; Files
; ============================================

[Files]
; Take everything from the publish directory
Source: "{#SourceDir}\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs

; ============================================
; Icons
; ============================================

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\mpvnet.exe"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"

Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\mpvnet.exe"; Tasks: desktopicon

; ============================================
; Tasks
; ============================================

[Tasks]
Name: "desktopicon"; Description: "Create a desktop icon"; GroupDescription: "Additional icons:"; Flags: unchecked

; ============================================
; Run
; ============================================

[Run]
Filename: "{app}\mpvnet.exe"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent

; ============================================
; Uninstall
; ============================================

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

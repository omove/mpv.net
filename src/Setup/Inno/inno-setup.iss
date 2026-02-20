
#define MyAppName "mpv.net"
#define MyAppExeName "mpvnet.exe"
#define MyAppVersion GetStringParam("MyAppVersion", "0.0.0")
#define SourceDir GetStringParam("SourceDir", "")
#define Platform GetStringParam("Platform", "x64")

[Setup]
AppId={{9AA2B100-BEF3-44D0-B819-D8FC3C4D557D}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher=Frank Skare (stax76)
ArchitecturesAllowed={#Platform}
ArchitecturesInstallIn64BitMode={#Platform}
Compression=lzma2
DefaultDirName={autopf}\{#MyAppName}
OutputBaseFilename=mpv.net-v{#MyAppVersion}-setup-x64
OutputDir=E:\Desktop
DefaultGroupName={#MyAppName}
SetupIconFile=..\..\MpvNet.Windows\mpv-icon.ico
UninstallDisplayIcon={app}\{#MyAppExeName}
PrivilegesRequired=admin
PrivilegesRequiredOverridesAllowed=dialog

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

[Files]
Source: "{#SourceDir}\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs



@echo on


REM uninstalling - Dell Backup and Recovery
"C:\Program Files (x86)\InstallShield Installation Information\{0ED7EE95-6A97-47AA-AD73-152C08A15B04}\setup.exe" -runfromtemp -l0x0409  -removeonly
REM done!
REM uninstall Dell command
MsiExec.exe /X{EC542D5D-B608-4145-A8F7-749C02BE6D94}
REM done!
REM uninstall Dell Digital Delivery
MsiExec.exe /I{693A23FB-F28B-4F7A-A720-4C1263F97F43}
REM done! 
REM uninstall Dell Edoc Viewer
MsiExec.exe /I{8EBA8727-ADC2-477B-9D9A-1A1836BE4E05}
REM done!
REM uninstall  Dell Foundation Services
MsiExec.exe /X{AE5E3C86-2633-4DAF-A7F4-C43D1E738BAE}
REM done!
REM uninstall Dell Protected Workspace
MsiExec.exe /X{E2CAA395-66B3-4772-85E3-6134DBAB244E}
REM done!
REM uninstall Dell Update
MsiExec.exe /I{DB82968B-57A4-4397-81A5-ECAB21B5DFCD}
REM done!


$infos = Get-CimInstance Win32_OperatingSystem
$disk = Get-CimInstance Win32_LogicalDisk | Where-Object -Property DeviceID -eq "C:"
$role = Switch ((Get-CimInstance -Class Win32_ComputerSystem).DomainRole) {
    "0"	{ "Standalone Workstation" }
    "1"	{ "Member Workstation" }
    "2"	{ "Standalone Server" }
    "3"	{ "Member Server" }
    "4"	{ "Backup Domain Controller" }
    "5"	{ "Primary Domain Controller" }
}
$freeMemory = ($infos.FreePhysicalMemory / 1024) / 1024;
$totalMemory = ($infos.TotalVirtualMemorySize / 1024) / 1024;
$uptime = (get-date) - (gcim Win32_OperatingSystem).LastBootUpTime
$v = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'	


[SystemInformation]@{
    SoftwareInformation = [SoftwareInformation]@{
        Hostname             = hostname
        DomainRole           = $role
        OperatingSystem      = $infos.Caption
        LicenseStatus        = $lcStatus
        BuildNumber          = 'Version {0} (Build {1}.{2})' -f $v.DisplayVersion, $v.CurrentBuildNumber, $v.UBR
        InstallationLanguage = ((Get-UICulture).DisplayName)
        SystemUptime         = '{0:d1}:{1:d2}:{2:d2}:{3:d2}' -f $uptime.Days, $uptime.Hours, $uptime.Minutes, $uptime.Seconds
        OSArchitecture       = (Get-WmiObject win32_operatingsystem | select osarchitecture).osarchitecture
    }
    HardwareInformation = [HardwareInformation]@{
        BIOSVersion        = (Get-WmiObject -Class Win32_BIOS).Version
        SystemSKU          = (Get-WmiObject -Namespace root\wmi -Class MS_SystemInformation).SystemSKU
        SystemSerialnumber = (Get-WmiObject win32_bios).Serialnumber
        SystemManufacturer = (Get-WMIObject -class Win32_ComputerSystem).Manufacturer
        SystemModel        = (Get-WMIObject -class Win32_ComputerSystem).Model
        FreeDiskSpace      = "{0:N3}" -f "$([math]::Round(($disk.FreeSpace / $disk.Size)*100,1))% " + "{0:N3}" -f "($([math]::Round($disk.FreeSpace / 1GB,1)) GB / $([math]::Round($disk.Size / 1GB,1)) GB)"
        FreePhysicalMemory = "{0:N3}" -f "$([math]::Round(($freeMemory/$totalMemory)*100,1))% ($([math]::Round($freeMemory,1)) GB / $([math]::Round($totalMemory,1)) GB)"
    }
}





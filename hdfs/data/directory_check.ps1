param(

[string]$path = "hdfs/",

[string]$name_of_directory = "data",

[string]$filename_excel = "source/Dataset_Final_Project_KN-DE.xlsx"

)

# Check if the directory exist
$directoryPath = Join-Path $path /$name_of_directory

if (Test-Path $directoryPath -PathType Container) {
 
    Write-Host "$($name_of_directory) Directory Exists!"
}

else {
    Write-Host "$($name_of_directory) Directory Not Exists! Please create the directory...."
 
    # Create the directory
    New-Item -ItemType Directory -Path $directoryPath | Out-Null 
}

#Final Step : create cront task schedule to run the script daily at 07:00 AM

[string]$User = "UTUSKS"

$trigger = New-ScheduledTaskTrigger -Daily -At 7am

$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-ExecutionPolicy Bypass -File ""C:\Users\Ajiel Sinatra\Documents\Internship Data Engineer Kalbe Nutritional\Minggu 4\directory_check.ps1"""

Register-ScheduledTask -TaskName "CheckDirectoryTask" -Trigger $trigger -Action $action -User $User -RunLevel Highest

Write-Host "Scheduled task 'CheckDirectoryTask' created cront task schedule to run the script daily at 07:00 AM"
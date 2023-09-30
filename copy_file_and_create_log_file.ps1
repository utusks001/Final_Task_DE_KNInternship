# Define source and target directories
param (
[string]$path_source = "local/data/market",
[string]$path_target = "hdfs/data/data1"
)

# Define the file
$filename_excel = "Dataset_Final_Project_KN-DE.xlsx"

# Use the Copy-Item cmdlet to copy files
Copy-Item -Path $path_source\* -Destination $path_target -Recurse
Write-Host "Excel File : '$filename_excel' has copied Successfully from '$path_source' to '$path_target'.”

try {
    # Define the base name for the log file
    $logFileNameBase = "move_log"

    # Define the file extension for the log file
    $logFileExtension = ".txt"

    #create a new log file with a timestamp
    $timestamp = Get-Date -Format "yyyyMMddHHmm"
    $newLogFileName = "${logFileNameBase}_${timestamp}${logFileExtension}"

    # Construct the full path for the log file
    $logFilePath = Join-Path -Path $path_target -ChildPath $newLogFileName

    # Check if the log file already exists
    if (Test-Path -Path $logFilePath -PathType Leaf) {

        # If the log file exists, create a new log file with a timestamp
        $newLogFilePath = Join-Path -Path $path_target -ChildPath $newLogFileName

        # Create the new log file
        $newLogContent = "New Log File Created"
        $newLogContent | Out-File -FilePath $newLogFilePath -Force
        Write-Host "A new log file '$newLogFileName' was created already."
    } else {
        # If the log file doesn't exist, create it
        $logContent = "Log File Created"
        $logContent | Out-File -FilePath $logFilePath -Force
        Write-Host "Log file : '$logFilePath' created successfully in '$path_target'."
    }
} catch {
    Write-Host "Error: $_"
}




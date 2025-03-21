#Set this in the task scheduler for Windows

# Set a random number between 1 and 365 (for the days of the year)
$randomDay = Get-Random -Minimum 1 -Maximum 366

# Get the current day of the year
$currentDayOfYear = (Get-Date).DayOfYear

Write-Host "The random day is: $randomDay"
Write-Host "The current day is: $currentDayOfYear"

# If the random day matches the current day, run the script
if ($randomDay -eq $currentDayOfYear) {
    $gitBashPath = "C:\Program Files\Git\bin\bash.exe"  # Adjust this path if needed

	# Path to the script you want to run
	$bashScriptPath = "Path\To\bot.sh"  # Modify the path to your bot.sh script

	$process = Start-Process -FilePath $gitBashPath -ArgumentList "$bashScriptPath" -WindowStyle Hidden -PassThru

	$process.WaitForExit()

	Write-Host "Git Push Finished"
}
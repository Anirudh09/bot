#Set this in the task scheduler for Windows

# Set a random number between 1 and 365 (for the days of the year)
$randomDay = Get-Random -Minimum 1 -Maximum 366

# Get the current day of the year
$currentDayOfYear = (Get-Date).DayOfYear

Write-Host "The random day is: $randomDay"
Write-Host "The current day is: $currentDayOfYear"

# If the random day matches the current day, run the script
if ($randomDay -eq $currentDayOfYear) {

	# Set commit message with current date
	$info = "Commit: $(Get-Date)"

	# Append the commit info to the output.txt file
	$info | Out-File -Append -FilePath "path\to\output_file"

	# Output the commit info to the console
	Write-Host $info
	Write-Host ""
	
	$gitRepoPath = "path\to\git_repo"
    Set-Location -Path $gitRepoPath

	# Detect current branch (main, master, etc.)
	$branch = git rev-parse --abbrev-ref HEAD

	# Stage the file and commit changes
	git add output.txt
	git commit -m $info

	# Push the changes to the remote repository
	git push origin $branch
	Write-Host "Git Push Finished"
}

exit
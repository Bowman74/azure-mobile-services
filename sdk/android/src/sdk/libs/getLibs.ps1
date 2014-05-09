$client = new-object System.Net.WebClient 
$shell_app = new-object -com shell.application
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath
$filename = "google-gson-2.2.2-release.zip"

Write-Host "Downloading Google Gson 2.2.2"
$client.DownloadFile("http://google-gson.googlecode.com/files/google-gson-2.2.2-release.zip", "$dir\$filename") 

Write-Host "Decompressing..."
$zip_file = $shell_app.namespace("$dir\$filename")
$destination = $shell_app.namespace("$dir")
$destination.Copyhere($zip_file.items())

Write-Host "Removing zip"
Remove-Item "$dir\$filename"

Write-Host "Move library to destination"
Move-Item "$dir\google-gson-2.2.2\gson-2.2.2.jar" "$dir"

Write-Host "Remove extra files"
Remove-Item "$dir\google-gson-2.2.2\" -recurse

$filename = "guava-16.0.1.jar"
Write-Host "Downloading Guava Libraries 16.0.1"
$client.DownloadFile("http://search.maven.org/remotecontent?filepath=com/google/guava/guava/16.0.1/guava-16.0.1.jar", "$dir\$filename")

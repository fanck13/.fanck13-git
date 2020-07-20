Test-Path 

"[include]`r`n`tpath = ./.fanck13-git/config.include" | Out-File -Append -Encoding utf8 $HOME\.gitconfig

Write-Output "Begin add custom command"
Write-Output $PSScriptRoot
$target = Join-Path $PSScriptRoot "scripts\windows\"

$fileList = Get-ChildItem $target
ForEach($file in $fileList)
{
    if($file -is [System.IO.FileInfo])
    {
        $command = Join-Path $target $file.name
        $command = $command -replace "\\", "/"

        $temp = -join("!", $command)
        
        $command_name = [System.IO.Path]::GetFileNameWithoutExtension($file.name) 
        Write-Output "Add command $command_name"
        git config --global alias.$command_name $temp
    }
}

Write-Output "End add custom command"

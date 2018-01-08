
$Users = Import-Csv -Path "C:\scripts\import_users.csv"            
foreach ($User in $Users)            
{            
    $Displayname = $User.'Firstname' + " " + $User.'Lastname'            
    $UserFirstname = $User.'Firstname'            
    $UserLastname = $User.'Lastname'                    
    $SAM = $User.'SAM'            
    $UPN = $User.'Firstname' + "." + $User.'Lastname' + "@" + $User.'Maildomain'               
    $Password = $User.'Password'            
    New-ADUser -Name "$Displayname" -DisplayName "$Displayname" -SamAccountName $SAM -UserPrincipalName $UPN -GivenName "$UserFirstname" -Surname "$UserLastname" -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $false –PasswordNeverExpires $true            
}
# PowerShell scriptje om nieuwe users aan te maken in ADUC
# Users staan opgelijst in bijhorend csv-bestand (import_users.csv)
# CSV structuur: Firstname,Lastname,Maildomain,SAM,Password

# Alle users opgesomd in de CSV inlezen in de $Users variabele
$Users = Import-Csv -Path "C:\scripts\import_users.csv"       

# Voor elke entry(user) in de array $Users de opgegeven waarden invullen in ADUC
foreach ($User in $Users)            
{            
    $Displayname = $User.'Firstname' + " " + $User.'Lastname'            
    $UserFirstname = $User.'Firstname'            
    $UserLastname = $User.'Lastname'                    
    $SAM = $User.'SAM'            
    $UPN = $User.'Firstname' + "." + $User.'Lastname' + "@" + $User.'Maildomain'               
    $Password = $User.'Password'            
    New-ADUser -Name "$Displayname" -DisplayName "$Displayname" -SamAccountName $SAM -UserPrincipalName $UPN -GivenName "$UserFirstname" -Surname "$UserLastname" -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true      
}

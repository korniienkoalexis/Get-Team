function Get-Office365TeamUser { 

 
Param (
[parameter (Mandatory=$true)][string]$userName
)
 
$result = @()
$groups = Get-Team
$groups | foreach {
$groupMembersip = Get-AzureADGroupMember -ObjectId $_.groupId | where {$_.UserPrincipalName -eq $userName}
 
$group = $_.groupId
$groupname = Get-AzureADGroup -ObjectId $_.groupId | select DisplayName
 
$PSObject = [PSCustomObject]@{
TeamsGroupName=$groupname.DisplayName
UPN=$groupMembersip.UserPrincipalName
}
$result+=$PSObject
}
 
return $result
}
Get-Office365TeamUser

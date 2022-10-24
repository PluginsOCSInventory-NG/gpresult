$tempFolder = "OCSPluginTemp"
$path = "C:\$tempFolder"
$xmlFile = "$path\gpresult.xml"

#First remove folder if exists
Remove-Item "$path" -Force -Recurse | Out-Null

# Create new folder to move OCS script and OCS exe
New-Item -Path "C:\" -Name "$tempFolder" -ItemType "directory" | Out-Null

GPResult /SCOPE COMPUTER /x $xmlFile /f;

#Start-Sleep -Seconds 10;

[xml]$rsop = Get-Content -Path $xmlFile;

$xml = "";

foreach ($user in $rsop.Rsop.UserResults.GPO) {
    $xml += "<GPRESULT>`n";
    $xml += "<NAME>"             + $user.Name + "</NAME>`n";
    $xml += "<RESULT>"           + "User" + "</RESULT>`n";
    $xml += "<IDENTIFIER>"       + $user.Path.Identifier.InnerXml + "</IDENTIFIER>`n";
    $xml += "<DOMAIN>"           + $user.Path.Domain.InnerXml + "</DOMAIN>`n";
    $xml += "<VERSIONDIRECTORY>" + $user.VersionDirectory + "</VERSIONDIRECTORY>`n";
    $xml += "<VERSIONSYSVOL>"    + $user.VersionSysvol + "</VERSIONSYSVOL>`n";
    $xml += "<ENABLED>"          + $user.Enabled + "</ENABLED>`n";
    $xml += "<ISVALID>"          + $user.IsValid + "</ISVALID>`n";
    $xml += "<FILTERALLOWED>"    + $user.FilterAllowed + "</FILTERALLOWED>`n";
    $xml += "<ACCESSDENIED>"     + $user.AccessDenied + "</ACCESSDENIED>`n";
    $xml += "<SOMPATH>"          + $user.Link.SOMPath + "</SOMPATH>`n";
    $xml += "<SOMORDER>"         + $user.Link.SOMOrder + "</SOMORDER>`n";
    $xml += "<APPLIEDORDER>"     + $user.Link.AppliedOrder + "</APPLIEDORDER>`n";
    $xml += "<LINKORDER>"        + $user.Link.LinkOrder + "</LINKORDER>`n";
    $xml += "<LINKENABLED>"      + $user.Link.Enabled + "</LINKENABLED>`n";
    $xml += "<NOOVERRIDE>"       + $user.Link.NoOverride + "</NOOVERRIDE>`n";
    $xml += "<SECURITYFILTER>"   + $user.SecurityFilter + "</SECURITYFILTER>`n";
    $xml += "<EXTENSIONNAME>"    + $user.ExtensionName + "</EXTENSIONNAME>`n";
    $xml += "</GPRESULT>`n";
}

foreach ($computer in $rsop.Rsop.ComputerResults.GPO) {
    $xml += "<GPRESULT>`n";
    $xml += "<NAME>"             + $computer.Name + "</NAME>`n";
    $xml += "<RESULT>"             + "Computer" + "</RESULT>`n";
    $xml += "<IDENTIFIER>"       + $computer.Path.Identifier.InnerXml + "</IDENTIFIER>`n";
    $xml += "<DOMAIN>"           + $computer.Path.Domain.InnerXml + "</DOMAIN>`n";
    $xml += "<VERSIONDIRECTORY>" + $computer.VersionDirectory + "</VERSIONDIRECTORY>`n";
    $xml += "<VERSIONSYSVOL>"    + $computer.VersionSysvol + "</VERSIONSYSVOL>`n";
    $xml += "<ENABLED>"          + $computer.Enabled + "</ENABLED>`n";
    $xml += "<ISVALID>"          + $computer.IsValid + "</ISVALID>`n";
    $xml += "<FILTERALLOWED>"    + $computer.FilterAllowed + "</FILTERALLOWED>`n";
    $xml += "<ACCESSDENIED>"     + $computer.AccessDenied + "</ACCESSDENIED>`n";
    $xml += "<SOMPATH>"          + $computer.Link.SOMPath + "</SOMPATH>`n";
    $xml += "<SOMORDER>"         + $computer.Link.SOMOrder + "</SOMORDER>`n";
    $xml += "<APPLIEDORDER>"     + $computer.Link.AppliedOrder + "</APPLIEDORDER>`n";
    $xml += "<LINKORDER>"        + $computer.Link.LinkOrder + "</LINKORDER>`n";
    $xml += "<LINKENABLED>"      + $computer.Link.Enabled + "</LINKENABLED>`n";
    $xml += "<NOOVERRIDE>"       + $computer.Link.NoOverride + "</NOOVERRIDE>`n";
    $xml += "<SECURITYFILTER>"   + $computer.SecurityFilter + "</SECURITYFILTER>`n";
    $xml += "<EXTENSIONNAME>"    + $computer.ExtensionName + "</EXTENSIONNAME>`n";
    $xml += "</GPRESULT>`n";
}

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::WriteLine($xml)

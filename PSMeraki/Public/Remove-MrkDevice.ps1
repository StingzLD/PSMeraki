function Remove-MrkDevice {
    <#
    .SYNOPSIS
    Removes a device from a network.
    .DESCRIPTION
    Removes a device from a network, but leaves it in the inventory
    .EXAMPLE
    Remove-MrkDevice -Networkid X_111122223639801111 -Serial Q2XX-XXXX-XXXX
    .PARAMETER networkId
    id of a network (get-MrkNetworks)[0].id
    .PARAMETER serial
    Serial number of the physical device that is removed from the network.
    alias set as 'SerialNr' based on original restapi module
    .NOTES
    2do: parameter 'serial' should be a version dependent parameter set. 
    #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)][ValidateNotNullOrEmpty()][String]$Networkid,
        [Parameter()][ValidateNotNullOrEmpty()][Alias("serialNr")][String]$serial
    )
    if ($mrkApiVersion -eq 'v0'){
        Invoke-MrkRestMethod -Method POST -ResourceID "/networks/$networkId/devices/$serial/remove"
    } Else { #mrkApiVersion v1
        Invoke-MrkRestMethod -Method POST -ResourceID "/networks/$networkId/devices/remove"
    }
}
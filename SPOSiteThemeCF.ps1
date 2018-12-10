
function AddTheme {
    $themeName = Read-Host "Name your theme `n (Users will be able to see this when selecting Change Look)"

    #create your own pallet at: 
    # https://developer.microsoft.com/en-us/fabric#/styles/themegenerator

    $themepalette = @{
        "themePrimary"         = "#e20074" ;
        "themeLighterAlt"      = "#fef4f9" ;
        "themeLighter"         = "#fbd2e7" ;
        "themeLight"           = "#f7add3" ;
        "themeTertiary"        = "#ee5fa9" ;
        "themeSecondary"       = "#e61c84" ;
        "themeDarkAlt"         = "#cc006a" ;
        "themeDark"            = "#ac0059" ;
        "themeDarker"          = "#7f0042" ;
        "neutralLighterAlt"    = "#f8f8f8" ;
        "neutralLighter"       = "#f4f4f4" ;
        "neutralLight"         = "#eaeaea" ;
        "neutralQuaternaryAlt" = "#dadada" ;
        "neutralQuaternary"    = "#d0d0d0" ;
        "neutralTertiaryAlt"   = "#c8c8c8" ;
        "neutralTertiary"      = "#c2c2c2" ;
        "neutralSecondary"     = "#858585" ;
        "neutralPrimaryAlt"    = "#4b4b4b" ;
        "neutralPrimary"       = "#333" ;
        "neutralDark"          = "#272727" ;
        "black"                = "#1d1d1d" ;
        "white"                = "#fff" ;
        "primaryText"          = "#333" ;

    }
    Add-SPOTheme -Identity $themeName -Palette $themepalette -IsInverted $false  
    Write-Host "Succefully added theme. Hit enter to exit" -ForegroundColor Green
}

function RemoveTheme {
    param($theme)
    
    try {
        Remove-SPOTheme -Name $theme 
        Write-Host "Theme:" $theme " has been removed" -ForegroundColor Green
        exit
    }
    catch {
        Write-Host $_.Exception.Message -ForegroundColor Red

    }
    
}
function HandleRemoveTheme {
    Write-Host "Retrieving List of themes..."
    $Themes = Get-SPOTheme | ConvertTo-Json    
    $Themes    

    $theme = Read-Host "Please type name of theme you would like to remove" 
    $theme 
    RemoveTheme($theme)

}


function ThemeControl {
    param([String] $Action)

    if ($Action -eq "Add") {
        AddTheme
    }
    elseif ($Action -eq "Remove") {
        HandleRemoveTheme
    }
    elseif ($Action -eq "List") {
        ThemeControl
    }
    else {
        Read-Host "Invalid selected"
      
    }
    
}
function SelectThemeAction {
    $action = Read-Host "Would you like to [Add], [Remove] or [View] a site theme?"
    Switch ($action) {
        Add {$selectedAction = "Add"}
        Remove {$selectedAction = "Remove"}
        List {$selectedAction = "List"}
    }
    ThemeControl($selectedAction)
}

function ConnectToTenant {
    $siteName = Read-Host "Please provide site url Example: `n <https://mydomain-admin.sharepoint.com>"

    $cred = [System.Net.CredentialCache]::DefaultCredentials
    [System.Net.WebRequest]::DefaultWebProxy.Credentials = $cred

    try {
        Connect-SPOService -Url  $siteName 
        SelectThemeAction

    }
    catch {
        Write-Host $_.Exception.Message -ForegroundColor Red
        

    }
   
  

}

ConnectToTenant 



  

# SPOThemeControlFlow
Add, remove or add a SharePoint site theme. 

Got to https://developer.microsoft.com/en-us/fabric#/styles/themegenerator

Set your colors. Select PowerShell as your Output. 

Replace value for $themepallet variable in SPSiteThemeCF.ps1
   

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

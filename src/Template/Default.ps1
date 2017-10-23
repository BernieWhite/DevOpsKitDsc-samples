
# Define a default documentation template
document Default {
    
    Yaml @{
        title = $InstanceName
    }

    Title $InstanceName

    Section Heading {

        List {
            'This is content'
        }
        
        $InputObject.ResourceType.File | Table -Property DestinationPath,Type;
    }

    # Add an 'Installed features' section in the document
    Section 'Installed features' {

        # Add a comment
        'The following Windows features have been installed.'

        # Generate a table of Windows Features
        $InputObject.ResourceType.WindowsFeature | Table -Property Name,Ensure;
    }
}
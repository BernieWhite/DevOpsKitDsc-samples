
# Define a default configuration
configuration Default {

    Import-DscResource -ModuleName PSDesiredStateConfiguration;

    node $AllNodes.NodeName {

        if ($Node.Role -contains 'Web') {

            # Install features

            WindowsFeature WebServerRole {
                Name = "Web-Server"
                Ensure = "Present"
            }
        
            WindowsFeature WebManagementService {
                Name = "Web-Mgmt-Service"
                Ensure = "Present"
            }
        
            WindowsFeature ASPNet45 {
                Name = "Web-Asp-Net45"
                Ensure = "Present"
            }
        
            WindowsFeature WebManagementConsole {
                Name = "Web-Mgmt-Console"
                Ensure = "Present"
            }
        
            WindowsFeature HTTPRedirection {
                Name = "Web-Http-Redirect"
                Ensure = "Present"
            }
        
            WindowsFeature CustomLogging {
                Name = "Web-Custom-Logging"
                Ensure = "Present"
            }
        
            WindowsFeature LogginTools {
                Name = "Web-Log-Libraries"
                Ensure = "Present"
            }
        
            WindowsFeature RequestMonitor {
                Name = "Web-Request-Monitor"
                Ensure = "Present"
            }
        
            WindowsFeature Tracing {
                Name = "Web-Http-Tracing"
                Ensure = "Present"
            }
        
            WindowsFeature BasicAuthentication {
                Name = "Web-Basic-Auth"
                Ensure = "Present"
            }
        
            WindowsFeature WindowsAuthentication {
                Name = "Web-Windows-Auth"
                Ensure = "Present"
            }
        
            WindowsFeature ApplicationInitialization {
                Name = "Web-AppInit"
                Ensure = "Present"
            }

            # Install Web Deploy

            Package InstallWebDeploy {
                Ensure = "Present"  
                Path  = 'https://download.microsoft.com/download/0/1/D/01DC28EA-638C-4A22-A57B-4CEF97755C6C/WebDeploy_amd64_en-US.msi'
                Name = "Microsoft Web Deploy 3.6"
                ProductId = "{ED4CC1E5-043E-4157-8452-B5E533FE2BA1}"
                Arguments = "ADDLOCAL=ALL"
            }
        
            Service StartWebDeploy {                    
                Name = "WMSVC"
                StartupType = "Automatic"
                State = "Running"
                DependsOn = "[Package]InstallWebDeploy"
            }
        }
    }
}

#Remove Cortana
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage
Get-appxpackage -allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage

$appsToUninstall = @(
    "Microsoft.3DBuilder",             # Aplicativo para criar modelos 3D.
    "Microsoft.BingWeather",           # Aplicativo de previsão do tempo com dados fornecidos pelo Bing.
    "Microsoft.DesktopAppInstaller",   # Instalador de aplicativos para instalar aplicativos da Microsoft Store.
    "Microsoft.Microsoft3DViewer",     # Visualizador de modelos 3D.
    "Microsoft.GetHelp",               # Aplicativo de suporte para obter ajuda e solucionar problemas no Windows.
    "Microsoft.Getstarted",            # Aplicativo que fornece informações sobre como começar a usar o Windows.
    "Microsoft.Messaging",             # Aplicativo para enviar mensagens de texto e multimídia.
    "Microsoft.MicrosoftOfficeHub",    # Hub para acessar aplicativos do Microsoft Office e documentos.
    "Microsoft.MicrosoftSolitaireCollection",  # Coleção de jogos de paciência.
    "Microsoft.MixedReality.Portal",   # Aplicativo relacionado à realidade mista.
    "Microsoft.Office.OneNote",        # Aplicativo de anotações digitais.
    "Microsoft.OneConnect",            # Aplicativo para conectar dispositivos e serviços.
    "Microsoft.People",                # Aplicativo de gerenciamento de contatos.
    "Microsoft.Print3D",               # Aplicativo para preparar e imprimir modelos 3D.
    "Microsoft.SkypeApp",              # Aplicativo de mensagens e chamadas de voz e vídeo.
    "Microsoft.StorePurchaseApp",      # Aplicativo relacionado a compras na Microsoft Store.
    "Microsoft.Wallet",                # Aplicativo para armazenar informações de pagamento e fidelidade.
    "microsoft.windowscommunicationsapps",  # Aplicativos de comunicações do Windows.
    "Microsoft.WindowsFeedbackHub",    # Aplicativo para enviar feedback sobre o Windows.
    "Microsoft.WindowsMaps",           # Aplicativo de mapas.
    "Microsoft.WindowsSoundRecorder",  # Aplicativo para gravar áudio.
    "Microsoft.XboxApp",               # Aplicativo relacionado ao Xbox para jogos e interações sociais.
    "Microsoft.XboxGameOverlay",       # Sobreposição de jogos do Xbox.
    "Microsoft.XboxIdentityProvider",  # Fornecedor de identidade do Xbox para autenticação.
    "Microsoft.XboxGamingOverlay",     # Outra sobreposição de jogos do Xbox.
    "Microsoft.YourPhone",             # Aplicativo para conectar o telefone Android ao Windows para integração e sincronização.
    "Microsoft.XboxSpeechToTextOverlay" # Sobreposição de conversão de fala em texto do Xbox.

)

$servicesToDisable = @(
    "DiagTrack",                # Serviço de rastreamento de diagnóstico
    "wuauserv",                 # Windows Update
    "wercplsupport",            # Relatório de erros do Windows
    "RemoteRegistry",           # Registro remoto
    "MapsBroker",               # Broker de mapas
    "Themes",                   # Temas
    "RasMan",                   # Gerenciador de conexão de acesso remoto
    "TabletInputService",       # Serviço de entrada de tablet
    "WerSvc",                   # Serviço de relatório de erros do Windows
    "WSearch",                  # Indexação do Windows Search
    "BcastDVRUserService",      # Serviço de dvr de transmissão
    "PrintWorkflowUserSvc",     # Serviço de fluxo de trabalho de impressão
    "WpnUserService",           # Serviço de notificação do Windows
    "DeviceAssociationService", # Serviço de associação de dispositivo
    "RetailDemo",               # Demonstração de varejo
    "Connected User Experiences and Telemetry", # Experiências do usuário conectado e telemetria
    "BITS",                     # Serviço de Transferência Inteligente de Fundo
    "WbioSrvc",                 # Serviço de reconhecimento de impressão digital do Windows
    "msiserver"                 # Instalador do Windows
)



foreach ($app in $appsToUninstall) {
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq $app | Remove-AppxProvisionedPackage -Online
}

foreach ($service in $servicesToDisable) {
    Stop-Service -Name $service -Force
    Set-Service -Name $service -StartupType Disabled
}

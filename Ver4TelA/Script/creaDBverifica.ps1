$ErrorActionPreference = "SilentlyContinue"

#Importa la DLL che permette a .NET di collegarsi via ADO a MySQL
Unblock-File -Path ".\Script\MySql.Data.dll"
Add-Type -Path ".\Script\MySql.Data.dll"

#Stabilisco e formatto il path corrente per l'importazione dei CSV nel file .sql
$currentPath = Get-Location
$currentPathMySql = $currentPath.Path+"\DatiCSV"
$currentPathMySql = $currentPathMySql.Replace("\","/")


# Chiedi all'utente i dati di accesso al server locale di MySQL
$port = Read-Host "Inserisci la porta su cui MySQL e' in ascolto (es.: 3306 o 3307)"
$username = Read-Host "Inserisci il nome utente per accedere a MySQL (es.: root)"
$password = Read-Host "Inserisci la password per accedere a MySQL con l'utente ${username}"

# Impostazioni per la connessione al server MySQL
$server = "localhost"


# Percorso del file .sql da eseguire
$sqlFilePath = ".\Script\Command.sql"

# Funzione per eseguire un file .sql
function EseguiFileSQL {
    param (
        [string]$server,
        [string]$port,
        [string]$username,
        [string]$password,
        [string]$sqlFilePath
    )

    # Connessione al server MySQL
    $connectionString = "server=$server;port=$port;uid=$username;pwd=$password;"
    $connection = New-Object -TypeName MySql.Data.MySqlClient.MySqlConnection
    $connection.ConnectionString = $connectionString

    try {
        $connection.Open()

        # Lettura del contenuto del file SQL
        $sqlContent = Get-Content $sqlFilePath -Raw

        # Sostituisci il segnaposto con il percorso assoluto dello script
        $sqlContent = $sqlContent -replace '%currentPathMySql%', $currentPathMySql

        # Esecuzione del comando SQL per l'importazione
        $command = $connection.CreateCommand()
        $command.CommandText = $sqlContent
        $command.ExecuteNonQuery()

        Write-Host "File SQL eseguito con successo. Database creato e dati importati."
    } catch {
        Write-Host "Errore durante l'esecuzione del file SQL: $_"
    } finally {
        $connection.Close()
    }
}

# Chiamata alla funzione per eseguire il file .sql
EseguiFileSQL -server $server -port $port -username $username -password $password -sqlFilePath $sqlFilePath

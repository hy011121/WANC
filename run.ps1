Write-Host "
WANC (WhatsApp Number Checker) is a simple tool for validating 
WhatsApp numbers via API. It handles empty inputs, processes API 
responses, and provides clear results on number validity.
github:https://github.com/hy011121/WANC
" -ForegroundColor Cyan
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
$nomor = Read-Host -Prompt "No"
$url = "https://erohere.online/api/WhatsAppChk/"
$payload = @{
    whatsapp_post = $nomor
}
try {
    $response = Invoke-WebRequest -Uri $url -Method Post -Body $payload
    if ($response.StatusCode -eq 200) {
        $htmlContent = $response.Content
        Write-Output $htmlContent 
        
        if ($htmlContent -match '<pre>(.*?)<\/pre>') {
            $resultText = $matches[1].Trim()
            Write-Host $resultText -ForegroundColor Green
        } else {
            Write-Host "-dev; Collee01" -ForegroundColor Cyan
        }
    } else {
        Write-Host "Request failed with status code: $($response.StatusCode)" -ForegroundColor Red
    }
} catch {
    Write-Host "An error occurred: $_" -ForegroundColor Red
}

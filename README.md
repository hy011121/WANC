![touhou-anime](https://github.com/user-attachments/assets/7acfa5d6-0972-4c61-943a-42e08968098c)
# WANC (WhatsApp Number Checker)

WANC is a simple tool for validating WhatsApp numbers via API. It processes API responses, handles empty inputs, and provides clear results on the validity of WhatsApp numbers.

## Features

- **Validate WhatsApp Numbers**: Check if a WhatsApp number is valid.
- **API Integration**: Uses an API to determine number validity.
- **Clear Output**: Provides a clear message indicating whether the number is valid or not.

## Installation

There are two ways to use WANC: via cURL and PowerShell.

### Using cURL

You can use `cURL` to send a POST request to check the WhatsApp number. Here's how you can do it:

```sh
curl -X POST -d "whatsapp_post=6283842xxxxxx" https://erohere.online/api/WhatsAppChk/
```

Replace `6283842xxxxxx` with the WhatsApp number you want to check.

### Using PowerShell Script

To run the PowerShell script (`run.ps1`), follow these steps:

1. **Save the Script**: Save the following script as `run.ps1`.

```powershell
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

```


2. **Run the Script**:
   Open PowerShell and execute the script:

   ```powershell
   powershell -ExecutionPolicy Bypass -File run.ps1
   ```

   You will be prompted to enter the WhatsApp number. The script will then display whether the number is valid or not.


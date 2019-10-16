$uri = "http://localhost/api/juice-shop/testMyLuck"
$headers = @{"Host" = "juice-shop.istio-succinctly.io" }
For ($i = 1; $i -lt 51; $i++) {
    try {
        $x = (Invoke-WebRequest `
                -uri $uri `
                -Headers $headers `
                -Body '{ "fruits": ["lemon", "kiwi"] }' `
                -ErrorAction Stop `
                -UseBasicParsing);
        Write-Host "Request $($i): $([System.Text.Encoding]::ASCII.GetString($x.Content))"
    }
    catch {
        Write-Host "Request $($i): $($_.ErrorDetails.Message)"
    }
}

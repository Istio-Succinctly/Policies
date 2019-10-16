$uri = "http://localhost/api/fruits/special"
$headers = @{"Host" = "fruits.istio-succinctly.io" }
For ($i = 1; $i -lt 11; $i++) {
    $response = Invoke-WebRequest -uri $uri -Headers $headers -ErrorAction Stop
    Write-Host "Request $($i): $($response.Content)"
}

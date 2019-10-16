$uri = "http://localhost/api/fruits/special"
$headers = @{"Host" = "fruits.istio-succinctly.io" }
For ($i = 1; $i -lt 11; $i++) {
    $response = try {
        (Invoke-WebRequest -uri $uri -Headers $headers -ErrorAction Stop).BaseResponse
    }
    catch{
        $_.Exception.Response
    }

    Write-Host "Request $($i): $($response.StatusCode)"
}

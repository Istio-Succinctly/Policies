$uri = "http://localhost/api/fruits/special"
$headers = @{"Host" = "fruits.istio-succinctly.io"}
For ($i = 1; $i -lt 11; $i++) {
    For ($j = 1; $j -lt 6; $j++) {
        Write-Host "`n`nRequest $($i).$($j)"
        # Invoke request using curl
        curl localhost/api/fruits/special -H "Host: fruits.istio-succinctly.io"
        # Invoke request using PS cmdlet
        Write-Host "`n$((Invoke-WebRequest -uri $uri -Headers $headers -ErrorAction Stop).Content)"
    }

    Write-Host "`n-----"
    Start-Sleep -s 5
}

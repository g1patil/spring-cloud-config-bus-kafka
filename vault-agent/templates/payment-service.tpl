{{ with secret "secret/data/payment-service" }}{{ range $k, $v := .Data.data }}{{ $k }}={{ $v }}
{{ end }}{{ end }}

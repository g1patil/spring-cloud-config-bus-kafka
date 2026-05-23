{{ with secret "secret/data/cloud-config-client" }}{{ range $k, $v := .Data.data }}{{ $k }}={{ $v }}
{{ end }}{{ end }}

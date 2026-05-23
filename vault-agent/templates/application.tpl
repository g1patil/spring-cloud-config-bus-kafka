{{ with secret "secret/data/application" }}
version={{ .Data.metadata.version }}
updated={{ .Data.metadata.created_time }}
{{ end }}
vault {
  address = "http://vault:8200"
}

auto_auth {
  method "token_file" {
    config = {
      token_file_path = "/tmp/vault-token"
    }
  }
}

# Required by Vault Agent 1.13+ alongside auto_auth
listener "tcp" {
  address     = "0.0.0.0:8007"
  tls_disable = true
}

# Watches shared secrets -> refreshes all apps
template {
  source      = "/vault-agent/templates/application.tpl"
  destination = "/tmp/application.txt"
  command     = "wget -qO- --post-data='' --header='Content-Type: application/json' http://host.docker.internal:8081/actuator/busrefresh || true"
}

# Watches payment-service secrets -> refreshes only that app
template {
  source      = "/vault-agent/templates/payment-service.tpl"
  destination = "/tmp/payment-service.txt"
  command     = "wget -qO- --post-data='' --header='Content-Type: application/json' 'http://host.docker.internal:8081/actuator/busrefresh/payment-service:**' || true"
}

# Watches cloud-config-client secrets -> refreshes only that app
template {
  source      = "/vault-agent/templates/cloud-config-client.tpl"
  destination = "/tmp/cloud-config-client.txt"
  command     = "wget -qO- --post-data='' --header='Content-Type: application/json' 'http://host.docker.internal:8081/actuator/busrefresh/cloud-config-client:**' || true"
}

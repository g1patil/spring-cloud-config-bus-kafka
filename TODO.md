# TODO

## Vault Integration

### Done (session: 2026-05-23, branch: feat/vault)
- Added `spring-vault-core` dependency to config server (`cloud-config-server/build.gradle`)
- Reorganized config server properties into profile-specific files:
  - `application.properties` — common config (Kafka, bus, actuator)
  - `application-git.properties` — Git backend
  - `application-vault.properties` — Vault backend (KV v2, token auth via `$VAULT_TOKEN` env var)
- Added Vault dev server to `docker-compose.yml` (`hashicorp/vault:latest`, port 8200)
- Stored test secrets in local Vault:
  - `secret/data/application` — shared: `db.password`, `api.key`, `smtp.password`
  - `secret/data/cloud-config-client` — client-specific: `jwt.secret`, `external.service.api.key`, `feature.flag.enabled`
- Verified config server serves secrets from Vault when started with `--spring.profiles.active=vault`

### Next Steps
- [ ] Step 3: Activate vault profile — decide between `spring.profiles.active` in properties, startup arg, or docker-compose env var
- [ ] Configure config client to pass `X-Config-Token` header to config server
- [ ] **Security**: Config server `/cloud-config-client/default` is unauthenticated — secrets exposed without any token
  - Option A: Add Spring Security to config server (username/password for clients)
  - Option B: Pass-through token — remove static `spring.cloud.config.server.vault.token`, require `X-Config-Token` per client
  - Option C: Both (production-grade)
- [ ] Redis profile — `application-redis.properties` for config server
- [ ] Replace `token=root` with org Vault auth (use env vars, not `.zshrc`)
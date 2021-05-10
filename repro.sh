#!/bin/bash -x

vault server -dev -log-level=trace -dev-root-token-id="root"& 

sleep 2

export VAULT_ADDR='http://127.0.0.1:8200'

vault login root

vault secrets enable ad

vault write ad/config binddn=vagrant bindpass=vagrant url=ldaps://WindowsDC.hashicorp.com:10636 userdn='dc=hashicorp,dc=com' insecure_tls=true

vault write ad/library/accounting-team service_account_names=catalina@hashicorp.com,bob@hashicorp.com 

vault write -f ad/library/accounting-team/check-out  

vault write -f ad/library/accounting-team/check-out  

vault write -f ad/library/accounting-team/check-in service_account_names=bob@hashicorp.com 

vault write ad/library/accounting-team service_account_names=bob@hashicorp.com

echo "Error create new library"

vault write ad/library/supportteam service_account_names=catalina@hashicorp.com

echo "Read Status"

vault read ad/library/accounting-team/status

echo "Read Configuration"

vault read ad/library/accounting-team

vault delete ad/library/accounting-team   

echo "Read libraries"

vault list ad/library

echo "Error create new library"

vault write ad/library/supportteam service_account_names=catalina@hashicorp.com

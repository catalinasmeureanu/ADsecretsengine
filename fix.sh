
vault write ad/library/supportteam service_account_names=bob@hashicorp.com

vault write ad/library/supportteam service_account_names=catalina@hashicorp.com

vault read ad/library/supportteam/status

vault write -f ad/library/supportteam/check-in service_account_names=catalina@hashicorp.com 

vault delete ad/library/supportteam

vault write ad/library/supportteam service_account_names=catalina@hashicorp.com

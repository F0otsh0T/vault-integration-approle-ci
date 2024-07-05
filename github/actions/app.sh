#! /bin/sh

echo -e "VAULT_AUTH_APPROLE_ROLEID:" $VAULT_AUTH_APPROLE_ROLEID
echo -e "WRAPPED_TOKEN:" $WRAPPED_TOKEN
echo -e "VAULT_AUTH_APPROLE_ROLE:" $VAULT_AUTH_APPROLE_ROLE
echo -e "VAULT_AUTH_APPROLE_PATH:" $VAULT_AUTH_APPROLE_PATH
echo -e "VAULT_ADDR:" $VAULT_ADDR
echo -e "VAULT_NAMESPACE:" $VAULT_NAMESPACE
echo -e "VAULT_READ_ROLEID:" $VAULT_READ_ROLEID

which vault

VAULT_TOKEN=$WRAPPED_TOKEN vault unwrap -format=json | jq > secret_id.json
cat secret_id.json | jq -r .data.secret_id > secret_id.txt
export SECRETID=$(cat secret_id.txt)

echo -e "SECRETID:" $SECRETID

vault write -format=json auth/$VAULT_AUTH_APPROLE_PATH/login \
    role_id=$VAULT_AUTH_APPROLE_ROLEID \
    secret_id=$SECRETID | jq > login.json

cat login.json

export VAULT_TOKEN=$(cat login.json | jq -r .auth.client_token)

vault secrets list

vault kv get -format=json github/app01 | jq > secret.json

echo -e "Vault KV Get Response: $(cat secret.json)"
cat secret.json | jq -r .data.data > secret.txt
cat secret.txt >> /usr/share/nginx/html/index.html
echo -e "NGINX index.html: $(cat /usr/share/nginx/html/index.html)"
# cat /usr/share/nginx/html/index.html

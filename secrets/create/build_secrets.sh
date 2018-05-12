#!/bin/bash

while [ $# -gt 0 ]; do
  echo $1
  case "$1" in
    --env=*)
      env="${1#*=}"
      ;;
    --dc=*)
      dc="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
done
${env:="development"}
${dc:="dev-dc"}


echo "Building certificates"
./create_certs.sh --p_out="./../$env/$dc/certificates"

echo "Building encryption_keys"
./create_encrypt_keys.sh --env=$env --dc=$dc

echo "Building account credentials"
./create_account_credentials.sh --env=$env --dc=$dc

echo "Build generated folders"
mkdir -p "./../$env/$dc/generated/acl_tokens"
mkdir -p "./../$env/$dc/generated/vault_unseal_keys"
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

mkdir "./../$env/$dc/account_credentials"
cp ./templates/vault_user.json "./../$env/$dc/account_credentials/vault_user.json"
cp ./templates/docker_hub_credentials.json "./../$env/$dc/account_credentials/docker_hub_credentials.json"
cp ./templates/github_ssh_credentials.json "./../$env/$dc/account_credentials/github_ssh_credentials.json"
cp ./templates/app_folder_smb_credentials.json "./../$env/$dc/account_credentials/app_folder_smb_credentials.json"
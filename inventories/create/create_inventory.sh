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
${env:="dev-dc"}

echo "Build inventory folders"
mkdir -p "./../$env/$dc/group_vars"

cp ./templates/all "./../$env/$dc/group_vars/all"
cp ./templates/cluster "./../$env/$dc/group_vars/cluster"
cp ./templates/consul "./../$env/$dc/group_vars/consul"
cp ./templates/nomad "./../$env/$dc/group_vars/nomad"
cp ./templates/vault "./../$env/$dc/group_vars/vault"
cp ./templates/hosts.yml "./../$env/$dc/hosts.yml"
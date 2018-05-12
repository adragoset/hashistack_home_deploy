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

mkdir -p "./../$env/$dc/encryption_keys/consul"
rm "./../$env/$dc/encryption_keys/consul/acl_datacenter_master_token.json"
touch "./../$env/$dc/encryption_keys/consul/acl_datacenter_master_token.json"
rm "./../$env/$dc/encryption_keys/consul/consul_serf_key.json"
touch "./../$env/$dc/encryption_keys/consul/consul_serf_key.json"

uuid=$(uuidgen)
uuid=${uuid^^}
echo "{\"acl_datacenter_master_token\": \"$uuid\"}" > ./../$env/$dc/encryption_keys/consul/acl_datacenter_master_token.json
consul_serf_key=$(gpg --gen-random --armor 1 16)
echo "{\"consul_encrypt_key\": \"$consul_serf_key\"}" > ./../$env/$dc/encryption_keys/consul/consul_serf_key.json

mkdir -p "./../$env/$dc/encryption_keys/nomad"
rm "./../$env/$dc/encryption_keys/nomad/nomad_serf_key.json"
touch "./../$env/$dc/encryption_keys/nomad/nomad_serf_key.json"
nomad_serf_key=$(gpg --gen-random --armor 1 16)
echo "{\"nomad_encrypt_key\": \"$nomad_serf_key\"}" > ./../$env/$dc/encryption_keys/nomad/nomad_serf_key.json
#!/bin/bash

while [ $# -gt 0 ]; do
  echo $1
  case "$1" in
    --p_out=*)
      p_out="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
done

echo "Output path:$p_out"

mkdir "$p_out"

echo '{"CN":"ROOT_CA","key":{"algo":"rsa","size":2048}, "names": [{"C": "US","L": "New Orleans","O": "Intralox","OU": "DX"}]}' | cfssl gencert -initca - | cfssljson -bare "$p_out/cluster-ca"

mkdir "$p_out/nomad"

echo '{"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca="$p_out/cluster-ca.pem" -ca-key="$p_out/cluster-ca-key.pem" -profile=client - | cfssljson -bare "$p_out/nomad/nomad-cli"

mkdir "$p_out/consul"

echo '{"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca="$p_out/cluster-ca.pem" -ca-key="$p_out/cluster-ca-key.pem" -profile=client - | cfssljson -bare "$p_out/consul/consul-cli"

mkdir "$p_out/vault"

echo '{"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca="$p_out/cluster-ca.pem" -ca-key="$p_out/cluster-ca-key.pem" -profile=client - | cfssljson -bare "$p_out/vault/vault-cli"
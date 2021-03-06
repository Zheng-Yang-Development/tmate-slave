#!/bin/bash
gen_key() {
  keytype=$1
  ks="${keytype}_"
  key="keys/ssh_host_${ks}key"
  if [ ! -e "${key}" ] ; then
    ssh-keygen -t ${keytype} -f "${key}" -N ''
    return $?
  fi
}

mkdir -p keys
gen_key dsa && gen_key rsa && gen_key ecdsa || exit 1

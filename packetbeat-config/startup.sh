#!/usr/bin/env bash
set -e

RANCHER_BASEURL="rancher-metadata.rancher.internal/latest"

echo "create config packetbeat-config"
mkdir -p /usr/share/packetbeat-config

echo "Pull rancher metadata"
curl -sf ${RANCHER_BASEURL}/self/service/metadata/packetbeat-config > /usr/share/packetbeat-config/packetbeat.yml
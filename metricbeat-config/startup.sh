#!/usr/bin/env bash
set -e

RANCHER_BASEURL="rancher-metadata.rancher.internal/latest"

echo "create config metricbeat-config"
mkdir -p /usr/share/metricbeat-config

echo "Pull rancher metadata"
curl -sf ${RANCHER_BASEURL}/self/service/metadata/metricbeat-config > /usr/share/metricbeat-config/metricbeat.yml


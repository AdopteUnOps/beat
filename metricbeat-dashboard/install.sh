#!/bin/bash

CMD_IMPORT="";
ES_URL="";

if [[ -n "${SERVICE_ELASTICSEARCH_USERNAME}" ]]; then
    ES_URL=http://${SERVICE_ELASTICSEARCH_USERNAME}:${SERVICE_ELASTICSEARCH_PASSWORD}@${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT};
    echo SET ${URL}
else
    ES_URL=http://${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT};
    echo SET ${ES_URL};
fi;

if [[ "${ONLY_DASHBOARDS}" = true ]]; then
    CMD_IMPORT=" -es ${ES_URL} -only-dashboards -dir /tmp/dashboard/metricbeat"
else
    CMD_IMPORT=" -es ${ES_URL} -dir /tmp/dashboard/metricbeat"
fi;

echo replace value index-prefix by ${PREFIX_INDEX}
find /tmp/dashboard -type f -exec sed -i -e 's/${index-prefix}/'${PREFIX_INDEX}'/' {} +

echo "cmd send ${CMD_IMPORT}"
/usr/share/metricbeat/scripts/import_dashboards $CMD_IMPORT

#!/bin/sh

set -e

if [ "x${DEBUG}" == "xtrue" ] || [ "x${DEBUG}" == "x1" ]; then
  OPTS="-debug"
fi
if [[ "x${TIMEOUT}" != "x" ]]; then
  OPTS=$OPTS" -timeout ${TIMEOUT}"
fi
if [[ "x${WORKERS}" != "x" ]]; then
  OPTS=$OPTS" -workers ${WORKERS}"
fi

if [[ "x${SERVER}" != "xUNSET" ]]; then
  echo "/tsmp/phantom ${OPTS} -server ${SERVER}"
  exec /tsmp/phantom $OPTS -server $SERVER
else
  echo "ERROR: SERVER environment variable not set"
  echo "Cannot continue...."
  exit 1
fi

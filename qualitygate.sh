USERNAME=admin
PASSWORD=password
HOSTIP=172.31.89.159
KEY=${COMPONENT}

STATUS=$(curl -u "$USERNAME:$PASSWORD" "http://${HOSTIP}:9000/api/qualitygates/project_status?projectKey=${KEY}" | jq  '.projectStatus.status' | xargs)
if [ "$STATUS" == "OK" ]; then 
  exit 0
else 
  exit 1
fi

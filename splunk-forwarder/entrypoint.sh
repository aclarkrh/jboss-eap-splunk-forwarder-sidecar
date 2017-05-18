#!/bin/sh  

echo "_meta = ocp-namespace::$OCP_NAMESPACE" >> /opt/splunkforwarder/etc/system/local/inputs.conf

echo "Pushing from $SPLUNK_MONITOR_LOCN to $SPLUNK_SERVER" 

/opt/splunkforwarder/bin/splunk start --accept-license
if [ $? -eq 0 ]
then
  echo "Successfully started splunk universal forwarder"
else
  echo "Failed to start universal forwarder " >&2
  exit 1
fi

/opt/splunkforwarder/bin/splunk add forward-server $SPLUNK_SERVER -auth $SPLUNK_USERNAME:$SPLUNK_PASSWORD
if [ $? -eq 0 ]
then
  echo "Successfully registered with splunk remote instance "
else
  echo "Failed to register to remote splunk instance " >&2
  exit 1
fi

/opt/splunkforwarder/bin/splunk add monitor $SPLUNK_MONITOR_LOCN
if [ $? -eq 0 ]
then
  echo "Successfully added monitor of $SPLUNK_MONITOR_LOCN"
else
  echo "Failed to monitor $SPLUNK_MONITOR_LOCN" >&2
  exit 1
fi

sleep infinity

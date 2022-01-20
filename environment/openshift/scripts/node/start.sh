#!/bin/bash
SCRIPT_DIR=$(dirname $0)

$SCRIPT_DIR/initialize.sh

echo "Starting indy node ..."
echo

# echo "Starting indy-node-control service ..."
# echo "/usr/bin/env python3 -O /usr/local/bin/start_node_control_tool.py ${TEST_MODE} --hold-ext ${HOLD_EXT}"
# echo
# exec /usr/bin/env python3 -O /usr/local/bin/start_node_control_tool.py ${TEST_MODE} --hold-ext ${HOLD_EXT} &
# sleep 10


echo $ips
echo ${NEW_NODE_IP_LIST}
echo "TEST ips"
myarray=(`echo ${NEW_NODE_IP_LIST} | tr ',' ' '`)
echo "My array: ${myarray[@]}"



if [[ ${NODE_NAME} == "Node1" ]]; then
    a="${myarray[0]}"
elif [[ ${NODE_NAME} == "Node2" ]]; then
    a="${myarray[1]}"
elif [[ ${NODE_NAME} == "Node3" ]]; then
    a="${myarray[2]}"
elif [[ ${NODE_NAME} == "Node4" ]]; then
    a="${myarray[3]}"
fi

echo $a
echo "Starting indy-node service ..."
echo "/usr/bin/env python3 -O /usr/local/bin/start_indy_node ${NODE_NAME} $a ${NODE_PORT} $a ${CLIENT_PORT}"

exec /usr/bin/env python3 -O /usr/local/bin/start_indy_node ${NODE_NAME} $a ${NODE_PORT} $a ${CLIENT_PORT}

# echo "Indy node started."
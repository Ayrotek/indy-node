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

if [[ ${NODE_NAME} == 'Node1' ]]; then

    NODE_IP = ${NODE_IP_LIST[1]}

elif [[ ${NODE_NAME} == 'Node2' ]]; then

    NODE_IP = ${NODE_IP_LIST[2]}

elif [[ ${NODE_NAME} == 'Node3' ]]; then

    NODE_IP = ${NODE_IP_LIST[3]}

elif [[ ${NODE_NAME} == 'Node4' ]]; then

    NODE_IP = ${NODE_IP_LIST[4]}

fi

echo "Starting indy-node service ..."
echo "/usr/bin/env python3 -O /usr/local/bin/start_indy_node ${NODE_NAME} ${NODE_IP} ${NODE_PORT} ${CLIENT_IP} ${CLIENT_PORT}"

exec /usr/bin/env python3 -O /usr/local/bin/start_indy_node ${NODE_NAME} ${NODE_IP} ${NODE_PORT} ${CLIENT_IP} ${CLIENT_PORT}

# echo "Indy node started."
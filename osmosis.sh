#!/bin/bash

RPC_URL="https://g.w.lavanet.xyz:443/gateway/osmosis/rest/eb77138b6efdccfc6fa5bcfced23c7ba/cosmos/base/tendermint/v1beta1/blocks/latest"

OUTPUT_DIR="logs"

osmosis_data=$(curl -s -H "Content-Type: application/json" -X GET "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    : > "$OUTPUT_DIR/osmosis.txt"
    echo "$osmosis_data" > "$OUTPUT_DIR/osmosis.txt"
    
    echo "osmosis data fetched and saved to $OUTPUT_DIR/osmosis.txt."
else
    echo "Failed to fetch osmosis data."
fi

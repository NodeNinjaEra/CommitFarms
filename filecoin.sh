#!/bin/bash

RPC_URL="https://g.w.lavanet.xyz:443/gateway/fvm/rpc-http/eb77138b6efdccfc6fa5bcfced23c7ba"

OUTPUT_DIR="logs"

filecoin_data=$(curl -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    : > "$OUTPUT_DIR/filecoin.txt"
    echo "$filecoin_data" >> "$OUTPUT_DIR/filecoin.txt"
    
    echo "filecoin data fetched and saved to $OUTPUT_DIR/filecoin.txt."
else
    echo "Failed to fetch filecoin data."
fi

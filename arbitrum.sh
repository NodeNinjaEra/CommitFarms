#!/bin/bash

RPC_URL="https://g.w.lavanet.xyz:443/gateway/arb1/rpc-http/eb77138b6efdccfc6fa5bcfced23c7ba"

OUTPUT_DIR="logs"

arbitrum_data=$(curl -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    : > "$OUTPUT_DIR/arbitrum.txt"
    echo "$arbitrum_data" >> "$OUTPUT_DIR/arbitrum.txt"
    
    echo "arbitrum data fetched and saved to $OUTPUT_DIR/arbitrum.txt."
else
    echo "Failed to fetch arbitrum data."
fi

#!/bin/bash

RPC_URL="https://g.w.lavanet.xyz:443/gateway/eth/rpc-http/eb77138b6efdccfc6fa5bcfced23c7ba"

OUTPUT_DIR="logs"

ethereum_data=$(curl -s -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    : > "$OUTPUT_DIR/ethereum.txt"
    echo "$ethereum_data" >> "$OUTPUT_DIR/ethereum.txt"
    
    echo "Ethereum data fetched and saved to $OUTPUT_DIR/ethereum.txt."
else
    echo "Failed to fetch Ethereum data."
fi

#!/bin/bash

RPC_URL="https://g.w.lavanet.xyz:443/gateway/fuse/rpc-http/eb77138b6efdccfc6fa5bcfced23c7ba"

OUTPUT_DIR="logs"

fuse_data=$(curl -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    : > "$OUTPUT_DIR/fuse.txt"
    echo "$fuse_data" >> "$OUTPUT_DIR/fuse.txt"
    
    echo "fuse data fetched and saved to $OUTPUT_DIR/fuse.txt."
else
    echo "Failed to fetch fuse data."
fi

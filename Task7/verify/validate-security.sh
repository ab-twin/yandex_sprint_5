#!/bin/bash

echo "Testing secure manifests..."
echo "==========================="

# Test secure pods
for file in secure-manifests/*.yaml; do
    echo "Testing $(basename $file):"
    kubectl apply -f "$file" 2>&1 | grep "created" && echo "Successfully created" || echo "Failed to create"
    echo ""
done

echo "Secure manifest test completed!"
#!/bin/bash

echo "Testing admission controllers..."
echo "================================"

# Test privileged pod
echo "1. Testing privileged pod:"
kubectl apply -f insecure-manifests/01-privileged-pod.yaml 2>&1 | grep -E "(created|forbidden)" || echo "Privileged pod correctly blocked"

# Test hostPath pod
echo -e "\n2. Testing hostPath pod:"
kubectl apply -f insecure-manifests/02-hostpath-pod.yaml 2>&1 | grep -E "(created|forbidden)" || echo "HostPath pod correctly blocked"

# Test root user pod
echo -e "\n3. Testing root user pod:"
kubectl apply -f insecure-manifests/03-root-user-pod.yaml 2>&1 | grep -E "(created|forbidden)" || echo "Root user pod correctly blocked"

echo -e "\nAdmission controller test completed!"
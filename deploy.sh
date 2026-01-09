#!/bin/bash
# File: apply-all-k8s.sh
# Description: Apply all Kubernetes manifests in the k8s/ folder recursively

set -e  # stop on first error

ROOT_DIR="./k8s"

echo "Applying all Kubernetes manifests in $ROOT_DIR recursively..."

# find all .yaml and .yml files and apply them
find "$ROOT_DIR" -type f \( -name "*.yaml" -o -name "*.yml" \) | sort | while read file; do
    echo "Applying $file..."
    kubectl apply -f "$file"
done

echo "All manifests have been applied."

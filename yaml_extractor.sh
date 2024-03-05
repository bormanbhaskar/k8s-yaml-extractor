#!/bin/bash

# Prompt for namespaces (comma-separated)
read -p "Enter the name of the namespaces for which you wish to extract the yaml files(comma-separated): " NAMESPACE_INPUT

# Split comma-separated namespaces into an array
IFS=',' read -ra NAMESPACES <<< "$NAMESPACE_INPUT"

# Iterate over each namespace
for NAMESPACE in "${NAMESPACES[@]}"; do
    # Create a directory for the namespace to store YAML files
    OUTPUT_DIRECTORY="$NAMESPACE/pod_yaml_files"
    mkdir -p "$OUTPUT_DIRECTORY"

    # Retrieve the list of pods in the namespace
    kubectl get pods -n "$NAMESPACE" --output=name | while read -r pod; do
        # Extract the pod name
        pod_name=$(echo "$pod" | cut -d'/' -f2)
        # Get the YAML configuration of the pod and save it into a text file
        kubectl get pod "$pod_name" -n "$NAMESPACE" -o yaml > "$OUTPUT_DIRECTORY/$pod_name.yaml"
        echo "YAML configuration for pod $pod_name saved to $OUTPUT_DIRECTORY/$pod_name.yaml"
    done
done

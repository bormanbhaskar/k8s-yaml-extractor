# k8s-yaml-extractor
This bash script will extract the pods specification file into yaml format.

This script can be useful when you have multiple kubernetes pods running under multiple namespaces. This script will extract all the pod's specification files into yaml format and store them inside a directory named with the namespace.

**Uses:**

1. Copy the yaml_extractor.sh file into the target machine
2. Run chmod +x yaml_extractor.sh
3. ./yaml_extractor.sh
4. Enter the namespaces in comma-separated format without any space in between

Note: Make sure the system has kubectl/kubeconfig preconfigured to make this script work.

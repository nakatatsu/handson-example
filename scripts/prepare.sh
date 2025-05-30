#!/usr/bin/env bash

set -euo pipefail

module_name="$1"

if [ -z "$module_name" ]; then
read -p "Please enter the module_name: " module_name
fi

output="./$module_name"

mkdir -p $output
echo "# ${module_name} Requirements" > $output/README.md
touch $output/main.tf
touch $output/outputs.tf
touch $output/variables.tf
touch $output/specification.yaml
touch $output/terraform.tfvars.json
cp helpers/test_terraform.tf $output/terraform.tf || true

echo "Skeleton prepared at $output."



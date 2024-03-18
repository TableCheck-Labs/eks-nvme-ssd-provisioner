#!/bin/bash

while true; do
  echo "--- Starting! ---"

  ./eks-nvme-ssd-provisioner.sh
  ./link-nvme-dir.sh

  echo "--- Done! ---"

  sleep 3600
done
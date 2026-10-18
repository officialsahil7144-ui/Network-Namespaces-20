#!/usr/bin/env bash
set -u

echo "Network Namespace Inspection"
echo "----------------------------"

echo
echo "Current network namespace:"
readlink /proc/self/ns/net

echo
echo "Current process namespaces:"
lsns -t net 2>/dev/null || echo "Namespace listing is unavailable."

echo
echo "Container environment:"
if [[ -f /.dockerenv ]]; then
    echo "Running inside a Docker container."
elif grep -qi microsoft /proc/version 2>/dev/null; then
    echo "Running inside WSL."
else
    echo "No Docker or WSL marker detected."
fi

echo
echo "Network interfaces:"
ip -brief link || true

echo
echo "Namespace inspection completed."

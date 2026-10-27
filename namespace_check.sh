#!/usr/bin/env bash 
echo "Current network namespace:" 
readlink /proc/$$/ns/net 
echo 
echo "Container indicators:" 
if [[ -f /.dockerenv ]]; then 
  echo "Docker container marker found" 
else 
  echo "No /.dockerenv marker found (this does not prove the host is not containerized)" 
fi 
echo 
echo "Namespace-aware process listing:" 
ps -eo pid,comm | head -n 8 
echo 
echo "Optional Docker check:" 
if command -v docker >/dev/null 2>&1; then docker --version; else echo "Docker CLI not installed"; fi 

#!/bin/bash

echo "Starting Crafty Controller..."
cd /workspaces/mincrT2/dockerr

docker start crafty 2>/dev/null || docker run -d --name crafty \
  -v /workspaces/mincrT2/dockerr/crafty-data:/crafty/data \
  -v /workspaces/mincrT2/dockerr/minecraft-data:/crafty/servers \
  -p 8443:8443 \
  -p 25565:25565 \
  -e TZ=Etc/UTC \
  -e CRAFTY_HOST=0.0.0.0 \
  registry.gitlab.com/crafty-controller/crafty-4:latest

echo "✅ Crafty Controller started."

echo "🔎 Zerotier network interface IP(s):"
ip -4 addr show | grep zt
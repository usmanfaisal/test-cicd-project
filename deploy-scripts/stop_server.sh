#!/bin/bash
isExistApp=pgrep nginx
if [[ -n $isExistApp ]]; then
systemctl stop nginx.service
fi

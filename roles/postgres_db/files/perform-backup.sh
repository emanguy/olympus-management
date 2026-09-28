#!/usr/bin/env bash

rm /backups/postgres/*
pg_basebackup -D /backups/postgres/ -F tar -z -P -U emanguy -h 127.0.0.1
echo "Backup complete."

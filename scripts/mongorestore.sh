#!/bin/bash
set -e

BACKUPS_DIR=backup_mongo_app
BACKUPS_SUB_DIR=$(date +%Y_%m_%d)
BACKUP_FILE_PATH=""

DB=test

for entry in "$HOME/$BACKUPS_DIR/$BACKUPS_SUB_DIR"/*
do
  BACKUP_FILE_PATH="$entry"
done

echo "Restoring MongoDB : $DB"

mongorestore --gzip --archive="$BACKUP_FILE_PATH" 

echo "Restore completed."

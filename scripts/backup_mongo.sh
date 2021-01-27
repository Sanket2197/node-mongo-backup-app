#!/bin/bash
set -e

BACKUPS_DIR=backup_mongo_app
BACKUPS_SUB_DIR=$(date +%Y_%m_%d_%H_%M_%S)

DB=test

echo "Backing up MongoDB : $DB"

echo "Creating backup directory"
mkdir -p $HOME/$BACKUPS_DIR/$BACKUPS_SUB_DIR

mongodump --db $DB --gzip --out $HOME/$BACKUPS_DIR/$BACKUPS_SUB_DIR/

zip -r $HOME/$BACKUPS_DIR/$BACKUPS_SUB_DIR.zip $HOME/$BACKUPS_DIR/$BACKUPS_SUB_DIR/

rm -rf $HOME/$BACKUPS_DIR/$BACKUPS_SUB_DIR/

echo "Backup completed."

#!/bin/bash
set -e

BACKUPS_DIR=backup_mongo_app
BACKUPS_SUB_DIR=$(date +%Y_%m_%d)
BACKUPS_FILE=$(date +%Y_%m_%d_%H_%M_%S).gz

DB=test

echo "Backing up MongoDB : $DB"

echo "Creating backup directory"
mkdir -p $HOME/$BACKUPS_DIR/$BACKUPS_SUB_DIR/

mongodump --db $DB --gzip --archive=$HOME/$BACKUPS_DIR/$BACKUPS_SUB_DIR/$BACKUPS_FILE


echo "Backup completed."

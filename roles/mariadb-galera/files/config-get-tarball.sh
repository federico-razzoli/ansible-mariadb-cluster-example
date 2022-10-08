#!/bin/bash

# URL to download the tarball
TARBALL_SOURCE=https://downloads.percona.com/downloads/Percona-XtraDB-Cluster-57/Percona-XtraDB-Cluster-5.7.39-31.61/binary/tarball/Percona-XtraDB-Cluster-5.7.39-rel42-61.1.Linux.x86_64.glibc2.12.tar.gz
# Directory where the tarball will be placed
TARGET_DIR=/usr/local
# Name of the tarball once downloaded
TARGET_NAME=mysql.tar.gz
# Once the tarball content is extracted,
# the main dir will be renamed
EXTRACTED_DIR_NEW_NAME=mysql
# Tarball SH256
EXPECTED_SHA256='b9f577ce7630feadf67e94e3f5d7e779255b73928853f22985b5e785642d607e'


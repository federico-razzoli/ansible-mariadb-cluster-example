#!/bin/bash

# URL to download the tarball
TARBALL_SOURCE=https://www.percona.com/downloads/Percona-XtraDB-Cluster-57/Percona-XtraDB-Cluster-5.7.31-31.45-2/binary/tarball/Percona-XtraDB-Cluster-5.7.31-rel34-43.2.Linux.x86_64.glibc2.12.tar.gz
# Directory where the tarball will be placed
TARGET_DIR=/usr/local
# Name of the tarball once downloaded
TARGET_NAME=mysql.tar.gz
# Once the tarball content is extracted,
# the main dir will be renamed
EXTRACTED_DIR_NEW_NAME=mysql
# Tarball SH256
EXPECTED_SHA256='6dc870df0c533d9df2a3ebd1175f37d39548250bf5f8b9bc8c9f860a95d56255'


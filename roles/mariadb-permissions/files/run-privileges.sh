#!/bin/bash

# Run SQL scripts to create the necessary privileges in MariaDB.
# To make debug possible in case of problems,
# we create a file with all the SQL statements that will be executed,
# in the actual order. We also create a file with the output of the scripts.


# Permissions for relevant host groups are written here
GROUP_FILES_PATH='/var/mariadb-permissions/groups/*.sql'
# Permissions for this host are written here
HOST_FILE_PATH='/var/mariadb-permissions/hosts/*.sql'
# Group and host permissions are merged here.
# This file will be passed to mysql cli.
RUN_FILE='/var/mariadb-permissions/run.sql'
# The ourput of mysql executing RUN_FILE is redirected to:
OUT_FILE='/var/mariadb-permissions/out'


echo '' > $RUN_FILE
chmod u+x $RUN_FILE

SOURCE_FILE_COUNT=$( ls -1 $GROUP_FILES_PATH | wc --lines )
echo "Merging $SOURCE_FILE_COUNT group files into $RUN_FILE"

# before copying, check if files exist
cat $GROUP_FILES_PATH > /dev/null 2>&1
r=$?
if [ "$r" -eq 0 ];
then
    cat /var/mariadb-permissions/groups/*.sql  >> $RUN_FILE
    r=$?

    if [ "$r" -ne 0 ];
    then
    	echo 'ABORT: Could not write file'
    	exit 1
    fi
fi

# only the current host script is supposed to be here
# before copying, check if file exists
cat $HOST_FILE_PATH > /dev/null 2>&1
r=$?
if [ "$r" -eq 0 ];
then
	echo "Appending host file to $RUN_FILE"
    cat $HOST_FILE_PATH  >> $RUN_FILE
else
	echo 'No host file'
fi

/usr/local/mysql/bin/mysql --show-warnings < $RUN_FILE >> $OUT_FILE
r=$?

echo "mysql exit code: $r"
exit $?


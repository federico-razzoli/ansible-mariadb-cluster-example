#!/bin/bash


# Download a tarball unles it is already there and its checksum matches.
# If the tarball is downloaded but the checksum doesn't match, it is deleted.
# If the checksum matches, the tarball is then uncompressed to the
# desired path.
# Return code is:
#   - 0    if the tarball exists and is untouched
#   - 100  if the tarball is successfully downloaded and unpacked
#   - other codes mean failure


script_full_path=$(dirname "$0")
source $script_full_path/config-get-tarball.sh


local_file=$TARGET_DIR/$TARGET_NAME


# If the tarball exists and matches expected checksum, do nothing.
# If it doesn't match, delete it and proceed.
if [ -f $local_file ];
then
    real_sha356=$( sha256sum -b $local_file | awk '{print $1}' )
    if [ $real_sha356 == $EXPECTED_SHA256 ];
    then
        echo 'Tarball already in place. Terminating'
        exit 0
    else
        echo 'A tarball already exists, but the checksum does not match. Deleting it'
        rm $local_file
    fi
fi

# download file into desired path
wget $TARBALL_SOURCE -O $local_file

# abort if checksum doesn't match
real_sha356=$( sha256sum -b $local_file | awk '{print $1}' )
if [ "$real_sha356" != "$EXPECTED_SHA256" ];
then
    echo 'ABORT: SHA256 does not match. Deleting file'
    rm $local_file
    exit 1
fi

# unpack tarball
target_file=$TARGET_DIR/$TARGET_NAME
rm -Rf $target_file/*
echo "Unpacking $target_file into $TARGET_DIR"
tar xfvz $target_file -C $TARGET_DIR

# rename the main dir
old_dir=$( tar --list -f $target_file | head -1 )
echo "Moving $TARGET_DIR/$old_dir to $TARGET_DIR/$EXTRACTED_DIR_NEW_NAME"
rm -Rf $TARGET_DIR/$EXTRACTED_DIR_NEW_NAME
mv $TARGET_DIR/$old_dir $TARGET_DIR/$EXTRACTED_DIR_NEW_NAME

exit 100



# Encrypt_file
-You need the package cryptsetup (only for linux)-

CreateLuksFile.sh - Create a file encrypted with luks and it asks ir you want to formats it as ext4
OpenLuksFile.sh - decrypts the file, create a directoy and mounts the file to it
CloseLuksFile.sh - close the file and deletes the directory created

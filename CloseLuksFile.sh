
## Asks for the file name
read -p "What is the name of the file?" FNAME
echo ""
sudo umount directory-$FNAME
sudo cryptsetup close $FNAME
rm -r directory-$FNAME/
echo "-----------------------------"
echo "$FNAME Unmounted and directory deleted"
echo "-----------------------------"
echo ""


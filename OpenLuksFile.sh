
## Asks for the file name
read -p "What is the name of the file?" FNAME
echo ""
sudo cryptsetup open --type luks2 $FNAME $FNAME
mkdir directory-$FNAME 
sudo mount /dev/mapper/$FNAME directory-$FNAME
echo "-----------------------------"
echo "Mounted in the $FNAME directory"
echo "-----------------------------"
echo ""


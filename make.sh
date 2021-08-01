zip -9 -r game.love .
cat /usr/bin/love game.love > game.appimage
rm game.love
chmod +x game.appimage
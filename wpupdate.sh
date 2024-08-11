if [ $# -eq 0 ] 
	then printf "\e[7mErr: No Path Included\e[m";
	return 1;
fi
file=$1
extension="${file##*.}"
if [ $extension != "png" ]
then 
	echo "Converting $file to png...";
	magick $file ~/.config/current-wp.png;
	else cp $1 ~/.config/current-wp.png;
fi
echo "Replaced ~/.config/current-wp.png";
pkill -f hyprpaper;
hyprpaper &>/dev/null & disown;
echo "Wallpaper Changed";

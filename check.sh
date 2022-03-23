declare -A CHECK_FILES
CHECK_FILES=(
	["yay"]="/usr/bin/yay"	
	["compton"]="/usr/bin/compton"
	["compton-config"]="$HOME/.config/compton/compton.conf"
	["fcitx"]="/usr/bin/fcitx"
	["nvim"]="/usr/bin/nvim"
	["xinitrc"]="$HOME/.xinitrc"
	["firefox"]="/usr/bin/firefox"
	["pulseaudio"]="/usr/bin/pulseaudio"
	["local_conf"]="/etc/locale.conf"
	["bashrc"]="$HOME/.bashrc"
	["alacritty"]="/usr/bin/alacritty"
)

declare -A CHECK_DIRS
CHECK_DIRS=(
	["dwm"]="$HOME/.config/dwm/"
	["dmenu"]="$HOME/.config/dmenu/"
	["wallpaper"]="$HOME/.config/wallpaper"
)
function check_file_exist {
     for key in "${!CHECK_FILES[@]}"; do
 if [[ $key == $1 ]]; then
     if [ -e ${CHECK_FILES[$key]} ]; then
             return 0
     else
 	return 1
     fi
 fi
 done
 return 1
}
function check_dir_exist {
    for key in "${!CHECK_DIRS[@]}"; do
	if [[ $key == $1 ]]; then
	    if [ -d ${CHECK_DIRS[$key]} ]; then
                return 0
	    else
		return 1
	    fi
	fi
    done
    return 1
}

check_all () {
    for key in "${!CHECK_FILES[@]}"; do
	if !(check_file_exist $key); then
	    echo "${RED}check failed: $key${RESET}"
	fi
    done
    for key in "${!CHECK_DIRS[@]}"; do
	if !(check_dir_exist $key); then
	    echo "${RED}check failed: $key${RESET}"
	fi
	cd ~/
	tree -L 2 -A -a
    done
}

#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/quicklinks.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Browser
if [[ -f /usr/bin/firefox-developer-edition ]]; then
	app="firefox-developer-edition"
elif [[ -f /usr/bin/chromium ]]; then
	app="chromium"
elif [[ -f /usr/bin/midori ]]; then
	app="midori"
else
	msg "No suitable web browser found!"
	exit 1
fi

# Links
google=""
github=""
mail=""
youtube=""
edutin=""

# Variable passed to rofi
options="$github\n$edutin\n$google\n$mail\n$youtube"

chosen="$(echo -e "$options" | $rofi_command -p "$app" -dmenu -selected-row 2)"
case $chosen in
    $github)
        $app https://www.github.com &
        ;;
    $edutin)
        $app https://app.edutin.com/home &
        ;;
    $google)
        $app https://www.google.com & -l
        ;;
    $mail)
        $app https://outlook.office.com/mail/ &
        ;;
    $youtube)
        $app https://www.youtube.com &
        ;;
esac


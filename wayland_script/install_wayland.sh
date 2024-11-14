#!/bin/bash

# function to display options to user
display_options() {
	printf "\nWelcome to Shitty Install Script\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

    # display the options
    printf "\nOption [1]: Update - Install Hyprland + Drivers + Tools"
	printf "\nOption [2]: Update - Install GUI Applications"
	printf "\nOption [3]: Populate Folders and Files"
	printf "\nOption [4]: Update - Install Terminal Applications"
    printf "\nOption [5]: Create - Move Folders"
    printf "\nOption [6]: GitHub Configuration"
    printf "\nOption [7]: Exit\n\n"

}


# function to check - install packages with pacman
install_package() {
	# starts iterating over the arguments / packages
    for package in "$@"; do

        # if the package is already installed
        if pacman -Qs "$package" > /dev/null; then
            # output the approriate message
            echo "$package is already installed."
        # if the package has not been found

        else
			# install the package ( without confirmation )
            echo "Installing $package..."
            sudo pacman -S --noconfirm "$package"
        fi
    done
}


# function to check - install packages with yar / AUR helper
install_yay_package() {
	# starts iterating over the arguments / packages
    for package in "$@"; do

        # if the package is already installed
        if yay -Qs "$package" > /dev/null; then
            # output the approriate message
            echo "$package is already installed."
        # if the package has not been found

        else
			# install the package ( without confirmation )
            echo "Installing $package..."
            yay -S --noconfirm "$package"
        fi
    done
}




# function to update, install Hyprland, tools and drivers
install_hyprland_tools() {
	printf "\nUpdate - Install Hyprland Tools + Drivers\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	printf "\nUpdating System\n\n"
	
	# update the entire system
	sudo pacman -Syu --noconfirm

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n\n"

	# installing packages with pacman ( calling function `install_package` )
	install_package git hyprland kitty hyprutils hyprshot hyprpicker hyprcursor hyprpaper hyprwayland-scanner xdg-desktop-portal-hyprland xdg-desktop-portal-wlr wl-clipboard power-profiles-daemon wl-clipboard power-profiles-daemon thunar-volman gvfs gvfs-afc brightnessctl gnome-keyring network-manager-applet ldns blueman lxinput rofi

}


# function to install GUI packages / applications
install_gui_apps() {
	printf "\nUpdate - Install GUI Applications / Packages\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	printf "\nUpdating System\n\n"
	
	# update the entire system
	sudo pacman -Syu --noconfirm

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n\n"

	# installing packages with pacman ( calling function `install_package` )
	install_package kitty obsidian obs-studio discord ristretto mpv
	# installing packages with AUR helper ( calling function `install_yay_package` )
	install_yay_package vscodium-bin thorium-browser-bin

}


# function to move configuration file from github repo
move_all_configurations() {
	printf "\nPopulating Folders and Files\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# make folders found in home directory
	mkdir -p ~/{OBS\ Studio,Screenshots,Obsidian,GitHub}

	# move all of the configuration files and folders to required location
	# hyprland related configurations

}


# function to evaluate user's choice on option
select_choice_option() {
	# conditions to evaluate depending on user's input
	if [[ "$user_option" = 1 ]]; then
		# call the function `install_hyprland_tools`
		install_hyprland_tools

	elif [[ "$user_option" = 2 ]]; then
		# call the function `install_gui_apps`
		install_gui_apps

	elif [[ "$user_option" = 3 ]]; then
		# call function to move configuration files
		move_all_configurations

	elif [[ "$user_option" = 7 ]]; then
		# user wants to exit the script
		printf "\nGood Bye\n"
		exit 0

	else:
		# users presses unavailable option
		# output '-' 50 times
		printf '%0.s-' {1..50}
		printf "\n"

		# output approriate message
		printf "\nWrong Option\n"

		# output '-' 50 times
		printf '%0.s-' {1..50}
		printf "\n"
	fi
}


# our main function
main() {
	# call the function to display options to the user
	display_options

	# ask the user to select and option
	read -p "Please Select and Option: " user_option


	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# call the function to evalute the user's choice
	select_choice_option "$user_choice"

}

# source the main function
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main
fi

#!/bin/bash

# function to display options to user
display_options() {
	printf "\nWelcome to Shitty Install Script\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

    # display the options
    printf "\nOption [1]: Update - Install Hyprland + Install Drivers + Tools"
    printf "\nOption [2]: Update - Install Applications"
    printf "\nOption [3]: Create - Move Folders"
    printf "\nOption [4]: GitHub Configuration"
    printf "\nOption [5]: Exit\n\n"

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


# function to evaluate user's choice on option
select_choice_option() {
	# conditions to evaluate depending on user's input
	if [[ "$user_option" = 1 ]]; then
		# call the function `install_hyprland_tools`
		install_hyprland_tools

	elif [[ "$user_option" = 5 ]]; then
		# user wants to exit the script
		printf "\nGood Bye\n"
		exit 0
	fi
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
	printf "\n"

	# call the install function
	install_package hyprland

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

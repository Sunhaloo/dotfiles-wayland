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
	printf "\nOption [4]: Install Terminal Tools"
    printf "\nOption [5]: GitHub Configuration"
    printf "\nOption [6]: Exit\n\n"
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


# function to setup Git / GitHub
setup_git() {
	if [ -f git.sh ]; then
		# make git script executable and run it
		chmod +x git.sh
		bash ./git.sh
	# if the file has not been found
	else
		# output approriate message
		printf "\nSript File has NOT been Found!!!\n\n"

		# output '-' 50 times
		printf '%0.s-' {1..50}
		printf "\n"

		# exit with error
		exit 1
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
	printf "\n\n"

	# installing packages with pacman ( calling function `install_package` )
	install_package git hyprland kitty hyprutils hyprpicker hyprcursor hyprpaper hyprwayland-scanner xdg-desktop-portal-hyprland xdg-desktop-portal-wlr wl-clipboard power-profiles-daemon wl-clipboard power-profiles-daemon thunar-volman gvfs gvfs-afc brightnessctl gnome-keyring network-manager-applet ldns blueman lxinput rofi yazi yarn
	# installing packages with AUR helper ( calling function `install_yay_package` )
	install_yay_package hyprshot pyprland bibata-cursor-theme banana-cursor-bin

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


# function to move configuration folders from github repo
move_main_configuration() {
	printf "\nPopulating Folders and Files\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# make folders found in home directory
	mkdir -p ~/{OBS\ Studio,Screenshots,Obsidian,GitHub}

	# move required configuration folders to `.config`
	cp -r ~/dotfiles-wayland/{hypr,waybar,nvim,rofi,code_codium,fastfetch,ohmyposh} ~/.config
	# move required folders to `$HOME`
	cp -r ~/dotfiles-wayland/wayland_script $HOME
}


# function to install oh-my-zsh
install_omz() {
	printf "\nOh-My-ZSH Installation\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	printf "\nOh-My-ZSH Installation Completed\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	printf "\nOh-My-ZSH Plugins Installation\n\n"

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	printf "\nOh-My-ZSH Installation Completed\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"
}

# function to install tmux-tmp
install_tpm() {
    printf "\n\nTMUX TPM Installation\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

	printf "\nOh-My-ZSH Installation Completed\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"
}

# function to move terminal configuration files and folders from github repo
move_terminal_configuration() {
	printf "\nTerminal Related Files\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# move required configuration folders to `.config`
	cp -r ~/dotfiles-wayland/kitty ~/.config
	cp -r ~/dotfiles-wayland/.zshrc $HOME
	cp -r ~/dotfiles-wayland/.tmux.conf $HOME

	# call the function to install oh-my-zsh
	install_omz
	# call the function to install tmux-tpm
	install_tpm

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
		# call function to move main configuration folders
		move_main_configuration

	elif [[ "$user_option" = 4 ]]; then
		# call function to move configuration files and folders
		move_terminal_configuration

	elif [[ "$user_option" = 5 ]]; then
		# call the function for Git configuration
		setup_git

	elif [[ "$user_option" = 6 ]]; then
		# user wants to exit the script
		printf "\nGood Bye!\n"
		exit 0

	else
		# users presses unavailable option
		# output '-' 50 times
		printf '%0.s-' {1..50}
		printf "\n"

		# output approriate message
		printf "\nWrong Option\n\n"

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

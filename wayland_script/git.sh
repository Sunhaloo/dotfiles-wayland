#!/bin/bash

# function to display the options to the user
display_options() {
	# output options to user
	printf "\nOption[1]: Install Git"
	printf "\nOption[2: Git Configuration\n"
}


# function to check if git is installed
check_git_installed() {
	# check if Git is installed
	printf "\nChecking if Git is installed...\n\n"

	# conditions to evaluate based if Git is installed
	if which git &> /dev/null
	# if Git is installed
	then
		printf "Git is already installed\n"
	# if Git is NOT installed
	else
		printf "Git is NOT installed... Installing Git\n"
		# install git
		sudo pacman -S git --noconfirm
	fi
}


# out main function
main () {
	display_options
}


# source the main function
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main
fi

# WARNING: Testing


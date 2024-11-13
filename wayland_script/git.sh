#!/bin/bash

# function to display the options to the user
display_options() {
	# output options to user
	printf "\nOption [1]: Install Git"
	printf "\nOption [2]: Git Configuration"
	printf "\nOption [3]: Exit\n\n"
}


# function to check if git is installed
check_git_installed() {
	# check if Git is installed
	printf "\nChecking if Git is installed...\n\n"

	# conditions to evaluate based if Git is installed
	if which git &> /dev/null; then
	# if Git is installed
		printf "Git is already installed\n"
	# if Git is NOT installed
	else
		printf "Git is NOT installed... Installing Git\n"
		# install git
		sudo pacman -S git --noconfirm
	fi
}


# create a function to configure Git
configure_git() {
	printf "\n"
	# prompt the user to enter credentials
	read -p "Please Enter Your Email ( attached with GitHub ): " git_email
	read -p "Please Enter Your Username: " git_username

	# start configuring Git ---> output appropriate message
	printf "\nSetting Up Git...\n\n"

	# configure git
	git config --global user.email "$git_email"
	git config --global user.name "$git_username"
	git config --global init.defaultBranch main

	# list Git configuration
	git config --list

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# output appropriate message
	printf "\n\nGit Configuration Completed\n"
}


# out main function
main() {
	# call the function to display the options to the user
	display_options
	
	# ask the user to select and option
	read -p "Please Select and Option: " user_option

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# conditions to evaluate depending on user's input
	if [[ "$user_option" = 1 ]]; then
		# call the function to check for Git in system
		check_git_installed
	elif [[ "$user_option" = 2 ]]; then
		# call the function to configure Git
		configure_git
	elif [[ "$user_option" = 3 ]]; then
		# user wants to exit the script
		printf "\nGood Bye\n"
		exit 0
	fi
}


# source the main function
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main
fi

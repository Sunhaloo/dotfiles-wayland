#!/bin/bash

# make path variables related to `GitHub` folder
gh="$HOME/GitHub/obsidian"
gh_sun_vault="$HOME/GitHub/obsidian/S.Sunhaloo"
gh_qna_vault="$HOME/GitHub/obsidian/Question - Problems - Solutions"

# make path variables related to `Obsidian` folder
obsidian="$HOME/Obsidian"
obsidian_sun_vault="$HOME/Obsidian/S.Sunhaloo"
obsidian_qna_vault="$HOME/Obsidian/Question - Problems - Solutions"


# function to display options to the user
display_options() {
    printf "\nObsidian Vault Folder Move Script\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"
    
    # display the options on the screen
    printf "\nOption [1]: Move From Obsidian to GitHub"
    printf "\nOption [2]: Move From GitHub to Obsidian"
    printf "\nOption [3]: Exit Script\n\n"
}


# function to move vaults from `GitHub` to `Obsidian`
gh_to_obsidian() {
	# output message that we are deleting folders in `Obsidian` directory
	printf "\nDeleting Folders in '%s' Directory\n\n" "$obsidian"

	# delete the folders in the `Obsidian` directory
	rm -rf "$obsidian_sun_vault" "$obsidian_qna_vault"

	# copy "vaults" from `GitHub` directory to `Obsidian`
	cp -r "$gh_sun_vault" "$gh_qna_vault" "$obsidian"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# output confirmation message
	printf "\nVaults have been Moved!\n"
}


# function to move vaults form `Obsidian` to `GitHub`
obsidian_to_gh() {
	# output message that we are deleting folders in `Obsidian` directory
	printf "\nDeleting Folders in '%s' Directory\n\n" "$gh"

	# delete the folders in the `GitHub` directory
	rm -rf "$gh_sun_vault" "$gh_qna_vault"

	# copy "vaults" from `Obsidian` directory to `GitHub`
	cp -r "$obsidian_sun_vault" "$obsidian_qna_vault" "$gh"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# output confirmation message
	printf "\nVaults have been Moved!\n"
}


# out main function
main() {
	# call the function display the options to the user
	display_options

	# ask the user to select and option
	read -p "Please Select and Option: " user_option

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# conditions to evaluate depending on user's input
	if [[ "$user_option" = 1 ]]; then
		# call the function to move vaults from `Obsidian` to `GitHub`
		obsidian_to_gh
	elif [[ "$user_option" = 2 ]]; then
		# call the function to move vaults from `GitHub` to `Obsidian`
		gh_to_obsidian
	elif [[ "$user_option" = 3 ]]; then
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


# source the main function
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main
fi

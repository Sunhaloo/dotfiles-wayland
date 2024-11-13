#!/bin/bash

# make path variable for kitty directory and kitty configuration file
kitty_dir="$HOME/.config/kitty/"
kitty_conf="$HOME/.config/kitty/kitty.conf"


# function to display options to user
display_options() {
    # display the options
    printf "\nOption [1]: Change Font"
    printf "\nOption [2]: Change Font Size"
    printf "\nOption [3]: Change Background Opacity"
    printf "\nOption [4]: Exit Script\n\n"
}


# function to change the font
change_font() {
	printf "\nSelect Your Font\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

    # displays font options to the user
    printf "\nOption [1]: JetBrainsMono Nerd Font"
    printf "\nOption [2]: Iosevka Nerd Font Mono"
    printf "\nOption [3]: Fira Mono Nerd Font Mono"
    printf "\nOption [4]: Hack Nerd Font"
    printf "\nOption [5]: Exit\n\n"

	# prompt the user to enter font option
	read -p "Select Font Number: " user_font

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# Conditions to evaluate based on user input
	if [ "$user_font" = 1 ]; then
		# User selects "JetBrainsMono"
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|Iosevka Nerd Font Mono\|FiraMono Nerd Font Mono\|Hack Nerd Font Mono\)"/font_family      family="JetBrainsMono Nerd Font Mono"/' "$kitty_conf"
		# Output confirmation message
		printf "\nFont changed to JetBrainsMono Nerd Font Mono... Please Reload Kitty\n"
		
	elif [ "$user_font" = 2 ]; then
		# User selects "Iosevka"
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|FiraMono Nerd Font Mono\|Hack Nerd Font Mono\|Iosevka Nerd Font Mono\)"/font_family      family="Iosevka Nerd Font Mono"/' "$kitty_conf"
		# Output confirmation message
		printf "\nFont changed to Iosevka Nerd Font Mono... Please Reload Kitty\n"
		
	elif [ "$user_font" = 3 ]; then
		# User selects "FiraMono"
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|Iosevka Nerd Font Mono\|Hack Nerd Font Mono\|FiraMono Nerd Font Mono\)"/font_family      family="FiraMono Nerd Font Mono"/' "$kitty_conf"
		# Output confirmation message
		printf "\nFont changed to Fira Mono Nerd Font Mono... Please Reload Kitty\n"
		
	elif [ "$user_font" = 4 ]; then
		# User selects "Hack"
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|Iosevka Nerd Font Mono\|FiraMono Nerd Font Mono\|Hack Nerd Font Mono\)"/font_family      family="Hack Nerd Font Mono"/' "$kitty_conf"
		# Output confirmation message
		printf "\nFont changed to Hack Nerd Font... Please Reload Kitty\n"

	elif [ "$user_font" = 5 ]; then
		# user wants to exit the script
		printf "\nGood Bye\n"
		exit 0

	else
		# If the user selects anything else
		printf "\nWrong Option\n"
	fi


}



# our main function
main() {
	# call the function to display options to user
	# display_options

	change_font


}


# source the main function
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main
fi

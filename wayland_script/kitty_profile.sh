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
		# output confirmation message
		printf "\nFont changed to JetBrainsMono Nerd Font Mono... Please Reload Kitty\n"
		
	elif [ "$user_font" = 2 ]; then
		# User selects "Iosevka"
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|FiraMono Nerd Font Mono\|Hack Nerd Font Mono\|Iosevka Nerd Font Mono\)"/font_family      family="Iosevka Nerd Font Mono"/' "$kitty_conf"
		# output confirmation message
		printf "\nFont changed to Iosevka Nerd Font Mono... Please Reload Kitty\n"
		
	elif [ "$user_font" = 3 ]; then
		# User selects "FiraMono"
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|Iosevka Nerd Font Mono\|Hack Nerd Font Mono\|FiraMono Nerd Font Mono\)"/font_family      family="FiraMono Nerd Font Mono"/' "$kitty_conf"
		# output confirmation message
		printf "\nFont changed to Fira Mono Nerd Font Mono... Please Reload Kitty\n"
		
	elif [ "$user_font" = 4 ]; then
		# User selects "Hack"
		sed -i 's/^font_family\s\+family="\(JetBrainsMono Nerd Font Mono\|Iosevka Nerd Font Mono\|FiraMono Nerd Font Mono\|Hack Nerd Font Mono\)"/font_family      family="Hack Nerd Font Mono"/' "$kitty_conf"
		# output confirmation message
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


# function to change the font size
change_font_size() {
	printf "\nFont Size Selection\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	printf "\nNOTE: Font Size Format: 'xx.x' ( 'x' is a number from '0' to '9' )\n"
	# prompt the user to enter font size
	read -p "Please Enter Font Size: " user_font_size

    # change the font size to desired user font size
    sed -i "s/^font_size\s\+[0-9]\+\(\.[0-9]\+\)\?$/font_size $user_font_size/" "$kitty_conf"

	# output confirmation message

change_font_size() {
    printf "\nChange Font Size\n"

    # read the user's input
    read -p "Please Enter Font Size (xx.x format, e.g., 12.5): " user_font_size

    # regular expression to check if the input is a valid font size (xx.x format)
    if [[ ! "$user_font_size" =~ ^[0-9]{1,2}(\.[0-9])?$ ]]; then
        printf "\nError: Invalid font size. Please enter a valid font size in the format xx.x (e.g., 12.5).\n"
        return 1  # Exit the function with an error code
    fi

    # change the font size to desired size in the configuration file
    sed -i "s/^font_size\s\+[0-9]\+\(\.[0-9]\+\)\?$/font_size $user_font_size/" "$kitty_conf"

    # outputs the confirmation message
    printf "\nFont size changed to $user_font_size\n"
}

}



# our main function
main() {
	# call the function to display options to user
	# display_options
	change_font_size


}


# source the main function
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main
fi

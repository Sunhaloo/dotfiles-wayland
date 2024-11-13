#!/bin/bash

# make path variable for kitty directory and kitty configuration file
kitty_dir = "$HOME/.config/kitty/"
kitty_conf = "$HOME/.config/kitty/kitty.conf"


# function to display options to user
display_options() {
    # display the options
    printf "\nOption [1]: Change Font"
    printf "\nOption [2]: Change Font Size"
    printf "\nOption [3]: Change Background Opacity"
    printf "\nOption [4]: Exit Script\n\n"
}


# function to change the font



# our main function
main() {

}


# source the main function
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main
fi

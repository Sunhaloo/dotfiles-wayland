# Change Themes

- Install GTK Settings / `nwg-look`

## Change Icon Themes

Simply download the icons themes:

1. From Pacman / AUR
    - Change icon theme from `nwg-look`
2. Download from the Internet
    - Move that zip file to `/usr/share/icons`
    - Extract the ZIP file --> Delete the ZIP file
    - Change icon theme from `nwg-look`


## Change Cursor Theme

Refer to this very nice video: https://www.youtube.com/watch?v=CF3UFxH8d0Y

>Either downloaded from Pacman / AUR or from the Internet

1. Change cursor theme from `nwg-look`
    - change the cursor theme and also the size
2. Change the cursor theme in the file `/usr/share/icons/default/index.theme`
    - Use `sudo nvim` because it is a read-only file
    - Change theme to desired cursor theme; where folder name is the theme name
3. Create a file at `~/.icons/default/index.theme`
    - Basically write the same thing to what we have at `/usr/share/icons/default/index.theme`
4. Verify the `~/.gtkrc-2.0` file
    - Check whether the proper cursor themes and size had been set

# linux

## Dark Theme for i3wm
To enable DarkTheme for i3wm you need to install `lxappearance` 

```bash
sudo apt install lxappearance
```

Then run `lxappearance` and select the dark theme. (Mint-Y-Dark-Orange)

## Wallpaper and terminal transparency

To set the wallpaper and terminal transparency you need to install `feh` and `picom`

```bash
sudo apt install feh 
sudo apt install picom
```

Create default config file for picom

```bash
vim ~/.config/picom.conf
```

Copy the following content to the file

From: /usr/share/doc/picom/examples/picom.sample.conf

Or by using 

```bash
dpkg -L picom 
```

[Source link](https://www.reddit.com/r/debian/comments/rqxggj/where_to_find_the_picom_example_config_file/)

Add the folowing rule to the config-picom file

```bash
rules: ({
  match = "class_g = 'URxvt' && focused";
  opacity = 0.9;
}, {
  match = "(class_g = 'URxvt' || class_g = 'Alacritty')"
          " && !focused";
  opacity = 0.6;
})
```

[Source link](https://wiki.archlinux.org/title/Picom)

Also, set fading to false.

The line to set a wallpaper is:

```bash
feh --bg-scale /path/to/wallpaper.jpg
```

Add the following line to the i3 config file

```bash
exec --no-startup-id feh --bg-scale /path/to/wallpaper.jpg
```

## Firefox tabs show fullschreen

[Link](https://superuser.com/questions/43964/firefox-always-show-the-tabs-in-fullscreen-mode)

## Custom cursor

[Instructions link](https://www.reddit.com/r/linuxmint/comments/kadvq8/how_do_you_get_new_mouse_pointers/)

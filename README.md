# Install
Clone this repository and create a symbolic link to the .emacs.d/private folder.

ln -s /home/.../spacemacs-tabs/ /home/.../.emacs.d/private/tabs

# Features
This layer contains tabbar and tabbar-ruler.

Organize the tabs groups based on projectile.
When a buffer belongs to a projectile project, then the buffer is assigned to the project's group.

All other buffers are organized to a different group.

Navigate with keyboard tabs.
* ctrl + tab: forward tab
* ctrl + shift + tab: backward tab

WIP
TODO: finish doc

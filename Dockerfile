FROM phusion/baseimage:0.9.17

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y dictionaries-common
RUN apt-get install -y xfce4 xfce4-terminal
RUN apt-get install -y lightdm lightdm-gtk-greeter gnome-icon-theme xubuntu-icon-theme file-roller
RUN apt-get install -y firefox git gitk git-cola


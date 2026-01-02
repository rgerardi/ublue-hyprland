#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

dnf5 remove -y firefox.x86_64 firefox-langpacks.x86_64

# this installs a package from fedora repos
dnf5 install -y tmux 
dnf5 group install -y --with-optional virtualization

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

dnf5 copr -y enable solopasha/hyprland
dnf5 copr -y enable ublue-os/packages

dnf5 -y install hyprland hyprpaper hyprlock hypridle hyprpolkitagent chafa foot foot-terminfo dunst waybar wl-clipboard nwg-bar nwg-look imv wev zsh zsh-autosuggestions zsh-syntax-highlighting SDL2_image SDL3_image SDL3_ttf breeze-cursor-theme breeze-gtk-common breeze-gtk-gtk3 breeze-gtk-gtk4 breeze-icon-theme incus incus-agent f43-backgrounds-base fastfetch fprintd fprintd-pam gdisk glow cascadia-code-nf-fonts cascadia-mono-nf-fonts google-noto-sans-fonts google-noto-sans-mono-fonts google-noto-serif-fonts guestfs-tools gum iwd lm_sensors parted podman-compose podman-machine podman-tui powertop rclone socat tailscale tuned tuned-ppd ublue-brew ublue-os-libvirt-workarounds vulkan-tools xwaylandvideobridge borgbackup fontawesome-fonts-all

dnf5 copr -y disable ublue-os/packages
dnf5 copr -y disable solopasha/hyprland

#### Example for enabling a System Unit File

systemctl enable podman.socket

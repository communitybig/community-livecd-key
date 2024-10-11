#!/bin/bash

# Gambiarra
if [[ -e /run/miso/sfs/livefs && -e /usr/bin/gdm ]]; then
    echo 'default_desktop_file=livecdWayland' >> /etc/manjaro-tools/live.conf
fi

test ! -d /etc/pacman.d/gnupg && mkdir -p /etc/pacman.d/gnupg
test ! -e /etc/pacman.d/gnupg/pubring.gpg && cp -a /usr/share/pacman/keyrings/pubring.gpg /etc/pacman.d/gnupg/pubring.gpg
test ! -e /etc/pacman.d/gnupg/trustdb.gpg && cp -a /usr/share/pacman/keyrings/trustdb.gpg /etc/pacman.d/gnupg/trustdb.gpg



#!/bin/bash

apt_update(){
    sudo apt update
}

install_snap(){
    echo $SHELL
    echo "Installing Snap"

    # executing within a subshell () for redirecting some pattern error to /dev/null (zsh print pattern error even if redirected)
    ( sudo rm /etc/apt/preferences.d/nosnap* ) 2>/dev/null

    sudo apt update

    sudo apt install snapd
}

install_snap_apps() {

    snap_apps_installed=()
    snap_apps_not_installed=()

    # get from snapcraft.io the package string to install
    snap_apps=("discord" \
               "node --classic" \
               "postman" \
               "slack --classic" \
               "spotify" \
               "telegram-desktop" \
               "code --classic" \
               "wazzap" \
               "zoom-client")

    for i in "${snap_apps[@]}"; do
        echo "Installing $i through SNAP"
    
        res=$(sudo snap install $i 2>&1)

        [ $? -eq 0 ] && snap_apps_installed+=("$i") || snap_apps_not_installed+=("$i has not been installed - $res")
    done

    echo
    echo

    for i in "${snap_apps_installed[@]}"; do
        echo "[*] '$i' has been installed successfully"
    done

    echo

    for i in "${snap_apps_not_installed[@]}"; do
        echo "[] '$i'"
    done

    # classics: code, 

    # echo
    
    # echo -e "\tDiscord"
    # echo -e "\tNodeJS"
    # echo -e "\tPostman"
    # echo -e "\tSlack"
    # echo -e "\tSpotify"
    # echo -e "\tTelegram"
    # echo -e "\tVS Code"
    # echo -e "\tWazzap"
    # echo -e "\tZoom Client"
    # echo
    # echo

    # echo -e "\tInstalling Discord..."
    # echo -e "\tInstalling NodeJS..."
    # echo -e "\tInstalling Postman..."
    # echo -e "\tInstalling Slack..."
    # echo -e "\tInstalling Spotify..."
    # echo -e "\tInstalling Telegram..."
    # echo -e "\tInstalling VS Code..."
    # echo -e "\tInstalling Wazzap..."
    # echo -e "\tInstalling Zoom Client..."

    # echo
    # echo

    # echo -e "\t[*] Discord has being installed"
    # echo -e "\t[*] NodeJS has being installed"
    # echo -e "\t[*] Postman has being installed"
    # echo -e "\t[*] Slack has being installed"
    # echo -e "\t[*] Spotify has being installed"
    # echo -e "\t[*] Telegram has being installed"
    # echo -e "\t[*] VS has being installed"
    # echo -e "\t[*] Wazzap has being installed"
    # echo -e "\t[*] Zoom has being installed"

}

######
# MAIN BODY
######



# install_snap

install_snap_apps
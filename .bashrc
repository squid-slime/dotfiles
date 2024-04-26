# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $- == *i* ]] && source /usr/share/blesh/ble.sh # --noattach

export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export EDITOR=/usr/bin/micro
export VISUAL='mirco'
export TERM='foot'
# export TERMINFO='foot-terminfo'

PS1='\[\033[7;32m\]\u@\h \[\033[1;34m\]\d \t \[\033[0;36m\]\w\[\033[0m\]\n\$ \[\033[0m\]' 

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# if [ "$(tty)" = "/dev/tty1" ]; then
#        exec dbus-run-session sway
# fi

installed() {
    pacman -Qs "$1" | awk -F/ '/^local/ {print $2}' | cut -d' ' -f 1
}

#Aliases
alias nano='micro'${pur}
alias htop='btop'${pur}
alias webapp='nativefier'${pur}
alias ls='ls --color=auto'
alias grc='grc --colour=auto'
alias tui="python /home/squid/Documents/pyrunthis"
alias openjpeg='swayimg'
alias openpng='swayimg'
alias jc141='/mnt/f45d633c-17e0-4601-979f-d3976a79a4fb/Games/luancher.sh'
alias llama='/run/media/squid/media/llama.cpp/main -m /run/media/squid/media/llama.cpp/models/Wizard-Vicuna-13B-Uncensored.Q8_0.gguf --repeat_penalty 1.0 --n-gpu-layers 40.0 --color -i -r "User:" -f /run/media/squid/media/llama.cpp/prompts/chat-with-vicuna-v1.txt '

[[ ${BLE_VERSION-} ]] && ble-attach

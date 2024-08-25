#!/bin/sh

handle() {
  case $1 in
    "lockgroups>>1") echo "";;
    "lockgroups>>0") echo "Group unlocked";;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done

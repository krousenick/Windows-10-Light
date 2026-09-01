#!/bin/bash
# Apply PowerShell-style terminal colors for GNOME Terminal (Light theme)
# Usage: ./install-gnome-terminal-colors.sh

set -e

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PROFILES=$(dconf list /org/gnome/terminal/legacy/profiles:/)

if [ -z "$PROFILES" ]; then
    echo "No GNOME Terminal profiles found"
    exit 1
fi

PROFILE_PATH="/org/gnome/terminal/legacy/profiles:/$(echo $PROFILES | head -1)/"

# PowerShell colors (light background)
dconf write "${PROFILE_PATH}foreground" "['gdk_color_parse', '#000000']"
dconf write "${PROFILE_PATH}background" "['gdk_color_parse', '#ffffff']"
dconf write "${PROFILE_PATH}use-theme-colors" "false"
dconf write "${PROFILE_PATH}use-transparent-background" "false"
dconf write "${PROFILE_PATH}scrollbar-position" "'hidden'"
dconf write "${PROFILE_PATH}scrollback-infinite" "true"

# Color palette (PowerShell/Windows Terminal style - light bg)
dconf write "${PROFILE_PATH}palette" "['gdk_color_parse', '#000000', 'gdk_color_parse', '#c50f1f', 'gdk_color_parse', '#13a10e', 'gdk_color_parse', '#c19c00', 'gdk_color_parse', '#0037da', 'gdk_color_parse', '#881798', 'gdk_color_parse', '#3a96dd', 'gdk_color_parse', '#000000', 'gdk_color_parse', '#767676', 'gdk_color_parse', '#e74856', 'gdk_color_parse', '#16c60c', 'gdk_color_parse', '#f9f1a5', 'gdk_color_parse', '#3b78ff', 'gdk_color_parse', '#b4009e', 'gdk_color_parse', '#61d6d6', 'gdk_color_parse', '#ffffff']"

echo "Applied PowerShell terminal colors (Light)"
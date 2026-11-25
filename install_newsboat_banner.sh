#!/bin/bash

BASHRC="$HOME/.bashrc"

# Prüfen, ob der Alias 'nb=' schon in der .bashrc steht
if grep -q "^alias nb=" "$BASHRC"; then
    echo "Hinweis: Ein 'alias nb=' existiert bereits in deiner $BASHRC."
    echo "Bitte entferne ihn zuerst manuell (nano ~/.bashrc), falls du ihn ersetzen möchtest."
    exit 1
fi

# Leerzeile und das Newsboat-Banner exakt 1:1 an die ~/.bashrc anhängen
cat << 'EOF' >> "$BASHRC"

# Knallbuntes Regenbogen-Newsboat Start-Banner (Absolut perfekt ausgerichtet)
alias nb='clear; \
cols=$(tput cols 2>/dev/null || echo $COLUMNS); \
banner_width=74; \
pad_left=$(( (cols - banner_width) / 2 )); \
[ $pad_left -lt 0 ] && pad_left=0; \
printf "%${pad_left}s\033[1;31m###########################################################################\n" ""; \
printf "%${pad_left}s\033[1;33m#                                                                         #\n" ""; \
printf "%${pad_left}s\033[1;33m#  \033[1;31m███╗   ██╗███████╗██╗    ██╗███████╗██████╗  ██████╗  █████╗████████╗ %*s\033[1;33m#\n" "" 1 ""; \
printf "%${pad_left}s\033[1;32m#  \033[1;33m████╗  ██║██╔════╝██║    ██║██╔════╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔═╝ %*s\033[1;32m#\n" "" 1 ""; \
printf "%${pad_left}s\033[1;36m#  \033[1;32m██╔██╗ ██║█████╗  ██║ █╗ ██║███████╗██████╔╝██║   ██║███████║   ██║   %*s\033[1;36m#\n" "" 1 ""; \
printf "%${pad_left}s\033[1;34m#  \033[1;36m██║╚██╗██║██╔══╝  ██║███╗██║╚════██║██╔══██╗██║   ██║██╔══██║   ██║   %*s\033[1;34m#\n" "" 1 ""; \
printf "%${pad_left}s\033[1;35m#  \033[1;34m██║ ╚████║███████╗╚███区域███╔╝███████║██████╔╝╚██████╔╝██║█║   ██║   %*s\033[1;35m#\n" "" 1 ""; \
printf "%${pad_left}s\033[1;35m#  \033[1;35m╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝ ╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝   ╚═╝   %*s\033[1;35m#\n" "" 1 ""; \
printf "%${pad_left}s\033[1;34m#                                                                         #\n" ""; \
printf "%${pad_left}s\033[1;35m###########################################################################\n" ""; \
printf "\033[0m"; \
sleep 1.2; command newsboat'
EOF

echo "Erfolgreich in $BASHRC eingetragen!"
echo "Führe jetzt 'source ~/.bashrc' aus (oder öffne ein neues Terminal) und tippe 'nb'."

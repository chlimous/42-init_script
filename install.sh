#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chlimous <chlimous@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/08 18:41:10 by chlimous          #+#    #+#              #
#    Updated: 2025/05/05 17:47:52 by chlimous         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BIN_NAME=rinit
BIN_DIR="${XDG_BIN_HOME:-$HOME/.local/bin}"
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/$BIN_NAME"

mkdir -p $DATA_DIR
cp .gitignore Makefile $DATA_DIR

mkdir -p $BIN_DIR
cp $BIN_NAME $BIN_DIR
chmod +x $BIN_DIR/$BIN_NAME
SHELL_RC="$HOME/.`basename $SHELL`rc"
PATH_LINE="export PATH=\"$BIN_DIR:\$PATH\""
if ! grep -Fxq "$PATH_LINE" "$SHELL_RC"; then
	echo "$PATH_LINE" >> "$SHELL_RC"
fi

#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    uninstall.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chlimous <chlimous@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/05 17:52:12 by chlimous          #+#    #+#              #
#    Updated: 2025/05/05 17:52:12 by chlimous         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BIN_NAME=rinit
rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}/$BIN_NAME"
rm -f "${XDG_BIN_HOME:-$HOME/.local/bin}/$BIN_NAME"

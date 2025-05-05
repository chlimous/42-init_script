# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    rinit.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chlimous <chlimous@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/08 18:36:58 by chlimous          #+#    #+#              #
#    Updated: 2025/05/05 14:30:53 by chlimous         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

cp $(dirname "$(readlink -f "$0")")/.gitignore $(dirname "$(readlink -f "$0")")/Makefile .
mkdir -p source
mkdir -p include
git clone https://github.com/chlimous/42-libft_enhanced libft
rm -rf libft/libft.png libft/README.md libft/LICENSE libft/.gitignore

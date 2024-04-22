# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chlimous <chlimous@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/08 18:41:10 by chlimous          #+#    #+#              #
#    Updated: 2024/04/18 21:22:41 by chlimous         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

rm -rf ~/bin/rinit ~/bin/rinitd
mkdir -p ~/bin/rinitd
cp .gitignore Makefile rinit.sh ~/bin/rinitd
ln -s ~/bin/rinitd/rinit.sh ~/bin/rinit
chmod +x ~/bin/rinitd/rinit.sh

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chlimous <chlimous@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/20 00:00:00 by chlimous          #+#    #+#              #
#    Updated: 2024/04/22 15:22:11 by chlimous         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = bin.out

SRCS = main.c

OBJS = $(SRCS:.c=.o)

INCLUDE = include

INCLUDES = -I $(INCLUDE)

LIBFT_DIR = libft

LIBFT = $(LIBFT_DIR)/libft.a

CC = cc

CFLAGS = -Wall -Wextra -Werror

C_GREEN=\e[32m
C_END=\e[0m

%.o: %.c $(INCLUDE)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $(<:.c=.o)

all: $(NAME)

$(NAME): $(OBJS) $(LIBFT)
	$(CC) $(CFLAGS) $(OBJS) -L $(LIBFT_DIR) -l ft -o $(NAME)

bonus: all

$(LIBFT): FORCE
	@echo "$(C_GREEN)Compiling libft...$(C_END)"
	@output="$$(make -C libft)"; \
	if echo "$$output" | grep -q 'is up to date'; then \
		echo "$(C_GREEN)libft is already up to date.$(C_END)"; \
	else \
		echo "$(C_GREEN)libft succesfully compiled.$(C_END)"; \
	fi

FORCE:

deb: $(NAME)
	@./$(NAME)

debv: $(NAME)
	@valgrind --leak-check=full ./$(NAME)

clean:
	make clean -C libft
	rm -f $(OBJS)

fclean: clean
	make fclean -C libft
	rm -f $(NAME)

re: fclean all

.PHONY: all FORCE clean fclean re

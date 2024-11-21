# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chlimous <chlimous@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/20 00:00:00 by chlimous          #+#    #+#              #
#    Updated: 2024/11/21 09:47:45 by chlimous         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = bin.out
SRCDIR = src
OBJDIR = obj
SRCS = $(addprefix $(SRCDIR)/, main.c)
OBJS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCS))
INCLUDE = include
INCLUDES = -I $(INCLUDE) -I $(LIBFT_DIR)/include
LIBFT_DIR = libft
LIBFT = $(LIBFT_DIR)/libft.a
CC = cc
CFLAGS = -Wall -Wextra -Werror
C_GREEN=\e[32m
C_END=\e[0m

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(INCLUDE)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

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
	rm -rf $(OBJDIR)
	@if [ -d "$(LIBFT_DIR)" ]; then \
		make clean -C $(LIBFT_DIR); \
	fi

fclean: clean
	rm -f $(NAME)
	@if [ -d "$(LIBFT_DIR)" ]; then \
		make fclean -C $(LIBFT_DIR); \
	fi

re: fclean all

.PHONY: all FORCE clean fclean re

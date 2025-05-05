# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chlimous <chlimous@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/01 00:00:00 by chlimous          #+#    #+#              #
#    Updated: 2025/05/05 15:53:03 by chlimous         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BIN = bin.out
SRCDIR = source
OBJDIR = build
SRCS = $(addprefix $(SRCDIR)/, main.c)
OBJS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCS))
INCLUDE = -I include -I $(LIBFT_DIR)/include
LIBFT_DIR = libft
LIBFT = $(LIBFT_DIR)/libft.a
CC = cc
CFLAGS = -Wall -Wextra -Werror -MMD -MP
C_GREEN=\e[32m
C_END=\e[0m

all: $(BIN)

-include $(OBJS:.o=.d)
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

$(BIN): $(OBJS) $(LIBFT)
	$(CC) $(CFLAGS) $(OBJS) -L $(LIBFT_DIR) -l ft -o $(BIN)

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

deb: $(BIN)
	@./$(BIN)

debv: $(BIN)
	@valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./$(BIN)

clean:
	rm -rf $(OBJDIR)
	@if [ -d "$(LIBFT_DIR)" ]; then \
		make clean -C $(LIBFT_DIR); \
	fi

fclean: clean
	rm -f $(BIN)
	@if [ -d "$(LIBFT_DIR)" ]; then \
		make fclean -C $(LIBFT_DIR); \
	fi

re: fclean all

.PHONY: all bonus FORCE deb debv clean fclean re

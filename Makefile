NAME = minishell
CC = cc
CFLAGS = -Wall -Wextra -Werror -g


LIBFT_DIR = libft
LIBFT_A = $(LIBFT_DIR)/libft.a

SRC_DIR = src

INPUT_DIR = $(SRC_DIR)/input
INPUT_SRC = input_process.c grammar_check.c syntax.c
INPUT_LOC = $(addprefix $(INPUT_DIR)/, $(INPUT_SRC))


EXPAND_DIR = $(INPUT_DIR)/expand
EXPAND_SRC = expand.c exp.c
EXPAND_LOC = $(addprefix $(EXPAND_DIR)/, $(EXPAND_SRC))


HERDOC_DIR = $(INPUT_DIR)/herdoc
HERDOC_SRC = herdoc_process.c
HERDOC_LOC = $(addprefix $(HERDOC_DIR)/, $(HERDOC_SRC))

LEXING_DIR = $(INPUT_DIR)/lexing
LEXING_SRC = lexing.c op_part.c word_part.c
LEXING_LOC = $(addprefix $(LEXING_DIR)/, $(LEXING_SRC))


REMOVE_DIR = $(INPUT_DIR)/remove
REMOVE_SRC = remove_quote.c
REMOVE_LOC = $(addprefix $(REMOVE_DIR)/, $(REMOVE_SRC))

SPLIT_DIR = $(INPUT_DIR)/split_word
SPLIT_SRC = split_words.c
SPLIT_LOC = $(addprefix $(SPLIT_DIR)/, $(SPLIT_SRC))


STATE_DIR = $(INPUT_DIR)/state
STATE_SRC = state_machine.c
STATE_LOC = $(addprefix $(STATE_DIR)/, $(STATE_SRC))


SETUP_DIR = $(SRC_DIR)/setup
SETUP_SRC = ready_minishell.c set_envp.c
SETUP_LOC = $(addprefix $(SETUP_DIR)/, $(SETUP_SRC))


SIGNAL_DIR = $(SRC_DIR)/signal
SIGNAL_SRC = set_signal.c
SIGNAL_LOC = $(addprefix $(SIGNAL_DIR)/, $(SIGNAL_SRC))


UTILS_DIR = $(SRC_DIR)/utils
UTILS_SRC = is.c charjoin_and_free.c
UTILS_LOC = $(addprefix $(UTILS_DIR)/, $(UTILS_SRC))


LST_DIR = $(UTILS_DIR)/list
LST_SRC = envp.c token.c herdoc.c
LST_LOC = $(addprefix $(LST_DIR)/, $(LST_SRC))


#will delete
PRINT_DIR = print
PRINT_SRC = print_token.c print_herdoc.c
PRINT_LOC = $(addprefix $(PRINT_DIR)/, $(PRINT_SRC))

INCLUDES =  -I. \
			-I$(INPUT_DIR) \
			-I$(EXPAND_DIR) \
			-I$(SPLIT_DIR) \
			-I$(HERDOC_DIR) \
			-I$(LEXING_DIR) \
			-I$(REMOVE_DIR) \
			-I$(STATE_DIR) \
			-I$(SETUP_DIR) \
			-I$(SIGNAL_DIR) \
			-I$(UTILS_DIR) \
			-I$(LST_DIR) \
			-I$(LIBFT_DIR)

SRCS =  main.c \
		$(INPUT_LOC) \
		$(EXPAND_LOC) \
		$(SPLIT_LOC) \
		$(HERDOC_LOC) \
		$(LEXING_LOC) \
		$(REMOVE_LOC) \
		$(STATE_LOC) \
		$(SETUP_LOC) \
		$(SIGNAL_LOC) \
		$(UTILS_LOC) \
		$(LST_LOC)

#will delete
D_INCLUDES = -I$(PRINT_DIR)
D_SRCS = $(PRINT_LOC)

OBJS = $(SRCS:.c=.o)

#will delete
D_OBJS = $(D_SRCS:.c=.o)

all: $(NAME)

$(NAME): $(LIBFT_A) $(OBJS) $(D_OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(D_OBJS) $(LIBFT_A) -lreadline

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) $(D_INCLUDES) -c $< -o $@

$(LIBFT_A):
	$(MAKE) -C $(LIBFT_DIR)
	$(MAKE) -C $(LIBFT_DIR) bonus

clean:
	$(RM) $(OBJS) $(D_OBJS)
	$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	$(RM) $(NAME)
	$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean all

.PHONY: all clean fclean re

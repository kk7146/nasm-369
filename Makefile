SRCS   = read_asm.s func_asm.s
MAIN   = main.c
OBJS   = $(SRCS:.s=.o) $(MAIN:.c=.o)
NAME   = a.out

all: $(NAME)

# 개별 객체 파일을 생성하는 규칙
%.o: %.s
	nasm -f macho64 $<

%.o: %.c
	arch -x86_64 gcc -c $(MAIN)

$(NAME): $(OBJS)
	arch -x86_64 gcc $(OBJS) -o $(NAME)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re $(NAME)

INPUT			= input

SRCS_DIR		=	./srcs
SRCS_NAME		=	a.out
SRCS_EXEC		=	$(addprefix $(SRCS_DIR)/, $(SRCS_NAME))

OUTPUT_TESTER	=	result_test
OUTPUT			=	result

all:	$(SRCS_EXEC)

$(SRCS_EXEC):
	make -C $(SRCS_DIR) all

test:
	cp $(SRCS_EXEC) .
	python3 ./tester/tester.py < $(INPUT) > $(OUTPUT_TESTER)
	-./a.out < $(INPUT) > result
	diff -w result $(OUTPUT_TESTER)

clean:
	make -C $(SRCS_DIR) clean
	$(RM) $(SRCS_NAME)

fclean:	clean
	make -C $(SRCS_DIR) fclean
	$(RM) $(OUTPUT_TESTER)
	$(RM) $(OUTPUT)

re:					fclean all

.PHONY:				all test clean fclean re
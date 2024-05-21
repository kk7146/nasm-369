#include <stdio.h>

void func_asm(char string[4]);
size_t read_asm(int fd, void *buff, size_t nbyte);

int	main(void)
{
	char a[4];
	read_asm(0, a, 4);
	func_asm(a);
	return (1);
}

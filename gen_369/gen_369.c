#include <stdio.h>

int main() {
    for (int i = 10; i < 100; i++) {
		if (i / 10 == 3 || i / 10 == 6 || i / 10 == 9)
			printf("*");
		else
			printf("-");
        if (i % 10 == 3 || i % 10 == 6 || i % 10 == 9)
            printf("*");
        else
            printf("-");
        printf(" ");
    }
	printf("---");
    return 0;
}
#include <stdint.h>

int main(void){
	char str[] = "Hello world";
	char c = 'a';
	char *addr = (char *)0xc1;
	*addr = 0x08;
	addr++;

	*addr = 0x06; //c2
	addr += 2;

	*addr = 103; // c4
	addr++;

	*addr = 0x00; // c5

	addr = (char *)0xc6; //c6
	while(1){
		for(uint16_t i = 0; i < 0xffff; ++i){
			asm("nop");
		}

		//*addr = str[0];
		*addr = c;
	}
}

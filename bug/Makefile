PREFIX		:=	avr-

CC			:=	gcc
LD			:=	ld
OBJCOPY		:=	objcopy
#CFLAGS		:=	-Wall -mmcu=atmega328p -nostdlib -mint8 -ggdb -O0
CFLAGS		:=	-Wall -mmcu=atmega328p -nostdlib -mint8 -O0
LDFLAGS		:=
LDSCRIPT	:=	memmap.ld

APP			:=	app
PORT		?=	/dev/ttyUSB0

all: $(APP).hex

preproc:
	$(PREFIX)$(CC) -E $(CFLAGS) -o main.i main.c

disas:
	$(PREFIX)$(CC) -S $(CFLAGS) main.c

$(APP).hex: disas
	$(PREFIX)$(CC) -c $(CFLAGS) main.s
	$(PREFIX)$(LD) --script=$(LDSCRIPT) -o $(APP).elf main.o
	$(PREFIX)$(OBJCOPY) -O ihex $(APP).elf $(APP).hex
.PHONY: $(APP).hex

clean:
	rm *.o *.elf* *.hex *.i *.s*


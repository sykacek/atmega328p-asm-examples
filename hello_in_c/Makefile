PREFIX		:=	avr-

CC			:=	gcc
LD			:=	ld
OBJCOPY		:=	objcopy
CFLAGS		:=	-Wall -O0 -mmcu=atmega328p -ffunction-sections -fdata-sections -nostdlib
LDFLAGS		:=
LDSCRIPT	:=	memmap.ld

APP			:=	app
PORT		?=	/dev/ttyUSB0

all: $(APP).hex

disas:
	$(PREFIX)$(CC) -S $(CFLAGS) main.c

build-ld:
	$(PREFIX)$(CC) -c $(CFLAGS) main.c
	$(PREFIX)$(LD) --script=$(LDSCRIPT) -o $(APP).elf main.o
	$(PREFIX)$(OBJCOPY) -O ihex $(APP).elf $(APP).hex

$(APP).hex:
	$(PREFIX)$(CC) -c $(CFLAGS) main.c
	$(PREFIX)$(LD) -o $(APP).elf main.o
	$(PREFIX)$(OBJCOPY) -O ihex $(APP).elf $(APP).hex
.PHONY: $(APP).hex

flash: 
	avrdude -v -p atmega328p -c arduino -P $(PORT) -b 115200 -U flash:w:app.hex:i

clean:
	rm *.o *.s *.elf *.hex

monitor: flash
	minicom -D $(PORT) -b 9600

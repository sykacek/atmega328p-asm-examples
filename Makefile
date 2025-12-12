PREFIX	:=	avr-

CC	:=	gcc
LD	:=	ld
OBJCOPY	:=	objcopy
CFLAGS	:=	-Wall -O1 -mmcu=atmega328p -ffunction-sections -fdata-sections -nostdlib
LDFLAGS	:=
LDSCRIPT	:=	memmap.ld

APP	:=	app

all: $(APP).hex


$(APP).hex:
	$(PREFIX)$(CC) -c $(CFLAGS) main.s
	$(PREFIX)$(LD) --script=$(LDSCRIPT) -o $(APP).elf main.o
	$(PREFIX)$(OBJCOPY) -O ihex $(APP).elf $(APP).hex
.PHONY: $(APP).hex

flash: $(APP).hex
	avrdude -v -p atmega328p -c arduino -P /dev/ttyUSB0 -b 115200 -U flash:w:app.hex:i

clean:
	rm *.o *.s *.elf *.hex


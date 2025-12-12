## Atmega328P ASM Examples
This repository provides basic examples of how to run raw assembly on Atmega328P chip (e.g. Arduino Board) 
To compile and flash the firmware you have to install `avr-gcc`, `binutils-avr` and `avrdude`, optionally `minicom`
For example on Debian based distributions

```
	sudo apt install gcc-avr binutils-avr avrdude minicom
```

## Build and run
In example directory e.g. blink run `make` and `make flash`
```
	cd blink
	make
	make flash
```
You may need to spicify port in Makefile manually (default `/dev/ttyUSB0`)

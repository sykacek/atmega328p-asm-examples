## Atmega328P ASM Examples
This repository provides basic examples of how to run raw assembly on Atmega328P chip (e.g. Arduino board).
To compile and flash the firmware you have to install `avr-gcc`, `binutils-avr` and `avrdude`, optionally `minicom`.

For example, on Debian based distributions

```
	sudo apt install gcc-avr binutils-avr avrdude minicom
```

## Build and run
In example directory e.g. blink run `make` and `make flash`, e.g.
```
	cd blink
	make
	make flash PORT=/dev/ttyACM0
```
You may need to spicify port with `PORT` argument (default `/dev/ttyUSB0`)

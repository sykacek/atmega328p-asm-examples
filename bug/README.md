## avr-objdump bug demonstration

1. Compile the project:
```
	make
```

2. Dump the elf file (or object file)
```
	avr-objdump -d -j .rodata app.elf
	avr-objdump -d -j .rodata main.o
```

You should see misinterpreted instructions instead of string

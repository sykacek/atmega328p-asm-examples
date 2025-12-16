MEMORY
{
	FLASH(rx) : ORIGIN = 0x0, LENGTH = (0x3FFF)
}

ENTRY(main)

SECTIONS
{
	.rodata : {
		*(.rodata*)
		. = ALIGN(16);
	} > FLASH

    .text : {
        *(.text*)
		. = ALIGN(16);
    } > FLASH

	.data : {
		*(.data*)
	} > FLASH 

	.bss : {
		*(.bss*)
	} > FLASH

	/DISCARD/ : {
		*(.*)
	}
}


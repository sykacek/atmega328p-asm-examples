MEMORY
{
	FLASH(rx) : ORIGIN = 0x0, LENGTH = (0x3FFF)
}

ENTRY(main)

SECTIONS
{
    .text : {
        *(.init)
        *(.fini)
        . = ALIGN(4);
    } > FLASH
}


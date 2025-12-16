MEMORY
{
	FLASH(rx) : ORIGIN = 0x0, LENGTH = (0x3FFF)
}

ENTRY(main)

SECTIONS
{
    .text : {
        *(.text*)
		*(.rodata*)
    } > FLASH

	.data : {
		*(.bss*)
		*(.data*)
	} > FLASH 

	/DISCARD/ : {
		/*(.comment .comment.*)
		*(.symtab)
		*(.strtab .shstrtab)*/
		*(.*)
	}
}


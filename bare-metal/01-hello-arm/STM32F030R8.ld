/* Define the end of RAM and limit of stack memory */
/* (8KB SRAM on the STM32F030R8 - starting at address 0x20000000) */

/* end of RAM = ORIGIN (shown below) + 8k (0x2000) */
_estack = 0x20002000;

MEMORY 
{
    FLASH ( rx )    : ORIGIN = 0x08000000, LENGTH = 64K
    RAM ( rxw )     : ORIGIN = 0x20000000, LENGTH = 8K
}

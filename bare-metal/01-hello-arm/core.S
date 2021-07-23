// define attributes of our chip and assembly language we'll use
.syntax unified
.cpu cortex-m0
.fpu softvfp
.thumb

// global memory locations
.global vtable
.global reset_handler

/*
 * The actual vector table
 * Only the size of RAM and 'reset' handler are included (for simplicity)
 */
.type vtable, %object
vtable:
    .word _estack
    .word reset_handler
.size vtable, .-vtable

/*
 * The Reset Handler (called on reset)
 */
.type reset_handler, %function
reset_handler:
    // set the stack pointer to the end of the stack
    // '_estack' is defined in our linker script
    LDR  r0, =_estack
    MOV  sp, r0

    // set some dummy values to watch in the debugger
    LDR  r7, =0xDEADBEEF
    MOVS r0, #0
    main_loop:
        // add 1 to register 'r0'
        ADDS r0, r0, #1
        // loop back
        B    main_loop
.size reset_handler, .-reset_handler

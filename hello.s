.global main

.equ GPIO_BASE, 0x50200000 

.equ GPSET0, 0x1C
.equ GPCLR0, 0x28
.equ GPDIR0, 0x04

.equ LED_PIN, 25

main:
    ldr r0, =GPIO_BASE
    ldr r1, [r0, #GPDIR0]
    movs r2, 1
    lsls r2, r2, #LED_PIN
    str r2, [r1]

loop:
    ldr r1, [r0, #GPSET0]  @ Definir o bit do pino como 1
    movs r2, 1
    lsls r2, r2, #LED_PIN
    str r2, [r1]

    movs r3, #1000000
delay_loop:
    subs r3, r3, #1
    bne delay_loop

    ldr r1, [r0, #GPCLR0]  @ Limpar o bit do pino como 0
    movs r2, 1
    lsls r2, r2, #LED_PIN
    str r2, [r1]

    movs r3, #1000000
delay_loop2:
    subs r3, r3, #1
    bne delay_loop2

    b loop

    .end

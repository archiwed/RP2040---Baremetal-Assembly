# RP2040 - Baremetal Assembly

 I'll provide a explanation of the Assembly code I wrote to control an LED on the Raspberry Pi Pico. I'll cover everything from basic concepts to the strategy behind the code. This code is designed for the RP2040 microcontroller, which uses the ARM Cortex-M0+ architecture.

**Concepts**

Before diving into the code, it's important to understand a few key concepts:

**ARM Cortex-M0+ Architecture:** 
The Raspberry Pi Pico relies on the RP2040 microcontroller, which is founded on the ARM Cortex-M0+ (ARMv6) architecture. This 32-bit architecture optimizes performance for embedded systems, boasting a reduced instruction set and excellent power efficiency.

**Registers and GPIO:**
Cortex-M0+ microcontrollers have special registers for controlling various processor functionalities, including General-Purpose Input/Output (GPIO) pins.

**Configuring GPIO Pin as Output:**

I load the base address of GPIO into memory using the `ldr r0, =GPIO_BASE` instruction.
I load the `GPDIR0` register, which controls the pin direction (input/output), using `ldr r1, [r0, #GPDIR0]`.
I create a mask for the LED's bit using `movs r2, 1` and `lsls r2, r2, #LED_PIN`.
I set the LED bit as an output (1) using `str r2, [r1]`.

**Main Loop:**

I define a label for the main program loop using `loop:`.

**Turning On the LED:**

I load the `GPSET0` register, which sets a bit to turn on a pin, using `ldr r1, [r0, #GPSET0]`.
I create a mask for the LED's bit using `movs r2, 1` and `lsls r2, r2, #LED_PIN`.
I set the LED bit to 1 to turn on the LED using `str r2, [r1]`.
I introduce a delay using `movs r3, #1000000` and `delay_loop:`.

**Turning Off the LED:**

I load the `GPCLR0` register, which clears a bit to turn off a pin, using `ldr r1, [r0, #GPCLR0]`.
I create a mask for the LED's bit using `movs r2, 1` and `lsls r2, r2, #LED_PIN`.
I set the LED bit to 0 to turn off the LED using `str r2, [r1]`.
I wait again using `movs r3, #1000000` and `delay_loop2:`.

**Returning to the Beginning:**

I jump back to the `loop` label using `b loop`.

**Documentation**

- https://datasheets.raspberrypi.com/rp2040/rp2040-datasheet.pdf
- https://developer.arm.com/documentation/ddi0419/e/
- https://datasheets.raspberrypi.com/pico/pico-datasheet.pdf
- https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#arm-32_bit_EABI

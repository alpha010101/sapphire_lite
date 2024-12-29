
#include <stdint.h>
#include "bsp.h"
#include "gpio.h"
#include "riscv.h"

void main(void) {
    uint32_t led     = 0;

    //----- Initialize BSP

    bsp_init();
    bsp_printf("\n\r=== Xyloni_Test Program 1 ===\r\n");

    //----- Initialize GPIO

    gpio_setOutput( SYSTEM_GPIO_0_IO_CTRL, 0);
    gpio_setOutputEnable( SYSTEM_GPIO_0_IO_CTRL, 0x0f);

    while(1)
    {
    	led++;
    	led = led & 0x0f;
    	gpio_setOutput( SYSTEM_GPIO_0_IO_CTRL, led);
    	bsp_printf("led=%d\r\n",led);
    	bsp_uDelay(500000);
    }
}

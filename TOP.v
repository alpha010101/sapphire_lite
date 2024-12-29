//----------------------------------
// Module Definition
//----------------------------------
module TOP (
    input   CLK,            // system clock, 25MHz (from PLL @ interface area)
    input   RESET_N,        // async reset (from RISC-V IP, not CRESET_N)
    input   PLL_LOCKED,     // PLL Lock  (from PLL @ interface area)
    output  PLL_RESET_N,    // PLL reset (to PLL @ interface area) = not used (fix high)
    
    //----- UART0 (FTDI CDBUS)
    
    output  UART_TXD,
    input   UART_RXD,
   
    //----- JTAG (FTDI BDBUS)
    
    input   JTAG_TCK,
    input   JTAG_TDI,
    output  JTAG_TDO,
    input   JTAG_SEL,
    input   JTAG_CAPTURE,
    input   JTAG_SHIFT,
    input   JTAG_UPDATE, 
    input   JTAG_RESET,

    //----- GPIO
    
    input   [15:0] GPIO_IN, 
    output  [15:0] GPIO_OUT,
    output  [15:0] GPIO_OE,
    
    //----- SPI0 (SPI Flash / FTDI ADBUS)
    
    output  SPI0_CCK, 
    output  SPI0_MOSI_OE,
    input   SPI0_MOSI_IN,
    output  SPI0_MOSI_OUT,
    output  SPI0_MISO_OE,
    input   SPI0_MISO_IN,
    output  SPI0_MISO_OUT, 
    output  SPI0_SS_N, 
    
    //----- I2C0
    
    output  I2C_SDA_OE,
    output  I2C_SDA_OUT,
    input   I2C_SDA_IN,
    output  I2C_SCL_OE,
    output  I2C_SCL_OUT,
    input   I2C_SCL_IN
    
);

//------------------------------------
// RESET
//------------------------------------

wire    ASYCRST;
wire    SYSRESET;
assign ASYNCRST    = ~( RESET_N & PLL_LOCKED);
assign I2C_SDA_OE  = !I2C_SDA_OUT;
assign I2C_SCL_OE  = !I2C_SCL_OUT;
assign PLL_RESET_N = 1'b1;


//----------------------------------
// Sapphire SoC IP Core
//----------------------------------
CORE soc_inst
(
    .io_systemClk                   (CLK),              // input : system clock
    .io_asyncReset                  (ASYNCRST),         // input : master reset, active high
    .io_systemReset                 (SYSRESET),         // output : synchronous reset, active high (debug?)

    .system_gpio_0_io_read          (GPIO_IN ),
    .system_gpio_0_io_writeEnable   (GPIO_OE ),
    .system_gpio_0_io_write         (GPIO_OUT),

    .system_i2c_0_io_scl_read       ( I2C_SCL_IN ),
    .system_i2c_0_io_scl_write      ( I2C_SCL_OUT ),
    .system_i2c_0_io_sda_read       ( I2C_SDA_IN ),
    .system_i2c_0_io_sda_write      ( I2C_SDA_OUT ),

    .system_spi_0_io_sclk_write         (SPI0_CCK ),
    .system_spi_0_io_ss                 (SPI0_SS_N ),
    .system_spi_0_io_data_0_read        (SPI0_MOSI_IN ),
    .system_spi_0_io_data_0_write       (SPI0_MOSI_OUT),
    .system_spi_0_io_data_0_writeEnable (SPI0_MOSI_OE ),
    .system_spi_0_io_data_1_read        (SPI0_MISO_IN ),
    .system_spi_0_io_data_1_write       (SPI0_MISO_OUT),
    .system_spi_0_io_data_1_writeEnable (SPI0_MISO_OE ),
    .system_spi_0_io_data_2_read        (1'b0),
    .system_spi_0_io_data_2_write       (),
    .system_spi_0_io_data_2_writeEnable (),
    .system_spi_0_io_data_3_read        (1'b0),
    .system_spi_0_io_data_3_write       (),
    .system_spi_0_io_data_3_writeEnable (),
 
    .jtagCtrl_tck     (JTAG_TCK    ),
    .jtagCtrl_tdi     (JTAG_TDI    ),
    .jtagCtrl_tdo     (JTAG_TDO    ),
    .jtagCtrl_enable  (JTAG_SEL    ),
    .jtagCtrl_capture (JTAG_CAPTURE),
    .jtagCtrl_shift   (JTAG_SHIFT  ),
    .jtagCtrl_update  (JTAG_UPDATE ),
    .jtagCtrl_reset   (JTAG_RESET  ),
 
    .system_uart_0_io_txd (UART_TXD),
    .system_uart_0_io_rxd (UART_RXD)
 
);

endmodule

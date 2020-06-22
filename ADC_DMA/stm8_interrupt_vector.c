/*	BASIC INTERRUPT VECTOR TABLE FOR STM8 devices
 *	Copyright (c) 2009 STMicroelectronics
 */


#include "stm8l15x_it.h"

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	uint8_t interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

struct interrupt_vector const _vectab[] = {
  {0x82, (interrupt_handler_t)_stext},		/* Reset */
  
  {0x82, (interrupt_handler_t)TRAP_IRQHandler},			/* TRAP - Software interrupt */
  
  {0x82, (interrupt_handler_t)NonHandledInterrupt},		/* Reserved */
	 		
  {0x82, (interrupt_handler_t)FLASH_IRQHandler},			/* irq1 - FLASH interrupt */

  {0x82, (interrupt_handler_t)DMA1_CHANNEL0_1_IRQHandler},			/* irq2 - DMA1 channel0 and channel1 interrupt */
	
  {0x82, (interrupt_handler_t)DMA1_CHANNEL2_3_IRQHandler},			/* irq3 - DMA1 channel2 and channel3 interrupt */

  {0x82, NonHandledInterrupt},			/* irq4 - RTC interrupt */

  {0x82, (interrupt_handler_t)EXTIE_F_PVD_IRQHandler},      /* irq5 - External IT PORTE/F interrupt /PVD interrupt */

  {0x82, NonHandledInterrupt},      /* irq6 - External IT PORTB interrupt */

  {0x82, NonHandledInterrupt},			/* irq7 - External IT PORTD interrupt */

  {0x82, (interrupt_handler_t)EXTI0_IRQHandler},			/* irq8 - External IT PIN0 interrupt */

  {0x82, (interrupt_handler_t)EXTI1_IRQHandler},			/* irq9 - External IT PIN1 interrupt */

  {0x82, (interrupt_handler_t)EXTI2_IRQHandler},			/* irq10 - External IT PIN2 interrupt */

  {0x82, (interrupt_handler_t)EXTI3_IRQHandler},		  /* irq11 - External IT PIN3 interrupt */

  {0x82, (interrupt_handler_t)EXTI4_IRQHandler},      /* irq12 - External IT PIN4 interrupt */

  {0x82, (interrupt_handler_t)EXTI5_IRQHandler},      /* irq13 - External IT PIN5 interrupt */

  {0x82, (interrupt_handler_t)EXTI6_IRQHandler},      /* irq14 - External IT PIN6 interrupt */

  {0x82, (interrupt_handler_t)EXTI7_IRQHandler},      /* irq15 - External IT PIN7 interrupt */

  {0x82, NonHandledInterrupt},      /* irq16 - LCD interrupt */

  {0x82, (interrupt_handler_t)SWITCH_CSS_BREAK_DAC_IRQHandler},      /* irq17 - CLK switch/CSS interrupt/ TIM1 Break interrupt / DAC */

  {0x82, (interrupt_handler_t)ADC1_COMP_IRQHandler},      /* irq18 - ADC1 and Comparator interrupt */

  {0x82, NonHandledInterrupt},      /* irq19 - TIM2 Update/Overflow/Trigger/Break interrupt */

  {0x82, NonHandledInterrupt},      /* irq20 - TIM2 Capture/Compare interrupt */

  {0x82, NonHandledInterrupt},      /* irq21 - TIM3 Update/Overflow/Trigger/Break interrupt */

  {0x82, NonHandledInterrupt},			/* irq22 - TIM3 Capture/Compare interrupt */

  {0x82, (interrupt_handler_t)TIM1_UPD_OVF_TRG_COM_IRQHandler},      /* irq23 - TIM1 Update/Overflow/Trigger/Commutation interrupt */

  {0x82, NonHandledInterrupt},      /* irq24 - TIM1 Capture/Compare interrupt */

  {0x82, (interrupt_handler_t)TIM4_UPD_OVF_TRG_IRQHandler},      /* irq25 - TIM4 Update/Overflow/Trigger interrupt */

  {0x82, (interrupt_handler_t)SPI1_IRQHandler},      /* irq26 - SPI1 interrupt */

  {0x82, NonHandledInterrupt},      /* irq27 - USART1 TX interrupt */

  {0x82, NonHandledInterrupt},      /* irq28 - USART1 RX interrupt */

  {0x82, NonHandledInterrupt},      /* irq29 - I2C1 interrupt */

};

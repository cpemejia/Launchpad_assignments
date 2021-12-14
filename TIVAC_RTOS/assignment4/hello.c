/* TI-RTOS Header files */
  #include <xdc/std.h>
  #include <ti/sysbios/BIOS.h>
  #include <ti/sysbios/knl/Task.h>
  #include <ti/sysbios/knl/Clock.h>

  #include <ti/drivers/GPIO.h>
  #include <ti/drivers/UART.h>
  #include <ti/drivers/ADC.h>
  #include <ti/display/Display.h>
  #include <ti/drivers/PWM.h>
/*
 *  ======== uartecho.c ========
 */
  #include <stdint.h>
  #include <stddef.h>

  /* Driver configuration */
  #include "ti_drivers_config.h"
  /* ADC sample count */
  #define ADC_SAMPLE_COUNT  (10)


/* ADC conversion result variables */
uint16_t adcValue0;
uint32_t adcValue0MicroVolt;
uint16_t adcValue1[ADC_SAMPLE_COUNT];
uint32_t adcValue1MicroVolt[ADC_SAMPLE_COUNT];

static Display_Handle display;





  void myDelay(int count);

  /* Could be anything, like computing primes */
  #define FakeBlockingSlowWork()   myDelay(12000000)
  #define FakeBlockingFastWork()   myDelay(2000000)

  Task_Struct workTask;
  Task_Struct ADCTask;
  /* Make sure we have nice 8-byte alignment on the stack to avoid wasting memory */
  #pragma DATA_ALIGN(workTaskStack, 8)
  #define STACKSIZE 1024
  static uint8_t workTaskStack[STACKSIZE];
  static uint8_t ADCTaskStack[STACKSIZE];

  void ADCt(void)
  {
      ADC_Handle   adc;
      ADC_Params   params;
      int_fast16_t res;

      ADC_Params_init(&params);
      adc = ADC_open(CONFIG_ADC_0, &params);

      /* Blocking mode conversion */
      res = ADC_convert(adc, &adcValue0);
          adcValue0MicroVolt = ADC_convertRawToMicroVolts(adc, adcValue0);

          Display_printf(display, 1, 0, "CONFIG_ADC_0 raw result: %d\n", adcValue0);
          Display_printf(display, 1, 0, "CONFIG_ADC_0 convert result: %d uV\n",
              adcValue0MicroVolt);
      ADC_close(adc);

  }


  Void ADCTaskFunc(UArg arg0, UArg arg1)
  {
      while (1) {
          ADCt();
      }
  }



  void doWork(void)
  {
      GPIO_write(Board_GPIO_LED0, CONFIG_LED_OFF);
      FakeBlockingSlowWork(); /* Pretend to do something useful but time-consuming */
      GPIO_write(Board_GPIO_LED0, CONFIG_LED_ON);
  }

  Void workTaskFunc(UArg arg0, UArg arg1)
  {
      while (1) {

          /* Do work */
          doWork();

          /* Wait a while, because doWork should be a periodic thing, not continuous.*/
          //myDelay(24000000);
          Task_sleep(500 * (1000 / Clock_tickPeriod));
      }
  }


  /*
   *  ======== main ========
   *
   */
  int main(void)
  {
      Board_init();
      GPIO_init();
      PWM_init();
      Display_init();
     // Display_Handle hSerial = Display_open(Display_Type_UART, NULL);

      display = Display_open(Display_Type_UART, NULL);

      Display_printf(display, 1, 0, "Starting the adc channel example\n");

      /* Set up the led task */
      Task_Params workTaskParams;
      Task_Params_init(&workTaskParams);
      workTaskParams.stackSize = STACKSIZE;

      workTaskParams.priority = 2;
      workTaskParams.stack = &ADCTaskStack;

      Task_construct(&ADCTask, ADCTaskFunc, &workTaskParams, NULL);

      workTaskParams.priority = 1;
      workTaskParams.stack = &workTaskStack;

      Task_construct(&workTask, workTaskFunc, &workTaskParams, NULL);

      /* Start kernel. */
      BIOS_start();

      return (0);
  }

  /*
   *  ======== myDelay ========
   *  Assembly function to delay. Decrements the count until it is zero
   *  The exact duration depends on the processor speed.
   */
  __asm("    .sect \".text:myDelay\"\n"
        "    .clink\n"
        "    .thumbfunc myDelay\n"
        "    .thumb\n"
        "    .global myDelay\n"
        "myDelay:\n"
        "    subs r0, #1\n"
        "    bne.n myDelay\n"
        "    bx lr\n");

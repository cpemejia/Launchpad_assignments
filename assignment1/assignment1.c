#include <stdint.h>
#include <stdbool.h>
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/sysctl.h"
#include "driverlib/uart.h"
#include "inc/hw_ints.h"
#include "driverlib/interrupt.h"
#include "driverlib/timer.h"
#include "driverlib/debug.h"
#include "driverlib/adc.h"
#include "utils/uartstdio.h"
#include "driverlib/pwm.h"
#include "driverlib/pin_map.h"
#include "inc/hw_gpio.h"
#include "driverlib/rom.h"
#include "driverlib/rom_map.h"
#include <string.h>

#define PWM_FREQUENCY 100

#ifdef DEBUG
void__error__(char *pcFilename, uint32_t ui32Line)
{
}
#endif



// Globals
uint32_t ui32Period;
char     buffer[4];

uint32_t ui32ADC0Value[4];
volatile uint32_t ui32TempAvg;
volatile uint32_t ui32TempValueC;
volatile uint32_t ui32TempValueF;

volatile uint32_t ui32Load;
volatile uint32_t ui32PWMClock;
volatile uint8_t ui8Adjust;

// UART0 ISR
void UARTIntHandler(void)
{
    uint32_t current;
    current = UARTIntStatus(UART0_BASE, true);
    UARTIntClear(UART0_BASE, current);

    //RED on
    if (UARTCharGet(UART0_BASE) == 'R')
    {
        UARTprintf("Red ON\n");
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, 2); // Red led
        SysCtlDelay(10000000);
    }
    //RED off
    if (UARTCharGet(UART0_BASE) == 'r')
    {
        UARTprintf("Red OFF\n");
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, 0);
        SysCtlDelay(10000000);
    }
    //GREEN on
    if (UARTCharGet(UART0_BASE) == 'G')
    {
        UARTprintf("GREEN ON\n");
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_3, 8); //Green LED
        SysCtlDelay(10000000);
    }
    //GREEN off
    if (UARTCharGet(UART0_BASE) == 'g')
    {
        UARTprintf("GREEN OFF\n");
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_3, 0);
        SysCtlDelay(10000000);
    }
    //BLUE on
    if (UARTCharGet(UART0_BASE) == 'B')
    {
        UARTprintf("Blue ON\n");
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, GPIO_PIN_2); //Blue LED
        SysCtlDelay(10000000);
    }
    //BLUE off
    if (UARTCharGet(UART0_BASE) == 'b')
    {
        UARTprintf("Blue OFF\n");
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, 0);
        SysCtlDelay(10000000);
    }

    if (UARTCharGet(UART0_BASE) == 'T')
    {
        ADCIntClear(ADC0_BASE,2);
        ADCProcessorTrigger(ADC0_BASE,2);

        while(!ADCIntStatus(ADC0_BASE, 2, false))
        {

        }

        ADCSequenceDataGet(ADC0_BASE, 2, ui32ADC0Value);

        ui32TempAvg = (ui32ADC0Value[0] + ui32ADC0Value[1] + ui32ADC0Value[2] + ui32ADC0Value[3] + 2)/4;
        ui32TempValueC = (1475 - ((2475 * ui32TempAvg)) / 4096)/10;
        UARTprintf("C %3d\t",ui32TempValueC );
        UARTprintf("\n");
    }
    if (UARTCharGet(UART0_BASE) == 't')
    {
        ADCIntClear(ADC0_BASE,2);
        ADCProcessorTrigger(ADC0_BASE,2);

        while(!ADCIntStatus(ADC0_BASE, 2, false))
        {

        }

        ADCSequenceDataGet(ADC0_BASE, 2, ui32ADC0Value);

        ui32TempAvg = (ui32ADC0Value[0] + ui32ADC0Value[1] + ui32ADC0Value[2] + ui32ADC0Value[3] + 2)/4;
        ui32TempValueC = (1475 - ((2475 * ui32TempAvg)) / 4096)/10;
        ui32TempValueF = ((ui32TempValueC * 9) + 160) / 5;
        UARTprintf("F %3d\t",ui32TempValueF );
        UARTprintf("\n");
    }
    if (UARTCharGet(UART0_BASE) == 'P')
       {
        UARTprintf("Brighten");
        UARTprintf("\n");
        // Configure PWM
        ui8Adjust = 1;
        MAP_SysCtlPeripheralEnable(SYSCTL_PERIPH_PWM1);
        MAP_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
        MAP_GPIOPinTypePWM(GPIO_PORTF_BASE, GPIO_PIN_1);
        MAP_GPIOPinConfigure(GPIO_PF1_M1PWM5);
        ui32PWMClock = SysCtlClockGet() / 64;
        ui32Load = (ui32PWMClock / PWM_FREQUENCY) - 1;
        PWMGenConfigure(PWM1_BASE, PWM_GEN_2, PWM_GEN_MODE_DOWN);
        PWMGenPeriodSet(PWM1_BASE, PWM_GEN_2, ui32Load);
        MAP_PWMPulseWidthSet(PWM1_BASE, PWM_OUT_5, ui8Adjust * ui32Load / 100);
        MAP_PWMOutputState(PWM1_BASE, PWM_OUT_5_BIT, true);
        MAP_PWMGenEnable(PWM1_BASE, PWM_GEN_2);
        while(ui8Adjust < 100){
        ui8Adjust++;
         MAP_PWMPulseWidthSet(PWM1_BASE, PWM_OUT_5, ui8Adjust * ui32Load / 100);
         MAP_SysCtlDelay(1000000);
        }
        ui8Adjust = 1;
        MAP_PWMOutputState(PWM1_BASE, PWM_OUT_5_BIT, false);
       }
    if (UARTCharGet(UART0_BASE) == 'F')
    {
        UARTprintf("Flash Blue");
        UARTprintf("\n");
        IntEnable(INT_TIMER0A);
        TimerIntEnable(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
        TimerEnable(TIMER0_BASE, TIMER_A);
    }
}

void Timer0IntHandler(void)
{
    // Clear the timer interrupt
    TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT);

    // Read the current state of the GPIO pin and
    // write back the opposite state
    if(GPIOPinRead(GPIO_PORTF_BASE, GPIO_PIN_2))
    {
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3, 0);
    }
    else
    {
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, 4);
    }
}
int main(void) {

    // Configure Clock
    SysCtlClockSet(SYSCTL_SYSDIV_4 | SYSCTL_USE_PLL | SYSCTL_OSC_MAIN | SYSCTL_XTAL_16MHZ);
    //MAP_SysCtlClockSet(SYSCTL_SYSDIV_5|SYSCTL_USE_PLL|SYSCTL_OSC_MAIN|SYSCTL_XTAL_16MHZ);
    MAP_SysCtlPWMClockSet(SYSCTL_PWMDIV_64);
    // Configure peripherals
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);

    // Configure Timer
    SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
    TimerConfigure(TIMER0_BASE, TIMER_CFG_PERIODIC);
    ui32Period = (SysCtlClockGet() / 10)/2;
    TimerLoadSet(TIMER0_BASE, TIMER_A, ui32Period -1);
    // Configure ADC
    SysCtlPeripheralEnable(SYSCTL_PERIPH_ADC0);
    ADCHardwareOversampleConfigure(ADC0_BASE, 32);
    ADCSequenceConfigure(ADC0_BASE, 2, ADC_TRIGGER_PROCESSOR, 0); // Changed to sequencer #2
    ADCSequenceStepConfigure(ADC0_BASE, 2, 0, ADC_CTL_TS);
    ADCSequenceStepConfigure(ADC0_BASE, 2, 1, ADC_CTL_TS);
    ADCSequenceStepConfigure(ADC0_BASE, 2, 2, ADC_CTL_TS);

    ADCSequenceStepConfigure(ADC0_BASE, 2, 3, ADC_CTL_TS|ADC_CTL_IE|ADC_CTL_END);

    //Configure LEDs
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3);

    // Configure pins for UART
    GPIOPinConfigure(GPIO_PA0_U0RX);
    GPIOPinConfigure(GPIO_PA1_U0TX);
    GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);
    UARTClockSourceSet(UART0_BASE, UART_CLOCK_PIOSC);
    UARTStdioConfig(0, 115200, 16000000);

    // Enable interrupts
    IntMasterEnable();
    ADCSequenceEnable(ADC0_BASE, 2);
    ADCIntEnable(ADC0_BASE, 2);

    IntEnable(INT_UART0);
    UARTIntEnable(UART0_BASE, UART_INT_RX | UART_INT_RT);

    // Initial message to terminal display
    UARTprintf("Enter Valid cmd:\n");
    UARTprintf("R : Red LED on. r: Red LED off.\n");
    UARTprintf("B : Blue LED on. b: Blue LED off.\n");
    UARTprintf("G : Green LED on. g: Green LED off.\n");
    UARTprintf("T : Temp in C. t: Temp in F.\n");
    UARTprintf("P : Brighten Red LED. F: Flash Blue LED.");
    UARTprintf("\n");
    while (1)  // Wait forever
    {

    }

}

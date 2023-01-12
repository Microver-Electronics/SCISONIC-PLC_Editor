#include <stdlib.h>
extern "C" {
#include "openplc.h"
}
#include "Arduino.h"

//OpenPLC HAL for Micro BCM board (SCISONIC)
/******************PINOUT CONFIGURATION**************************
Digital Out: PB3, PB4, PB5, PB6, PB7, PB15, PB14, PC13 				(%QX0.0 - %QX0.7)
Analog In:   PA0, PA1, PA2, PA3, PA4                 	    		(%IW0 - %IW4)
*****************************************************************/


//Define the number of inputs and outputs for this board
#define NUM_DISCRETE_INPUT          0
#define NUM_ANALOG_INPUT            5
#define NUM_DISCRETE_OUTPUT         8
#define NUM_ANALOG_OUTPUT           0

uint8_t pinMask_DIN[] = {};
uint8_t pinMask_DOUT[] = { PB3, PB4, PB5, PB6, PB7, PB15, PB14, PC13 };
uint8_t pinMask_AIN[] = { PA0, PA1, PA2, PA3, PA4 };
uint8_t pinMask_AOUT[] = {};

void hardwareInit()
{
    for (int i = 0; i < NUM_DISCRETE_INPUT; i++)
    {
        pinMode(pinMask_DIN[i], INPUT);
    }

    for (int i = 0; i < NUM_ANALOG_INPUT; i++)
    {
        pinMode(pinMask_AIN[i], INPUT);
    }

    for (int i = 0; i < NUM_DISCRETE_OUTPUT; i++)
    {
        pinMode(pinMask_DOUT[i], OUTPUT);
    }

    for (int i = 0; i < NUM_ANALOG_OUTPUT; i++)
    {
        pinMode(pinMask_AOUT[i], OUTPUT);
    }
}

void updateInputBuffers()
{
    for (int i = 0; i < NUM_DISCRETE_INPUT; i++)
    {
        if (bool_input[i / 8][i % 8] != NULL)
            *bool_input[i / 8][i % 8] = digitalRead(pinMask_DIN[i]);
    }

    for (int i = 0; i < NUM_ANALOG_INPUT; i++)
    {
        if (int_input[i] != NULL)
            *int_input[i] = (analogRead(pinMask_AIN[i]) * 16);
    }
}

void updateOutputBuffers()
{
    for (int i = 0; i < NUM_DISCRETE_OUTPUT; i++)
    {
        if (bool_output[i / 8][i % 8] != NULL)
            digitalWrite(pinMask_DOUT[i], *bool_output[i / 8][i % 8]);
    }
    for (int i = 0; i < NUM_ANALOG_OUTPUT; i++)
    {
        if (int_output[i] != NULL)
            analogWrite(pinMask_AOUT[i], (*int_output[i] / 256));
    }
}

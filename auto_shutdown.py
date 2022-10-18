#!/usr/bin/env python3

import time
import RPi.GPIO as GPIO
import subprocess

POWER_STATUS_PIN = 26
GPIO.setmode(GPIO.BCM)
GPIO.setup(POWER_STATUS_PIN, GPIO.IN)

GPIO.wait_for_edge(POWER_STATUS_PIN, GPIO.FALLING)


def close_firefox():
    subprocess.run(['kill', '-9', '$(ps -x | grep firefox)'])


if GPIO.input(POWER_STATUS_PIN) == 0:
    close_firefox()
    time.sleep(3)
    subprocess.run(['sudo', 'shutdown', '-h', 'now'], shell=False)
    # print('AC OFF')
else:
    print('AC ON')
time.sleep(1)

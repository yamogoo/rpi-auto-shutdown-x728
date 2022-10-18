#!/usr/bin/env python3

import time
import RPi.GPIO as GPIO
import subprocess

POWER_STATUS_PIN = 26
GPIO.setmode(GPIO.BCM)
GPIO.setup(POWER_STATUS_PIN, GPIO.IN)

GPIO.wait_for_edge(POWER_STATUS_PIN, GPIO.FALLING)

if POWER_STATUS_PIN is None:
    print('AC ON')
else:
    time.sleep(1)
    subprocess.run(['sudo', 'shutdown', '-h', 'now'], shell=False)
    # print('AC OFF')
    # subprocess.run(['kill', '-9', '$(ps -x | grep firefox)'])

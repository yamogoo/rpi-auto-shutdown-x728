#!/usr/bin/env python3

import time
import RPi.GPIO as GPIO
import subprocess

POWER_STATUS_PIN = 26
GPIO.setmode(GPIO.BCM)
GPIO.setup(POWER_STATUS_PIN, GPIO.IN)

loop = True

GPIO.wait_for_edge(POWER_STATUS_PIN, GPIO.FALLING)


while loop:
    if GPIO.input(POWER_STATUS_PIN) == 0:
        loop = False
        time.sleep(2)
        subprocess.run(['sudo', 'shutdown', '-h', 'now'], shell=False)
    time.sleep(1)

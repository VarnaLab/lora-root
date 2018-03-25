#!/bin/bash

/bin/ping -i 30 lora.varnalab.org 1> /dev/null 2> /dev/null &

echo $0 starting...

while (true) do
	/usr/bin/ssh -n -N -R 2232:127.0.0.1:22 varnalab_lora@lora.varnalab.org
	logger $0 disconnected!
	sleep 30
done

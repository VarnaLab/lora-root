#!/bin/bash

/bin/ping -i 30 lora.varnalab.org 1> /dev/null 2> /dev/null &

# ports binding
rnd=$(( ( RANDOM % 10 )  + 2240 ))
case `/bin/hostname` in
	lora-gw-01*) port=2231 ;;
	lora-gw-02*) port=2232 ;;
	lora-gw-03*) port=2233 ;;
	lora-gw-04*) port=2234 ;;
	lora-gw-05*) port=2235 ;;
	lora-gw-06*) port=2236 ;;
	lora-gw-07*) port=2237 ;;
	*) port=${rnd} ;;
esac

echo $0 starting, port is ${port}...

while (true) do
	/usr/bin/ssh -o "ExitOnForwardFailure yes" -o "ServerAliveInterval 10" -n -N -R ${port}:127.0.0.1:22 varnalab_lora@lora.varnalab.org
	/usr/bin/logger $0 disconnected!
	sleep 30
done

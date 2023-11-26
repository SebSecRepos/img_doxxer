#!/bin/bash

ps -faux | grep -E 'ssh -R|grep|python3 -m|sed' | awk '{print $2}' | xargs kill -9  2>/dev/null
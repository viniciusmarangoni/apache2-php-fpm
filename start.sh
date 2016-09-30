#!/bin/bash
service php5-fpm start
bash &
apache2ctl -D FOREGROUND


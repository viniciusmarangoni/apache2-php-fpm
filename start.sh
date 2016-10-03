#!/bin/bash
exec php5-fpm &
apache2ctl -D FOREGROUND


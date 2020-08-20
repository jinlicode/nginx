#!/bin/bash

service cron restart
nginx -g 'daemon off;'
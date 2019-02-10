#!/bin/bash

# try to curl-get ${APP_HOST}:${APP_PORT} for 10 seconds to check that app is running

# APP_HOST - host name/ip
# APP_PORT - host port 

if ( [[ -z "${APP_HOST}" ]] || [[ -z "${APP_PORT}" ]] ); then
	echo "set APP_HOST and APP_PORT"
	exit 1
fi

APP_RUNNING=""
# while [[ -z $APP_RUNNING ]]; do
	for i in $(seq 10); do
  		curl --get --head "${APP_HOST}":"${APP_PORT}" 2>/dev/null
  		if [[ $? -eq 0 ]]; then
  			APP_RUNNING=true
  		  	break
  		fi
  		echo "Waiting for app (${APP_HOST}:${APP_PORT})..."
  		sleep 1
	done
# done

( [[ "$APP_RUNNING" == true ]] && exit 0 ) || exit 1

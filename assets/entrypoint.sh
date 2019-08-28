#!/usr/bin/env bash

set -e
source /assets/colorecho

echo_yellow " - Checking if DB is installed:"
if [ ! -d "/opt/oracle/app/product/11.2.0/dbhome_1" ]; then
	echo_yellow "     Database is not installed. Installing..."
	/assets/install.sh
fi

su oracle -c "/assets/entrypoint_oracle.sh"


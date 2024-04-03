#!/bin/bash
# Check ADE Password v0.2 | Updated: 02/15/23
# Script to check if the ADE password documented in Mosyle is correct. 

ADEADMIN="USERNAME"
PASSWORDINPUT="%DEP_PASSWORD%"

verifyPasswordForUser() {
    VERIFYPASSWORD=$(dscl /Local/Default -authonly "${ADEADMIN}" "${PASSWORDINPUT}")
    if [ -z "$VERIFYPASSWORD" ]; then
      return 0
    else
      return 1
    fi
}

if verifyPasswordForUser; then
	echo "ADE Admin password is correct."
else
	echo "ADE Admin password is NOT correct."
fi

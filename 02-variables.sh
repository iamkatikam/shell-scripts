#!/bin/bash

NUMBER1=30
NUMBER2=20

# Perform addition
SUM=$((NUMBER1 + NUMBER2))
# Perform subtraction
DIFF=$((NUMBER1 - NUMBER2))
# Perform multiplication
PROD=$((NUMBER1 * NUMBER2))
# Perform division
if [ $NUMBER2 -ne 0 ]; then
    DIV=$((NUMBER1 / NUMBER2))
else
    DIV="undefined (division by zero)"
fi
# Perform modulus
MOD=$((NUMBER1 % NUMBER2))
# Perform exponentiation
EXP=$((NUMBER1 ** 2))


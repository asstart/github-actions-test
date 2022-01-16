#!/bin/bash

echo "Testing secret validity"

if [[ -z $SUPER_SECRET ]]; then
    echo "Oh, secret is emtpy"
elif [[ ${#SUPER_SECRET} lt 5 ]]; then
    echo "Oh, secret is too short, probably it's wrong"
else
    echo "Secret is ok, we can go further"
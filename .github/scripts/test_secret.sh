#!/bin/bash

echo "Testing secret validity"

if [[ ${#SUPER_SECRET} lt 5 ]]; then
    echo "Oh, secrets is too short, probably it's wrong"
else
    echo "Secret is ok, we can go further"
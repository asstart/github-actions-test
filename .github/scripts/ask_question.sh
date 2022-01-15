#!/bin/bash

echo "And asked question is: $THE_QUESTION"

echo "Need a bit of time to figure out answer..."
echo "Approximately about 10 million years..."
echo "huh..."

sleep 10s

echo "Answer have found out"

ANSWER_FILE="answer.txt"

echo "
───────────────────────────────
─██████──██████─██████████████─
─██░░██──██░░██─██░░░░░░░░░░██─
─██░░██──██░░██─██████████░░██─
─██░░██──██░░██─────────██░░██─
─██░░██████░░██─██████████░░██─
─██░░░░░░░░░░██─██░░░░░░░░░░██─
─██████████░░██─██░░██████████─
─────────██░░██─██░░██─────────
─────────██░░██─██░░██████████─
─────────██░░██─██░░░░░░░░░░██─
─────────██████─██████████████─
───────────────────────────────" > "$ANSWER_FILE"

echo "Answer saved to the $ANSWER_FILE"
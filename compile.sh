#!/usr/bin/env bash

cd src
gcc -o ../hash_table main.c prime.c hash_table.c -lm
cd -

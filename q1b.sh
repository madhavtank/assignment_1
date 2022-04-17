#!/bin/bash
awk '!x[$0]++' quotes.txt

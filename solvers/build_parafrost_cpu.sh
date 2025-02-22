#!/usr/bin/env bash
cd ParaFROST
./install.sh --cpu --cextra="-march=native -funroll-loops"

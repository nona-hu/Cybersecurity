#!/bin/bash

#check if sysd has sudo access

sudo -l && echo SUCCESS || echo FAIL

sudo apt update && echo SUCCESS || echo FAIL

sudo apt upgrade && echo SUCCESS || echo FAIL

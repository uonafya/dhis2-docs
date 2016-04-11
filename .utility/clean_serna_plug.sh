#!/bin/bash
find ../src/ -type f -readable -writable -exec sed -i "s/<\([!]\)-- This document was created with Syntext Serna Free\. -->//g" {} \;

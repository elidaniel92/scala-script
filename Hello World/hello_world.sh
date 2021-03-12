#!/bin/bash
exec scala "$0" "$@"
!#

println("Hello, world!")
args foreach println 

#!/bin/bash
exec scala "$0" "$@"
!#

import sys.process._

//STDOUT
println("Hello, I'm another Scala Script")

//STDERR
Console.err.println("Error 24!")

// Exit Code Number
sys.exit(24)

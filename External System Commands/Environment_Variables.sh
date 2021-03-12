#!/bin/bash
exec scala -savecompiled "$0" "$@"
!#

import sys.process._

("echo $HOME").! // Not print User Directory.

("echo " + sys.env("HOME")).! // Now is right, print User Directory.
println()

// Print all variables.
sys.env foreach println

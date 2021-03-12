#!/bin/bash
exec scala -savecompiled "$0" "$@"
!#

import sys.process._

Seq("find", "./", "-type", "f", "-iname", "*.sh").!

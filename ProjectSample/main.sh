#!/bin/bash
exec scala -savecompiled -classpath ./bin/ "$0" "$@"
!#

import Resource._

val (stdout, stderr, status) = runProcess("ls")

println("STDOUT: " + stdout)
println("STDERR: " + stderr)
println("Status " + status)
println

AnotherResource.greet("John", 18)
println(HTML.txt("Something", true, true))
JavaClass.method()

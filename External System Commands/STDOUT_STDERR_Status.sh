#!/bin/bash
exec scala -savecompiled "$0" "$@"
!#

import sys.process._
import java.io.File

// It will output text to the terminal. 
val returnCode = "echo \"Hello World!\"".!
println("Return code from last command: " + returnCode)
println()

// Get STDOUT
val output = "whatis echo".!!
println("What is Echo?\n" + output)
println()

/*
 * If the return code is not equal to zero,
 * the "!!" method will throw a RuntimeException.
 * It is not possible use the "!!" method to run a diff program
 * because it return 1 when differences were found. 
 */
 
//val diffOutput = "diff -y folder/ other_scripts/".!! // It does not work, comment this.

// A solution for the above problem
var stdout = new StringBuilder
var stderr = new StringBuilder
val status = "diff -y folder/ other_scripts/".!(ProcessLogger(stdout append _ append "\n", stderr append _ append "\n"))

println("Status: " + status)
println("STDOUT: \n" + stdout)
println("STDERR: " + stderr)

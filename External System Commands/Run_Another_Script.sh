#!/bin/bash
exec scala -savecompiled "$0" "$@"
!#

import sys.process._

// Bellow a function to get stdout, stderr and exit code.
def runProcess(process: ProcessBuilder) = { 
  val stdout = new StringBuilder
  val stderr = new StringBuilder
  val status = process.!(ProcessLogger(stdout append _ append "\n", stderr append _ append "\n"))
  (stdout, stderr, status)
}

// Run a Scala Script
val (stdout, stderr, status) = runProcess("./other_scripts/another_scala_script.sh")
print("STDOUT: " + stdout)
print("STDERR: " + stderr)
if(status == 0) println("Another Scala Script OK") else println("Another Scala Script Not OK")
println()

// It is not possible to call bash function.
// Bellow it is called indirectly with a bash script.
"./other_scripts/exec_bash_func.sh".!
println()

// Running a Interactive Bash Script
val returnCode = "./other_scripts/interactive_bash_script.sh".run(true).exitValue()
println(returnCode.toString + "\n")

// cp interactive (prompt before overwrite)
"cp --interactive -v file.txt -t folder/".run(true).exitValue()












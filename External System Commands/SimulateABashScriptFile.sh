#!/bin/bash
exec scala -savecompiled "$0" "$@"
!#

import java.io.File
import java.io.FileWriter

/*
 * Execute the commands in a temporary bash script file.
 * Don't need a bash script header.
 */
def executeBash(bashCommands: String): Integer = {
  val file = File.createTempFile("tmp_bash_script", ".sh", new File("./"))
  file.deleteOnExit
  file.setExecutable(true)
  val writer = new FileWriter(file)
  writer.write("#!/bin/bash\n" + bashCommands)
  writer.close
  val status = sys.process.Process("./" + file.getName).run(true).exitValue()
  file.delete
  return status
}

val bashCommands = Seq(
      "echo -n \"Enter first number: \"",
      "read x",
      "echo -n \"Enter second number: \"",
      "read y",
      "(( sum=x+y ))",
      "echo \"The result of addition = $sum\"",
      "exit 0;"
  ).map(_ + "\n").reduce(_ + _)
  
if(executeBash(bashCommands) != 0) println("Exit Code is different from zero!")
                

